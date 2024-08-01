using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Drawing.Imaging;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using WebEazyCao.DAO;
using WebEazyCao.Models;
using WebEazyCao.ViewModels;
using System.Net;
using Microsoft.AspNetCore.Authorization;
using WebEazyCao.FIlter;
using WebEazyCao.Data;
using Microsoft.EntityFrameworkCore;
using SkiaSharp;

namespace WebEazyCao.Controllers
{
    [MenuActionFilter]
    [AdvActionFilter]
    [FooterActionFilter]
    public class AccountController : Controller
    {
        private readonly BanTheCaoContext db;

        public AccountController(BanTheCaoContext context)
        {
            db = context;
        }

        public IActionResult DepositHistory()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }
            var depositHistories = db.DepositHistories
                                .Where(dh => dh.UserId == userId)
                                .ToList();
            return View(depositHistories);
        }

        public async Task<IActionResult> TransactionHistory()
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }

            var orderHistories = await db.OrderHistories
                .Where(oh => oh.UserId == userId)
                .Include(oh => oh.OrderHistoryDetails)  // Bao gồm các chi tiết của đơn hàng
                .ToListAsync();

            return View(orderHistories);
        }

        public async Task<IActionResult> OrderDetails(int id)
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }

            var orderHistory = await db.OrderHistories
                .Include(oh => oh.OrderHistoryDetails)
                .FirstOrDefaultAsync(oh => oh.Id == id && oh.UserId == userId);

            if (orderHistory == null)
            {
                return NotFound();
            }

            return View(orderHistory);
        }

        public IActionResult Profile()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            ViewBag.UserId = HttpContext.Session.GetInt32("User");

            int UserId = HttpContext.Session.GetInt32("User").Value;

            //MESSAGE
            ViewBag.ChangePasswordSuccess = TempData["SuccessMessage"];
            return View(AccountDAO.GetAccountWithId(UserId));
        }

        // Other methods (UpdateProfile, ChangePassword, etc.)...

        public static string GetMD5(string password)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(password);
            byte[] taggetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < taggetData.Length; i++)
            {
                byte2String += taggetData[i].ToString("x2");
            }
            return byte2String;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult UpdateProfile(User model)
        {
            if (HttpContext.Session.GetInt32("User") != null)
            {
                int? id = HttpContext.Session.GetInt32("User");
                User account = AccountDAO.GetAccountWithId(id);

                account.Name = model.Name;
                account.UserName = model.UserName;
                account.Email = model.Email;
                account.Phone = model.Phone;
                account.Address = model.Address;


                AccountDAO.UpdateUser(account);
                TempData["Changeinfosuccess"] = "Thay đổi thông tin thành công!.";
                return RedirectToAction("Profile", "Account");

            }
            return RedirectToAction("Profile", "Account");
        }
        [HttpGet]

        public ActionResult ChangePassword()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult ChangePassword(ChangePasswordViewModel model)
        {
            //if (HttpContext.Session.GetString("CaptchaChangePass") != captcha) { return RedirectToAction("Profile", "Account"); }
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            if (HttpContext.Session.GetInt32("User") != null)
            {
                // Lấy ID người dùng từ phiên làm việc
                int? userId = HttpContext.Session.GetInt32("User");
                User user = AccountDAO.GetAccountWithId(userId);

                // Hash mật khẩu cũ để so sánh
                var oldPasswordHash = GetMD5(model.OldPassword);

                // Kiểm tra mật khẩu cũ
                if (!oldPasswordHash.Equals(user.Password))
                {
                    TempData["ErrorCPW"] = "Mật khẩu hiện tại không đúng.";
                    ViewBag.OldPassword = model.OldPassword;
                    return RedirectToAction("Profile", "Account");
                }

                // Kiểm tra xem mật khẩu mới và xác nhận mật khẩu có khớp nhau không
                if (!model.NewPassword.Equals(model.ConfirmPassword))
                {
                    TempData["ErrorCPNM"] = "Mật khẩu mới và mật khẩu xác nhận không khớp.";
                    return RedirectToAction("Profile", "Account");
                }

                // Hash mật khẩu mới và cập nhật vào cơ sở dữ liệu
                user.Password = GetMD5(model.NewPassword);
                AccountDAO.UpdateUser(user);

                // Xóa session và cookie xác thực
                //HttpContext.Session.Clear();


                // Gán thông báo thành công
                TempData["Successchangepass"] = "Đổi mật khẩu thành công.";

                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Profile", "Account");
            }

            // Nếu không có người dùng trong session
            ViewBag.ErrorCPW = "Không tìm thấy phiên người dùng.";
            return View();
        }

        public async Task<IActionResult> ReportError(int id)
        {
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }

            var orderHistoryDetail = await db.OrderHistoryDetails
                .Include(ohd => ohd.OrderHistory)
                .FirstOrDefaultAsync(ohd => ohd.Id == id && ohd.OrderHistory.UserId == userId);

            if (orderHistoryDetail == null)
            {
                return NotFound();
            }

            var reportViewModel = new ReportErrorViewModel
            {
                OrderHistoryDetailId = id,
                ProductName = orderHistoryDetail.ProductName,
                Serial = orderHistoryDetail.Serial,
                Code = orderHistoryDetail.Code,
                IssueDescription = string.Empty
            };

            return View(reportViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SubmitReportError(ReportErrorViewModel model)
        {
            var username = HttpContext.Session.GetString("Username");
            var userId = HttpContext.Session.GetInt32("User");
            if (userId == null)
            {
                return RedirectToAction("Login", "Home");
            }

            var orderHistoryDetail = await db.OrderHistoryDetails
                .Include(ohd => ohd.OrderHistory)
                .FirstOrDefaultAsync(ohd => ohd.Id == model.OrderHistoryDetailId && ohd.OrderHistory.UserId == userId);

            if (orderHistoryDetail == null)
            {
                return NotFound();
            }

            // Check if the referenced order history exists
            var orderHistoryExists = await db.OrderHistories.AnyAsync(oh => oh.Id == orderHistoryDetail.OrderHistoryId);
            if (!orderHistoryExists)
            {
                return BadRequest("Invalid order history reference.");
            }

            var orderReport = new OrderReport
            {
                OrderHistoryId = orderHistoryDetail.OrderHistoryId, // Correctly assign the OrderHistoryId
                ReportedBy = userId.ToString(),
                ReportDate = DateTime.Now,
                Issue = model.IssueDescription,
                IsResolved = false
            };

            db.OrderReports.Add(orderReport);
            await db.SaveChangesAsync();

            TempData["SuccessMessage"] = "Báo cáo lỗi đã được gửi thành công.";
            return RedirectToAction("TransactionHistory", "Account");
        }

    }

}
