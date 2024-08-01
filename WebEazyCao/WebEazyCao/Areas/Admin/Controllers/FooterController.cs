using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SkiaSharp;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class FooterController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();

        [Route("Admin/Footer")]
        public IActionResult Footer()
        {
            var items = db.Footers.OrderBy(f => f.Position).ToList();
            return View(items);
        }

        [Route("Admin/Footer/Add")]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        [Route("Admin/Footer/Add")]
        public async Task<IActionResult> AddAsync(Footer model)
        {
            if (ModelState.IsValid)
            {
                Footer footer = new Footer()
                {
                    Name = model.Name,
                    Position = model.Position,
                    Description = model.Description,
                    Links = model.Links,
                };
                db.Footers.Add(footer);
                db.SaveChanges();
                return RedirectToAction("Footer", new { area = "Admin" });
            }

            await NotificatePartial();
            return View(model);
        }
        [HttpGet("NotificatePartial")]
        public async Task<IActionResult> NotificatePartial()
        {
            DateTime today = DateTime.Now.Date;
            var userFeeback = await db.Feedbacks
                .Where(f => f.CreatedAt == today)
                .OrderBy(f => f.CreatedAt)
                .Include(u => u.User)
                .AsNoTracking()
                .ToListAsync();
            ViewBag.UserFeeback = userFeeback;

            return PartialView("_PartialNavbar.cshtml");
        }
        [HttpPost]
        [Route("Admin/Footer/Delete")]
        public IActionResult Delete(int id)
        {
            var footer = db.Footers.Find(id);
            if (footer != null)
            {
                db.Footers.Remove(footer);
                db.SaveChanges();
                return Json(new { success = true, message = "Footer item deleted successfully!" });
            }
            return Json(new { success = false, message = "Footer item does not exist." });
        }

        [HttpGet]
        [Route("Admin/Footer/Edit/{id}")]
        public IActionResult Edit(int id)
        {
            var item = db.Footers.Find(id);
            if (item == null)
            {
                return NotFound(); // Trả về trang 404 nếu không tìm thấy item
            }
            return View(item);
        }

        [HttpPost]
        [Route("Admin/Footer/Edit")]
        public IActionResult Edit(Footer model, int id)
        {
            if (ModelState.IsValid)
            {
                var footer = db.Footers.FirstOrDefault(x => x.Id == id);
                if (footer == null)
                {
                    return NotFound(); // Trả về trang 404 nếu không tìm thấy item
                }

                footer.Name = model.Name;
                footer.Position = model.Position;
                footer.Description = model.Description;
                footer.Links = model.Links;
                // Thêm các thuộc tính khác nếu cần

                db.Update(footer);
                db.SaveChanges();

                return Redirect("/Admin/Footer");
            }
            return View(model);
        }

        public ActionResult GetAllFooters()
        {
            var footers = db.Footers.ToList();
            return View(footers);
        }
    }
}
