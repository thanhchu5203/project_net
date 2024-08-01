using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class MenuControllers : Controller
    {

        BanTheCaoContext db = new BanTheCaoContext();

        [Route("Admin/Menu")]
        public IActionResult Menu()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var items = db.Menus.ToList();
            return View(items);
        }

        [Route("Admin/Menu/Add")]
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
        [Route("Admin/Menu/Add")]
        public IActionResult Add(Menu model)
        {

            if (ModelState.IsValid)
            {
                Menu menu = new Menu()
                {
                    Title = model.Title,
                    Position = model.Position,
                    Description = model.Description,
                    Links = model.Links,
                };
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Menu", new { area = "Admin" });
            }
            return View(model);
        }

        [HttpPost]
        [Route("Admin/Menu/Delete")]
        public IActionResult Delete(int id)
        {
            // Find the menu item that needs to be deleted
            var menu = db.Menus.Find(id);
            if (menu != null)
            {
                // Remove the menu item
                db.Menus.Remove(menu);

                db.SaveChanges();
                return Json(new { success = true, message = "Mục menu đã được xóa thành công!" });
            }
            return Json(new { success = false, message = "Mục menu không tồn tại." });
        }

        [HttpGet]
        [Route("Admin/Menu/Edit/{id}")]
        public IActionResult Edit(int id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var item = db.Menus.Find(id);
            if (item == null)
            {
                return NotFound(); // Trả về trang 404 nếu không tìm thấy item
            }
            return View(item);
        }

        [HttpPost]
        [Route("Admin/Menu/Edit")]
        public IActionResult Edit(Menu model)
        {
            if (ModelState.IsValid)
            {
                // Tìm item trong database
                var menu = db.Menus.FirstOrDefault(x => x.Id == model.Id);
                if (menu == null)
                {
                    return NotFound(); // Trả về trang 404 nếu không tìm thấy item
                }

                // Cập nhật các thuộc tính của item
                menu.Title = model.Title;
                menu.Position = model.Position;
                menu.Description = model.Description;
                menu.Links = model.Links;
                // Thêm các thuộc tính khác nếu cần

                // Đánh dấu item đã được sửa đổi
                db.Update(menu);

                // Lưu thay đổi
                db.SaveChanges();

                // Chuyển hướng đến trang danh sách sau khi cập nhật thành công
                return RedirectToAction("Menu", new { area = "Admin" });
            }

            // Trả về view với model hiện tại nếu validation thất bại
            return View(model);
        }

        public ActionResult GetAllMenus()
        {
            var menus = db.Menus.ToList();
            return View(menus);
        }

    }
}
