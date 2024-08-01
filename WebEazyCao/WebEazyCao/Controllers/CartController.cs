using Microsoft.AspNetCore.Mvc;
using System.Linq;
using WebEazyCao.Helper;
using WebEazyCao.Models;
using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;
using WebEazyCao.Services;
using WebEazyCao.DAO;
using WebEazyCao.ViewModels;
using WebEazyCao.Queue;
using Microsoft.EntityFrameworkCore;

namespace WebEazyCao.Controllers
{
    [MenuActionFilter]
    [AdvActionFilter]
    [FooterActionFilter]
    public class CartController : Controller
    {
        private readonly IBackgroundTaskQueue _taskQueue;
        private readonly IVnPayCartService _vpnPayCartService;
        private readonly BanTheCaoContext db;
        private readonly ILogger<CartController> _logger;

        public CartController(IBackgroundTaskQueue taskQueue, IVnPayCartService vpnPayCartService, BanTheCaoContext context, ILogger<CartController> logger)
        {
            _taskQueue = taskQueue;
            _vpnPayCartService = vpnPayCartService;
            db = context;
            _logger = logger;
        }

        public IActionResult Index()
        {
            var userId = HttpContext.Session.GetInt32("User");
            var cart = db.Orders
                .Where(o => o.UserId == userId && o.Product != null)
                .Select(o => new Item
                {
                    Id = o.ProductId.Value,
                    Name = o.Product.Name,
                    Price = o.Product.Price,
                    Image = o.Product.Image,
                    Quantity = o.Quantity.Value
                })
                .ToList();

            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);

            ViewBag.cart = cart;
            ViewBag.countItems = cart.Count;
            ViewBag.total = cart.Sum(item => item.Price * item.Quantity);
            HttpContext.Session.SetInt32("quantity", cart.Select(item => item.Id).Distinct().Count());
            return View();
        }


        [HttpPost]
        public JsonResult ApplyVoucher(string code)
        {
            var voucher = db.Vouchers.FirstOrDefault(v => v.Name == code && v.IsActive == true && v.IsDelete == false);
            if (voucher == null)
            {
                return Json(new { success = false, message = "Mã voucher không hợp lệ hoặc đã hết lượt sử dụng vui lòng kiểm tra lại." });
            }

            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            if (cart == null || !cart.Any())
            {
                return Json(new { success = false, message = "Giỏ hàng trống." });
            }

            decimal discount = voucher.Discount;
            var total = cart.Sum(item => item.Price * item.Quantity);
            decimal discountedTotal;

            if (voucher.Type == 1)
            {
                discountedTotal = total - (total * discount / 100);
            }
            else if (voucher.Type == 2)
            {
                discountedTotal = total - discount;
            }
            else
            {
                return Json(new { success = false, message = "Loại voucher không hợp lệ." });
            }

            HttpContext.Session.SetString("DiscountedTotal", discountedTotal.ToString());
            HttpContext.Session.SetString("VoucherCode", code);


            if (voucher.RemainUsed == 1)
            {
                voucher.RemainUsed = 0;
                voucher.IsActive = false;
            }
            else
            {
                voucher.RemainUsed -= 1;
            }
            db.SaveChanges();

            return Json(new { success = true, total = discountedTotal, discount = discount, type = voucher.Type, message = "Áp dụng mã giảm giá thành công." });
        }




        public IActionResult GetVouchers()
        {
            var vouchers = db.Vouchers.Where(v => v.IsActive == true).ToList();
            return View(vouchers);
        }
        [HttpPost]
        public JsonResult Buy(int id, int quantity = 1)
        {
            var product = db.Products.Find(id);
            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            if (quantity > product.Quantity)
            {
                return Json(new { success = false, message = "Số lượng mua vượt quá số lượng sản phẩm còn lại." });
            }
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return Json(new { success = false, message = "Bạn cần phải đăng nhập để mua hàng.", loginRequired = true });
            }

            var user = db.Users.Find(userId);
            if (user == null)
            {
                return Json(new { success = false, message = "Người dùng không tồn tại." });
            }

            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart") ?? new List<Item>();
            if (cart == null)
            {
                cart = new List<Item>();
            }

