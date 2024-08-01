using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using WebEazyCao.FIlter;
using WebEazyCao.Services;
using WebEazyCao.ViewModels;
using WebEazyCao.DAO;
using WebEazyCao.Models;
using Microsoft.AspNetCore.Http;
using Azure;

namespace WebEazyCao.Controllers
{
    [MenuActionFilter]
    [AdvActionFilter]
    [FooterActionFilter]
    public class DepositsController : Controller
    {
        private readonly IVnPayService _vpnPayService;
        public DepositsController(IVnPayService vnPayServices)
        {
            _vpnPayService = vnPayServices;
        }

        BanTheCaoContext db = new BanTheCaoContext();
        // GET: Deposits/Recharge
        public IActionResult Recharge()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            return View();
        }

        #region VNPAY
        [HttpPost]
        public IActionResult VnPay(DepositModel deposit)
        {
            if (ModelState.IsValid)
            {
                int? userId = HttpContext.Session.GetInt32("User");
                string id = VnPayDAO.GenerateCodeDeposit();
                var vnPayModel = new VnPaymentRequestModel
                {
                    Amount = deposit.amount,
                    CreatedDate = DateTime.Now,
                    Description = deposit.description ?? "",
                    Id = id,
                };

                DepositHistory dh = new DepositHistory()
                {
                    Money = deposit.amount / 1000,
                    Description = deposit.description ?? "",
                    CreatedAt = DateTime.Now,
                    UserId = userId,
                    IsSuccess = false,
                };

                db.Add(dh);
                db.SaveChanges();
                var DHID = db.DepositHistories.OrderByDescending(x => x.Id).First();
                HttpContext.Session.SetInt32("DHID", DHID?.Id ?? 0);
                return Redirect(_vpnPayService.CreatePaymentUrl(HttpContext, vnPayModel));
            }
            return RedirectToAction(nameof(Recharge));
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
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            return View();
        }

        public IActionResult PaymentCallBack()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            if (Request.Query.Count == 0)
            {
                TempData["Message"] = $"Lỗi thanh toán VN Pay";
                return RedirectToAction("PaymentFail");
            }

            var response = _vpnPayService.PaymentExecute(Request.Query);
            try
            {
                if (response == null || response.VnPayReponseCode != "00") // Gia tri 00 la thanh cong
                {
                    TempData["Message"] = $"Lỗi thanh toán VN Pay: {response?.VnPayReponseCode}";
                    return RedirectToAction("PaymentFail");
                }

                // Xác thực chữ ký số
                bool isValidSignature = _vpnPayService.ValidateSignature(Request.Query["vnp_SecureHash"], Request.Query);
                if (!isValidSignature)
                {
                    TempData["Message"] = $"Lỗi xác thực chữ ký số VN Pay";
                    return RedirectToAction("PaymentFail");
                }

                // Kiểm tra trạng thái giao dịch đã xử lý trước đó hay chưa
                int? dhId = HttpContext.Session.GetInt32("DHID");
                var existingTransaction = GetDepositHistoryId(dhId);
                if (existingTransaction.IsSuccess == true)
                {
                    TempData["Message"] = $"Giao dịch đã được xử lý trước đó";
                    return RedirectToAction("PaymentFail");
                }

                // Lấy ID người dùng từ phiên làm việc
                int? userId = HttpContext.Session.GetInt32("User");

                // Lưu đơn hàng cho Database
                UpdateUserMoney(userId, response.Amount);

                existingTransaction.IsSuccess = true;
                UpdateDepositHistory(dhId, true);

                // Lấy thông tin người dùng sau khi cập nhật số dư
                User updatedUser = AccountDAO.GetAccountWithId(userId);

                // Cập nhật session UserMoney
                HttpContext.Session.SetString("UserMoney", updatedUser.Money.HasValue ? updatedUser.Money.Value.ToString("0.000") : "0");

                TempData["Message"] = $"Thanh toán VN Pay thành công";
                return RedirectToAction("PaymentSuccess");
            }
            catch (Exception ex)
            {
                TempData["Message"] = $"Lỗi thanh toán VN Pay: {response?.VnPayReponseCode}";
                return RedirectToAction("PaymentFail");
            }
        }

        #endregion

        public static void UpdateUserMoney(int? id, decimal? amount)
        {
            User u = AccountDAO.GetAccountWithId(id);
            u.Money += amount / 1000;

            using (var context = new BanTheCaoContext())
            {
                var users = context.Set<User>();
                users.Update(u);
                context.SaveChanges();
            }
        }

        public static void UpdateDepositHistory(int? id, bool? isSuccess)
        {
            try
            {
                DepositHistory dh = GetDepositHistoryId(id);
                dh.IsSuccess = isSuccess;
                if (dh != null)
                {
                    using (var context = new BanTheCaoContext())
                    {
                        var dhs = context.Set<DepositHistory>();
                        dhs.Update(dh);
                        context.SaveChanges();
                    }
                }
                else
                {
                    throw new Exception("The Deposit History does not exist");
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public static List<DepositHistory> GetAllDepositHistory()
        {
            List<DepositHistory> list = new List<DepositHistory>();

            using (var context = new BanTheCaoContext())
            {
                list = context.DepositHistories.ToList();
            }
            return list;
        }

        public static DepositHistory GetDepositHistoryId(int? Id)
        {
            return GetAllDepositHistory().FirstOrDefault(x => x.Id == Id);
        }
    }
}
