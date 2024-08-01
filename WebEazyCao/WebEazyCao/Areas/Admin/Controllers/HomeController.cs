using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.FIlter;
using WebEazyCao.Helper;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Route("Admin")]
    [Route("Admin/Home")]
    public class HomeController : Controller
    {
        private readonly BanTheCaoContext _context = new BanTheCaoContext();

        [Route("")]
        [Route("index")]
        public async Task<IActionResult> Index()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            await NotificatePartial();
            return View();
        }
        [HttpGet("NotificatePartial")]
        public async Task<IActionResult> NotificatePartial()
        {
            DateTime today = DateTime.Now.Date;
            var userFeedback = await _context.Feedbacks
                .Where(f => f.Date.Value.Date == today)
                .OrderByDescending(f => f.Date)
                .Include(p => p.Product)
                .Include(u => u.User)
                .AsNoTracking()
                .ToListAsync();
            var orderNotification = await _context.OrderHistories
                .Where(o => o.Date.Value.Date == today)
                .OrderBy(o => o.Date)
                .Include (u => u.User)
                .AsNoTracking()
                .ToListAsync();

            HttpContext.Session.SetObjectAsJson("UserFeedback", userFeedback);
            HttpContext.Session.SetObjectAsJson("OrderNotification", orderNotification);

            return PartialView("_PartialNavbar.cshtml");
        }
    }
}