            int index = isExist(id, cart);
            if (index != -1)
            {
                if (cart[index].Quantity + quantity > product.Quantity)
                {
                    return Json(new { success = false, message = "Số lượng mua vượt quá số lượng sản phẩm còn lại." });
                }
                cart[index].Quantity += quantity;
            }
            else
            {
                cart.Add(new Item { Id = product.Id, Name = product.Name, Price = product.Price, Image = product.Image, Quantity = quantity });
            }
            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);

            var order = db.Orders
                .FirstOrDefault(o => o.UserId == HttpContext.Session.GetInt32("User") && o.ProductId == product.Id && o.Product != null);

            if (order != null)
            {
                order.Quantity += quantity;
            }
            else
            {
                order = new Order
                {
                    UserId = HttpContext.Session.GetInt32("User"),
                    Quantity = quantity,
                    ProductId = product.Id
                };
                db.Orders.Add(order);
            }
            db.SaveChanges();

            int totalUniqueProducts = cart.Select(item => item.Id).Distinct().Count();
            HttpContext.Session.SetInt32("quantity", totalUniqueProducts);
            return Json(new { success = true, quantity = totalUniqueProducts });
        }


        public IActionResult Remove(int id)
        {
            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            int index = isExist(id, cart);
            if (index != -1)
            {
                // Xóa sản phẩm khỏi giỏ hàng
                cart.RemoveAt(index);
                SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);

                // Xóa sản phẩm khỏi cơ sở dữ liệu
                var userId = HttpContext.Session.GetInt32("User");
                var orderDetail = db.Orders.FirstOrDefault(od => od.UserId == userId && od.ProductId == id);
                if (orderDetail != null)
                {
                    db.Orders.Remove(orderDetail);
                    db.SaveChanges();
                }
            }
            var total = cart.Sum(item => item.Price * item.Quantity);
            int uniqueItems = cart.Select(item => item.Id).Distinct().Count();
            HttpContext.Session.SetInt32("quantity", uniqueItems);
            return Json(new { success = true, total = total, countItems = uniqueItems });
        }
        public IActionResult CheckOut()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return Json(new { success = false, message = "Vui lòng đăng nhập.", loginRequired = true });
            }

            var user = db.Users.Find(userId);
            if (user == null)
            {
                return Json(new { success = false, message = "Người dùng không tồn tại." });
            }

            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            if (cart == null || !cart.Any())
            {
                return Json(new { success = false, message = "Giỏ hàng trống." });
            }

            var userMoney = user.Money.HasValue ? user.Money.Value : 0;
            var discountedTotalStr = HttpContext.Session.GetString("DiscountedTotal");
            decimal discountedTotal = string.IsNullOrEmpty(discountedTotalStr) ? cart.Sum(item => item.Price * item.Quantity) : decimal.Parse(discountedTotalStr);

            if (userMoney < discountedTotal)
            {
                return Json(new
                {
                    success = false,
                    message = "Số tiền trong tài khoản của bạn không đủ vui lòng nạp thêm hoặc thanh toán qua phương thức khác.",
                    redirectUrl = Url.Action("Recharge", "Deposits")
                });
            }

            if (TaskStatusStorage.IsTaskInProgressForUser(userId.Value))
            {
                return Json(new { success = false, message = "Đơn hàng của bạn đang được xử lý." });
            }

            var taskId = Guid.NewGuid();
            TaskStatusStorage.SetTaskStatus(taskId, "Processing", userId.Value);

            _logger.LogInformation($"Queueing background task for user {userId} with taskId {taskId}");

            _taskQueue.QueueBackgroundWorkItem(async (token, serviceProvider) =>
            {
                using (var scope = serviceProvider.CreateScope())
                {
                    var dbContext = scope.ServiceProvider.GetRequiredService<BanTheCaoContext>();
                    try
                    {
                        await ProcessOrderAsync(userId.Value, cart, dbContext, token, userMoney, taskId, discountedTotal);
                    }
                    catch (InvalidOperationException ex)
                    {
                        TaskStatusStorage.SetTaskStatus(taskId, $"Failed: {ex.Message}", userId.Value);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, $"Error processing order for user {userId}");
                        TaskStatusStorage.SetTaskStatus(taskId, "Failed: An error occurred while processing your order.", userId.Value);
                    }
                }
            });

            return Json(new { success = true, message = "Đơn hàng của bạn đang được xử lý.", taskId });
        }





        private async Task ProcessOrderAsync(int userId, List<Item> cart, BanTheCaoContext dbContext, CancellationToken token, decimal userMoney, Guid taskId, decimal discountedTotal)
        {
            string taskStatus = "Completed";
            try
            {
                await using var transaction = await dbContext.Database.BeginTransactionAsync(token);

                var orderHistories = new List<OrderHistory>();
                var orderHistoryDetails = new List<OrderHistoryDetail>();
                decimal totalAmount = 0;

                foreach (var item in cart)
                {
                    var order = await dbContext.Orders
                        .FirstOrDefaultAsync(o => o.UserId == userId && o.ProductId == item.Id && o.Product != null, token);

                    if (order != null)
                    {
                        dbContext.Orders.Remove(order);
                    }

                    totalAmount += item.Price * item.Quantity;

                    var orderHistory = new OrderHistory
                    {
                        UserId = userId,
                        ProductId = item.Id,
                        Date = DateTime.Now,
                        Quantity = item.Quantity,
                        TotalPrice = discountedTotal,
                        ProductName = item.Name
                    };

                    await dbContext.OrderHistories.AddAsync(orderHistory, token);
                    await dbContext.SaveChangesAsync(token); // Save here to generate OrderHistory ID

                    var productDetails = await dbContext.ProductDetails
                        .Where(pd => pd.ProductId == item.Id && !pd.IsDelete)
                        .Take(item.Quantity)
                        .ToListAsync(token);

                    // Get CategoryId from Product
                    var product = await dbContext.Products
                        .FirstOrDefaultAsync(p => p.Id == item.Id, token);

                    if (product == null || product.CategoryId == null)
                    {
                        throw new Exception($"CategoryID của sản phẩm {item.Name} không được xác định.");
                    }
                    if (product.Quantity < item.Quantity)
                    {
                        throw new InvalidOperationException($"Không đủ số lượng sản phẩm {item.Name} trong kho.");
                    }

                    product.Quantity -= item.Quantity; // Reduce the stock quantity
                    dbContext.Products.Update(product); // Update the product

                    foreach (var productDetail in productDetails)
                    {
                        orderHistoryDetails.Add(new OrderHistoryDetail
                        {
                            ProductDetailId = productDetail.Id,
                            OrderHistoryId = orderHistory.Id,
                            CategoryId = product.CategoryId.Value, // Use CategoryId from product
                            Serial = productDetail.Serial,
                            Code = productDetail.Code,
                            ProductName = item.Name
                        });

                        productDetail.IsDelete = true;
                    }
                }

                await dbContext.OrderHistoryDetails.AddRangeAsync(orderHistoryDetails, token);
                await dbContext.SaveChangesAsync(token);

                if (userMoney < discountedTotal)
                {
                    throw new InvalidOperationException("Số tiền trong tài khoản của bạn không đủ vui lòng nạp thêm hoặc thanh toán qua phương thức khác.");
                }

                var user = await dbContext.Users.FindAsync(userId, token);
                if (user != null)
                {
                    user.Money -= discountedTotal;
                    dbContext.Users.Update(user);
                    await dbContext.SaveChangesAsync(token);
                }

                await transaction.CommitAsync(token);

                _logger.LogInformation($"Order processed for user {userId}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error processing order for user {userId}");
                taskStatus = $"Failed: {ex.Message}";
            }
            finally
            {
                TaskStatusStorage.SetTaskStatus(taskId, taskStatus, userId);
            }
        }

        public IActionResult CheckTaskStatus(Guid taskId)
        {
            var status = TaskStatusStorage.GetTaskStatus(taskId) ?? "Pending";
            return Json(new { status = status });
        }




        public IActionResult Thanks()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }
            var user = db.Users.FirstOrDefault(u => u.Id == userId);
            HttpContext.Session.SetString("UserMoney", user.Money.HasValue ? user.Money.Value.ToString("0.000") : "0");
            CartQuantity();
            return View();
        }
        [HttpPost]
        public JsonResult IncreaseQuantity(int id)
        {
            var product = db.Products.Find(id);
            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            int index = isExist(id, cart);
            if (index != -1)
            {
                if (cart[index].Quantity + 1 > product.Quantity)
                {
                    return Json(new { success = false, message = "Số lượng mua vượt quá số lượng sản phẩm còn lại." });
                }
                cart[index].Quantity++;

                // Cập nhật số lượng trong cơ sở dữ liệu
                var userId = HttpContext.Session.GetInt32("User");
                var orderDetail = db.Orders.FirstOrDefault(od => od.UserId == userId && od.ProductId == id);
                if (orderDetail != null)
                {
                    orderDetail.Quantity++;
                    db.SaveChanges();
                }
            }
            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
            var total = cart.Sum(item => item.Price * item.Quantity);
            HttpContext.Session.SetInt32("quantity", cart.Count);
            return Json(new { success = true, quantity = cart[index].Quantity, total = total, countItems = cart.Count });
        }

        [HttpPost]
        public JsonResult DecreaseQuantity(int id)
        {
            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            int index = isExist(id, cart);
            if (index != -1 && cart[index].Quantity > 1)
            {
                cart[index].Quantity--;

                // Cập nhật số lượng trong cơ sở dữ liệu
                var userId = HttpContext.Session.GetInt32("User");
                var orderDetail = db.Orders.FirstOrDefault(od => od.UserId == userId && od.ProductId == id);
                if (orderDetail != null)
                {
                    orderDetail.Quantity--;
                    db.SaveChanges();
                }
            }
            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cart);
            var total = cart.Sum(item => item.Price * item.Quantity);
            HttpContext.Session.SetInt32("quantity", cart.Count);
            return Json(new { success = true, quantity = cart[index].Quantity, total = total, countItems = cart.Count });
        }
        private int isExist(int id, List<Item> cart)
        {
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].Id == id)
                {
                    return i;
                }
            }
            return -1;
        }

        [HttpPost]
        public IActionResult VnPayCart()
        {
            if (ModelState.IsValid)
            {
                List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
                if (cart == null || !cart.Any())
                {
                    TempData["Message"] = "Giỏ hàng trống.";
                    return Json(new { success = false, message = "Giỏ hàng trống." });
                }
                var discountedTotalStr = HttpContext.Session.GetString("DiscountedTotal");
                float discountedTotal = string.IsNullOrEmpty(discountedTotalStr) ? (float)cart.Sum(item => item.Price * item.Quantity * 100000) : float.Parse(discountedTotalStr); ;

                string id = VnPayDAO.GenerateCodeDeposit(); // Thay bằng logic tạo mã đơn hàng của bạn
                var vnPayModel = new VnPaymentCartRequestModel
                {
                    Amount = discountedTotal,
                    CreatedDate = DateTime.Now,
                    Description = "Thanh toán đơn hàng", // Mô tả đơn hàng
                    Id = id,
                };

                // Tạo URL thanh toán
                var paymentUrl = _vpnPayCartService.CreatePaymentUrl(HttpContext, vnPayModel);

                // In ra URL để kiểm tra
                Console.WriteLine($"Payment URL: {paymentUrl}");

                // Trả về phản hồi JSON chứa URL
                return Json(new { success = true, url = paymentUrl });
            }
            return Json(new { success = false, message = "Dữ liệu không hợp lệ." });
        }

        public IActionResult PaymentFail()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            return View();
        }

        public IActionResult PaymentSuccess()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }
            var user = db.Users.FirstOrDefault(u => u.Id == userId);
            HttpContext.Session.SetString("UserMoney", user.Money.HasValue ? user.Money.Value.ToString("0.000") : "0");
            CartQuantity();
            return View();
        }

        public IActionResult PaymentCallBack()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (Request.Query.Count == 0)
            {
                TempData["Message"] = $"Lỗi thanh toán VN Pay";
                return RedirectToAction("PaymentFail");
            }

            var response = _vpnPayCartService.PaymentExecute(Request.Query);
            if (response == null || response.VnPayReponseCode != "00") // Gia tri 00 la thanh cong
            {
                TempData["Message"] = $"Lỗi thanh toán VN Pay: {response.VnPayReponseCode}";
                return RedirectToAction("PaymentFail");
            }

            List<Item> cart = SessionHelper.GetObjectFromJson<List<Item>>(HttpContext.Session, "cart");
            var discountedTotalStr = HttpContext.Session.GetString("DiscountedTotal");
            decimal discountedTotal = string.IsNullOrEmpty(discountedTotalStr) ? cart.Sum(item => item.Price * item.Quantity * 100000) : decimal.Parse(discountedTotalStr);
            if (cart != null)
            {
                if (TaskStatusStorage.IsTaskInProgressForUser(userId.Value))
                {
                    return Json(new { success = false, message = "Đơn hàng của bạn đang được xử lý." });
                }

                var taskId = Guid.NewGuid();
                TaskStatusStorage.SetTaskStatus(taskId, "Processing", userId.Value);

                _logger.LogInformation($"Queueing background task for user {userId} with taskId {taskId}");

                _taskQueue.QueueBackgroundWorkItem(async (token, serviceProvider) =>
                {
                    using (var scope = serviceProvider.CreateScope())
                    {
                        var dbContext = scope.ServiceProvider.GetRequiredService<BanTheCaoContext>();
                        try
                        {
                            await ProcessOrderVnPayAsync(userId.Value, cart, dbContext, token, taskId, discountedTotal);
                        }
                        catch (InvalidOperationException ex)
                        {
                            TaskStatusStorage.SetTaskStatus(taskId, $"Failed: {ex.Message}", userId.Value);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogError(ex, $"Error processing order for user {userId}");
                            TaskStatusStorage.SetTaskStatus(taskId, "Failed: An error occurred while processing your order.", userId.Value);
                        }
                    }
                });
                TempData["Message"] = $"Thanh toán VN Pay thành công";
                return RedirectToAction("PaymentSuccess");
            }

            TempData["Message"] = $"Lỗi thanh toán VN Pay";
            return RedirectToAction("PaymentFail");
        }

        private async Task ProcessOrderVnPayAsync(int userId, List<Item> cart, BanTheCaoContext dbContext, CancellationToken token, Guid taskId, decimal discountedTotal)
        {
            string taskStatus = "Completed";
            try
            {
                await using var transaction = await dbContext.Database.BeginTransactionAsync(token);

                var orderHistories = new List<OrderHistory>();
                var orderHistoryDetails = new List<OrderHistoryDetail>();
                decimal totalAmount = 0;

                foreach (var item in cart)
                {
                    var order = await dbContext.Orders
                        .FirstOrDefaultAsync(o => o.UserId == userId && o.ProductId == item.Id && o.Product != null, token);

                    if (order != null)
                    {
                        dbContext.Orders.Remove(order);
                    }

                    totalAmount += item.Price * item.Quantity;

                    var orderHistory = new OrderHistory
                    {
                        UserId = userId,
                        ProductId = item.Id,
                        Date = DateTime.Now,
                        Quantity = item.Quantity,
                        TotalPrice = discountedTotal / 100000,
                        ProductName = item.Name
                    };

                    await dbContext.OrderHistories.AddAsync(orderHistory, token);
                    await dbContext.SaveChangesAsync(token); // Save here to generate OrderHistory ID

                    var productDetails = await dbContext.ProductDetails
                        .Where(pd => pd.ProductId == item.Id && !pd.IsDelete)
                        .Take(item.Quantity)
                        .ToListAsync(token);

                    // Get CategoryId from Product
                    var product = await dbContext.Products
                        .FirstOrDefaultAsync(p => p.Id == item.Id, token);

                    if (product == null || product.CategoryId == null)
                    {
                        throw new Exception($"CategoryID của sản phẩm {item.Name} không được xác định.");
                    }
                    if (product.Quantity < item.Quantity)
                    {
                        throw new InvalidOperationException($"Không đủ số lượng sản phẩm {item.Name} trong kho.");
                    }

                    product.Quantity -= item.Quantity; // Reduce the stock quantity
                    dbContext.Products.Update(product); // Update the product

                    foreach (var productDetail in productDetails)
                    {
                        orderHistoryDetails.Add(new OrderHistoryDetail
                        {
                            ProductDetailId = productDetail.Id,
                            OrderHistoryId = orderHistory.Id,
                            CategoryId = product.CategoryId.Value, // Use CategoryId from product
                            Serial = productDetail.Serial,
                            Code = productDetail.Code,
                            ProductName = item.Name
                        });

                        productDetail.IsDelete = true;
                    }
                }

                await dbContext.OrderHistoryDetails.AddRangeAsync(orderHistoryDetails, token);
                await dbContext.SaveChangesAsync(token);

                var user = await dbContext.Users.FindAsync(userId, token);
                if (user != null)
                {
                    user.Money -= discountedTotal / 100000;
                    dbContext.Users.Update(user);
                    await dbContext.SaveChangesAsync(token);
                }

                await transaction.CommitAsync(token);

                _logger.LogInformation($"Order processed for user {userId}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error processing order for user {userId}");
                taskStatus = $"Failed: {ex.Message}";
            }
            finally
            {
                TaskStatusStorage.SetTaskStatus(taskId, taskStatus, userId);
            }
        }

        public void CartQuantity()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                HttpContext.Session.SetInt32("quantity", 0);
                return;
            }

            var cart = db.Orders
                .Where(od => od.UserId == userId)
                .Select(od => new Item
                {
                    Id = od.ProductId ?? 0,
                    Name = od.Product != null ? od.Product.Name : string.Empty,
                    Price = od.Product != null ? od.Product.Price : 0,
                    Image = od.Product != null ? od.Product.Image : string.Empty,
                    Quantity = od.Quantity ?? 0
                })
                .ToList();

            HttpContext.Session.SetInt32("quantity", cart.Count);
        }
    }
}