using DataAccess.MailSender;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using WebEazyCao.DAO;
using WebEazyCao.Models;
using WebEazyCao.ViewModels;
using DNTCaptcha.Core;
using Microsoft.Extensions.Options;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace WebEazyCao.Controllers
{
    [MenuActionFilter]
    [AdvActionFilter]
    [FooterActionFilter]
    public class HomeController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();
        private readonly ILogger<HomeController> _logger;
        private readonly IDNTCaptchaValidatorService _validatorService;
        private readonly DNTCaptchaOptions _captchaOptions;

        public HomeController(ILogger<HomeController> logger, IDNTCaptchaValidatorService validatorService, IOptions<DNTCaptchaOptions> options)
        {
            _logger = logger;
            _validatorService = validatorService;
            _captchaOptions = options == null ? throw new ArgumentNullException(nameof(options)) : options.Value;
        }
        public IActionResult Index(int page = 1, int pageSize = 9)
        {
            CartQuantity();

            if (pageSize <= 0)
            {
                pageSize = 9;
            }

            var totalItems = db.Products.Count();
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            var products = db.Products
                .OrderBy(p => p.Id)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            var model = new PagedProductViewModel
            {
                Products = products,
                PageNumber = page,
                TotalPages = totalPages,
                PageSize = pageSize
            };
            ViewBag.Footers = db.Footers.ToList();
            return View(model);
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

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        public IActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model); // Trả về view với model nếu dữ liệu không hợp lệ
            }
            if (!_validatorService.HasRequestValidCaptchaEntry())
            {
                this.ModelState.AddModelError(_captchaOptions.CaptchaComponent.CaptchaInputName, "Sai Captcha. Vui lòng nhập lại.");
                return View(nameof(Login));
            }

            User user = new User()
            {
                UserName = model.Username,
                Password = GetMD5(model.Password)
            };
            User u = AccountDAO.Login(user.UserName, user.Password);
            if (u != null)
            {
                if (u.IsActive == false || u.IsDelete == true)
                {
                    ViewBag.LoginFail = "Tài khoản đã bị chặn";
                    return View(model);
                }
                HttpContext.Session.SetInt32("User", u.Id);

                string role = "User";
                if (u.RoleId == 1)
                {
                    role = "Admin";
                }
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Role, role)
                };
                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var principal = new ClaimsPrincipal(identity);

                HttpContext.Session.SetString("UserName", u.UserName);
                HttpContext.Session.SetInt32("Id", u.Id);
                HttpContext.Session.SetString("Role", role);
                HttpContext.Session.SetString("UserMoney", u.Money.HasValue ? u.Money.Value.ToString() : "0");
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
                if (u.RoleId == 1)
                {
                    return RedirectToAction("index", "Admin");
                }
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.LoginFail = "Sai người dùng hoặc mật khẩu";
                return View(model);
            }
        }

        public static string GetMD5(string password)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(password);
            byte[] targetData = md5.ComputeHash(fromData);
            StringBuilder byte2String = new StringBuilder();

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String.Append(targetData[i].ToString("x2"));
            }
            return byte2String.ToString();
        }

        [HttpPost]
        public IActionResult SendEmail(string email)
        {
            var check = db.Users.FirstOrDefault(u => u.Email == email);
            if (check == null)
            {
                HttpContext.Session.SetString("VerificationCode", EmailSender.SendEmail(email, "", ""));
                HttpContext.Session.SetString("VerificationGmail", email);
                HttpContext.Session.SetInt32("FailedAttempts", 0); // Reset failed attempts when a new code is sent
                return Json(new { success = true, message = "Email đã được gửi mã thành công!" });
            }
            else
            {
                return Json(new { success = false, message = "Email đã được đăng kí" });
            }
        }

        [HttpPost]
        public IActionResult SendEmailForgotPassword(string email)
        {
            var check = db.Users.FirstOrDefault(u => u.Email == email);
            if (check == null)
            {
                return Json(new { success = false, message = "Email chưa được đăng kí" });
            }
            else
            {
                HttpContext.Session.SetString("VerificationCode", EmailSender.SendEmail(email, "", ""));
                HttpContext.Session.SetString("VerificationGmail", email);
                HttpContext.Session.SetInt32("FailedAttempts", 0); // Reset failed attempts when a new code is sent
                return Json(new { success = true, message = "Email đã được gửi mã thành công!" });
            }
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            var sessionVerificationCode = HttpContext.Session.GetString("VerificationCode");
            var sessionVerificationGmail = HttpContext.Session.GetString("VerificationGmail");

            if (ModelState.IsValid && model.Email == sessionVerificationGmail)
            {
                if (model.CodeValidate == sessionVerificationCode)
                {
                    model.Email = model.Email?.Trim();
                    User user = new User()
                    {
                        UserName = model.Username,
                        Email = model.Email,
                        Name = model.Name,
                        Phone = model.Phone,
                        Address = model.Address,
                        IsActive = true,
                        IsDelete = false,
                        Money = 0,
                        RoleId = 2
                    };
                    var check = AccountDAO.CheckRegister(user.UserName, user.Email);
                    if (check == null)
                    {
                        user.Password = GetMD5(model.Password);
                        AccountDAO.Register(user);
                        HttpContext.Session.Remove("VerificationCode"); // Clear the session on successful registration
                        HttpContext.Session.Remove("FailedAttempts"); // Clear the attempts
                        return RedirectToAction("RegisterConfirmation", "Home");
                    }
                    else
                    {
                        ViewBag.error = "Tên người dùng hoặc Email đã tồn tại";
                        return View(model);
                    }
                }
                else
                {
                    HandleFailedAttempts();
                    return View(model);
                }
            }

            ViewBag.errorcode = "Mã không hợp lệ";
            return View(model);
        }

        private void HandleFailedAttempts()
        {
            int failedAttempts = HttpContext.Session.GetInt32("FailedAttempts") ?? 0;
            failedAttempts++;
            HttpContext.Session.SetInt32("FailedAttempts", failedAttempts);

            if (failedAttempts > 3)
            {
                HttpContext.Session.Remove("VerificationCode");
                HttpContext.Session.Remove("VerificationGmail");
                HttpContext.Session.Remove("FailedAttempts");
                ViewBag.errorcode2 = "Bạn đã nhập sai mã quá nhiều lần. Vui lòng yêu cầu mã xác minh mới.";
            }
            else
            {
                ViewBag.errorcode1 = $"Sai mã. Bạn còn {4 - failedAttempts} lần thử.";
            }
        }

        [AllowAnonymous]
        public ActionResult RegisterConfirmation()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(ForgotPasswordViewModel model)
        {
            var sessionVerificationCode = HttpContext.Session.GetString("VerificationCode");
            var sessionVerificationGmail = HttpContext.Session.GetString("VerificationGmail");

            if (ModelState.IsValid && model.Email == sessionVerificationGmail)
            {
                if (model.CodeValidate == sessionVerificationCode)
                {
                    User user = AccountDAO.GetAccountWithUsernameMail(model.Email);
                    if (user != null)
                    {
                        user.Password = GetMD5(model.NewPassword);
                        AccountDAO.UpdateUser(user);
                        HttpContext.Session.Remove("VerificationCode"); // Clear the session on successful reset
                        HttpContext.Session.Remove("FailedAttempts"); // Clear the attempts
                        return RedirectToAction("ForgotPasswordConfirmation", "Home");
                    }
                    else
                    {
                        ViewBag.errorEmail = "Email chưa tồn tại!";
                        return View();
                    }
                }
                else
                {
                    HandleFailedAttempts();
                    return View(model);
                }
            }
            ViewBag.errorcode = "Mã không hợp lệ";
            return View(model);
        }

        [HttpGet]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        public IActionResult LogOff()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Menu()
        {
            var menus = db.Menus.ToList();
            ViewBag.Menu = menus;
            return View();
        }

        public void SetMenuItems()
        {
            var menus = db.Menus.ToList();
            ViewBag.Menu = menus;
        }

        public IActionResult Adv()
        {
            var advs = db.Advs.ToList();
            ViewBag.Adv = advs;
            return View();
        }

        public void SetAdvItems()
        {   
            var advs = db.Advs.ToList();
            ViewBag.Advs = advs;
        }
        public IActionResult Footer()
        {
            var footers = db.Footers.ToList();
            ViewBag.Footer = footers;
            return View();
        }
        public void SetFooterItems()
        {
            var footers = db.Footers.ToList();
            ViewBag.Footer = footers;
        }

        [HttpGet]
        public ActionResult AccessDenied()
        {
            return View();
        }
    }
}
