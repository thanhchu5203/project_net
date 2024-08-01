using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Linq;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdvController : Controller
    {
        private readonly BanTheCaoContext db = new BanTheCaoContext();
        private readonly IWebHostEnvironment _hostingEnvironment;

        public AdvController(IWebHostEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        [Route("Admin/Adv")]
        public IActionResult Adv()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var items = db.Advs.ToList();
            return View(items);
        }

        [Route("Admin/Adv/Add")]
        public IActionResult Add()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            return View();
        }

        [HttpPost]
        [Route("Admin/Adv/Add")]
        public IActionResult Add(Adv model, IFormFile ImageFile)
        {
            if (ModelState.IsValid)
            {
                string imagePath = null;
                if (ImageFile != null)
                {
                    var uploadDir = Path.Combine(_hostingEnvironment.WebRootPath, "themes", "images");
                    var fileName = Path.GetFileName(ImageFile.FileName);
                    var fullPath = Path.Combine(uploadDir, fileName);
                    imagePath = "/" + Path.Combine("themes", "images", fileName);

                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        ImageFile.CopyTo(fileStream);
                    }
                }

                Adv adv = new Adv()
                {
                    Title = model.Title,
                    Image = imagePath ?? model.Image,
                    Link = model.Link,
                    // Add other properties here
                };
                db.Advs.Add(adv);
                db.SaveChanges();
                return RedirectToAction("Adv", new { area = "Admin" });
            }
            return View(model);
        }

        [HttpPost]
        [Route("Admin/Adv/Delete")]
        public IActionResult Delete(int id)
        {
            var adv = db.Advs.Find(id);
            if (adv != null)
            {
                db.Advs.Remove(adv);
                db.SaveChanges();
                return Json(new { success = true, message = "Mục Adv đã được xóa thành công!" });
            }
            return Json(new { success = false, message = "Mục Adv không tồn tại." });
        }

        [HttpGet]
        [Route("Admin/Adv/Edit/{id}")]
        public IActionResult Edit(int id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var item = db.Advs.Find(id);
            if (item == null)
            {
                return NotFound();
            }
            return View(item);
        }

        [HttpPost]
        public IActionResult Edit(Adv model, IFormFile ImageFile) // Thêm tham số IFormFile ImageFile
        {
            if (ModelState.IsValid)
            {
                var adv = db.Advs.FirstOrDefault(x => x.Id == model.Id);
                if (adv == null)
                {
                    return NotFound();
                }

                string imagePath = adv.Image;
                if (ImageFile != null)
                {
                    var uploadDir = Path.Combine(_hostingEnvironment.WebRootPath, "themes", "images");
                    var fileName = Path.GetFileName(ImageFile.FileName);
                    var fullPath = Path.Combine(uploadDir, fileName);
                    imagePath = "/" + Path.Combine("themes", "images", fileName);

                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        ImageFile.CopyTo(fileStream);
                    }
                }

                adv.Title = model.Title;
                adv.Image = imagePath;
                adv.Link = model.Link;

                db.Update(adv);
                db.SaveChanges();

                return RedirectToAction("Adv", new { area = "Admin" });
            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
                return View(errors);
            }
        }

        public ActionResult GetAllAdvs()
        {
            var advs = db.Advs.ToList();
            return View(advs);
        }
    }
}