using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;
using X.PagedList;
using System.Linq;
using System.Threading.Tasks;
using SkiaSharp;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderHistoryController : Controller
    {
        private readonly BanTheCaoContext db = new BanTheCaoContext();

        // GET: Admin/OrderHistory
        [Route("Admin/OrderHistory")]
        public async Task<IActionResult> OrderHistory(int? page)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }

            var pageNumber = page ?? 1;
            var pageSize = 10;

            var orders = await db.OrderHistories
                .Include(p => p.User)
                .Include(p => p.OrderHistoryDetails)
                .OrderByDescending(p => p.Id)
                .ToPagedListAsync(pageNumber, pageSize);

            return View(orders);
        }

        [Route("Admin/OrderHistoryDetail/{id?}")]
        public async Task<IActionResult> OrderHistoryDetail(int? id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }

            if (id == null)
            {
                return NotFound();
            }

            var orderHistoryDetails = await db.OrderHistoryDetails
                .Where(ohd => ohd.OrderHistoryId == id)
                .Include(ohd => ohd.OrderHistory)
                .Include(ohd => ohd.ProductDetail)
                .Include(ohd => ohd.Category)
                .ToListAsync();

            if (orderHistoryDetails == null || !orderHistoryDetails.Any())
            {
                return NotFound();
            }

            var orderHistory = await db.OrderHistories
                .Where(oh => oh.Id == id)
                .Select(oh => new
                {
                    ProductId = oh.ProductId,
                    CategoryId = db.Products.Where(p => p.Id == oh.ProductId).Select(p => p.CategoryId).FirstOrDefault()
                })
                .FirstOrDefaultAsync();

            ViewBag.ProductId = orderHistory?.ProductId;
            ViewBag.CategoryId = orderHistory?.CategoryId;

            return View(orderHistoryDetails);
        }

        [HttpGet("Admin/OrderHistory/Search")]
        public async Task<IActionResult> Search(string key, int? page)
        {
            var orders = db.OrderHistories
                .Include(o => o.OrderHistoryDetails)
                .Include(u => u.User)
                .Include(o => o.Product)
                .AsQueryable();
            var pageNumber = page ?? 1;
            var pageSize = 10;
            decimal id;
            bool isNumeric = decimal.TryParse(key, out id);

            if (!string.IsNullOrEmpty(key))
            {
                orders = orders.Where(o => o.User.Name.Contains(key) ||
                                           o.OrderHistoryDetails.Any(d => d.ProductName.Contains(key)) ||
                                           (isNumeric && o.Id == (int)id));
            }

            var pagedOrders = await orders.ToPagedListAsync(pageNumber, pageSize);

            ViewBag.SearchKey = key;
            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = pagedOrders.PageCount;

            return View("OrderHistory", pagedOrders);
        }

        [Route("Admin/OrderReport")]
        public async Task<IActionResult> Index(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 10;

            var reports = await db.OrderReports
                .Include(r => r.OrderHistory)
                .OrderByDescending(r => r.ReportDate)
                .ToPagedListAsync(pageNumber, pageSize);
			var users = await db.Users.ToListAsync();
			ViewBag.Users = users;
			return View(reports);
        }

        [Route("Admin/OrderReport/Details/{id?}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            // Lấy thông tin báo cáo lỗi bao gồm OrderHistory và OrderHistoryDetails
            var report = await db.OrderReports
                .Include(r => r.OrderHistory)
                .ThenInclude(oh => oh.OrderHistoryDetails)  // Bao gồm OrderHistoryDetails
                .FirstOrDefaultAsync(r => r.Id == id);

            if (report == null)
            {
                return NotFound();
            }

            // Lấy thông tin chi tiết của đơn hàng, giả sử chúng ta chỉ cần lấy thông tin từ chi tiết đầu tiên
            var orderHistoryDetail = report.OrderHistory.OrderHistoryDetails.FirstOrDefault();
            if (orderHistoryDetail != null)
            {
                ViewBag.Serial = orderHistoryDetail.Serial;
                ViewBag.Code = orderHistoryDetail.Code;
            }

            return View(report);
        }

        [HttpGet("Admin/OrderReport/SearchReport")]
        public async Task<IActionResult> SearchReport(string key, int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 10;

            var reports = db.OrderReports
                .Include(r => r.OrderHistory)
                .AsQueryable();

            if (!string.IsNullOrEmpty(key))
            {
                reports = reports.Where(r => r.Issue.Contains(key) ||
                                               r.OrderHistory.User.Name.Contains(key) ||
                                               r.ReportedBy.Contains(key));
            }

            var pagedReports = await reports.ToPagedListAsync(pageNumber, pageSize);

            ViewBag.SearchKey = key;
            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = pagedReports.PageCount;

            return View("Index", pagedReports);
        }

        [HttpPost]
        [Route("Admin/OrderReport/ResolveReport/{id}")]
        public async Task<IActionResult> ResolveReport(int id)
        {
            var report = await db.OrderReports
                .Include(r => r.OrderHistory)
                .ThenInclude(oh => oh.OrderHistoryDetails)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (report != null && report.IsResolved == false)
            {
                var orderHistory = report.OrderHistory;
                var product = await db.Products.FirstOrDefaultAsync(p => p.Id == orderHistory.ProductId);

                if (product != null)
                {
                    var user = await db.Users.FirstOrDefaultAsync(u => u.Id == orderHistory.UserId);
                    if (user != null)
                    {
                        // Ensure Money is not null, if it is, initialize it to zero
                        user.Money = (user.Money ?? 0) + product.Price;
                        db.Users.Update(user);
                    }

                    report.IsResolved = true;
                    db.OrderReports.Update(report);

                    await db.SaveChangesAsync();
                }
            }

            return RedirectToAction("Details", new { id });
        }

    }
}
