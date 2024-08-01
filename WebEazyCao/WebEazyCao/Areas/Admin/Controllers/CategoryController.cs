using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.FIlter;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CategoryController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();
        // GET: Admin/Category
        [Route("Admin/Category")]
        public async Task<IActionResult> Category()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var categories = await db.Categories.Include(c => c.Products)
                                                .Where(b => b.IsDelete == false)
                                                .OrderByDescending(c => c.Id)
                                                .ToListAsync();
            return View(categories);
        }

        [Route("Admin/Category/Add")]
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
        [Route("Admin/Category/Add")]
        public async Task<IActionResult> Add(Category model)
        {
            if (ModelState.IsValid)
            {
                var check = await db.Categories.FirstOrDefaultAsync(x => x.Name == model.Name && x.IsDelete == false);
                if (check == null)
                {
                    Category c = new Category()
                    {
                        Name = model.Name,
                        CreatedAt = DateTime.Now,
                        CreatedBy = "Admin",
                        IsDelete = false,
                    };
                    db.Categories.Add(c);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Category", "Category", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên danh mục đã tồn tại.");
                    return View(model);
                }
            }
            return View(model);
        }

        //[HttpPost]
        //public IActionResult Delete(int id)
        //{
        //    // Tìm thương hiệu cần xóa
        //    var category = db.Categories.FirstOrDefault(b => b.Id == id);
        //    if (category != null)
        //    {
        //        // Xóa tất cả các sản phẩm liên quan
        //        db.Products.RemoveRange(category.Products);
        //        // Xóa thương hiệu
        //        db.Categories.Remove(category);

        //        db.SaveChanges();
        //        return Json(new { success = true, message = "Xóa danh mục thành công!" });
        //    }
        //    return Json(new { success = false, message = "Danh mục không tồn tại." });
        //}

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var category = db.Categories.FirstOrDefault(c => c.Id == id);
            if (category != null)
            {
                // Cập nhật trạng thái IsDelete, DeletedAt và DeletedBy thay vì xóa
                category.IsDelete = true;
                category.DeletedAt = DateTime.Now;
                category.DeletedBy = "Admin";

                db.SaveChanges();
                return Json(new { success = true, message = "Xóa danh mục thành công!" });
            }
            return Json(new { success = false, message = "Danh mục không tồn tại." });
        }

        //[HttpPost]
        //public IActionResult DeleteAllSelect(int[] ids)
        //{
        //    if (ids == null || !ids.Any())
        //    {
        //        return Json(new { success = false, message = "Không có danh mục nào được chọn để xóa." });
        //    }
        //    // Tìm tất cả thương hiệu có ID trong danh sách ids
        //    var categorysToDelete = db.Categories.Where(b => ids.Contains(b.Id)).ToList();
        //    if (categorysToDelete.Count == 0)
        //    {
        //        return Json(new { success = false, message = "Không tìm thấy danh mục để xóa." });
        //    }
        //    // Xóa các thương hiệu đã tìm được
        //    db.Categories.RemoveRange(categorysToDelete);
        //    // Lưu thay đổi vào database
        //    db.SaveChanges();
        //    return Json(new { success = true, message = "Xóa danh mục thành công!" });
        //}

        [HttpPost]
        public IActionResult DeleteAllSelect(int[] ids)
        {
            if (ids == null || !ids.Any())
            {
                return Json(new { success = false, message = "Không có danh mục nào được chọn để xóa." });
            }
            var categoriesToDelete = db.Categories.Where(c => ids.Contains(c.Id)).ToList();
            if (categoriesToDelete.Count == 0)
            {
                return Json(new { success = false, message = "Không tìm thấy danh mục để xóa." });
            }
            foreach (var category in categoriesToDelete)
            {
                category.IsDelete = true;
                category.DeletedAt = DateTime.Now;
                category.DeletedBy = "Admin";
            }
            db.SaveChanges();
            return Json(new { success = true, message = "Xóa danh mục thành công!" });
        }

        [HttpGet]
        [Route("Admin/Category/Edit/{id?}")]
        public IActionResult Edit(int? id)
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
            var category = db.Categories.Find(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Category model)
        {
            if (ModelState.IsValid)
            {
                var check = db.Categories.FirstOrDefault(x => x.Name == model.Name && x.Id != model.Id && x.IsDelete == false);
                if (check == null)
                {
                    var c = await db.Categories.FindAsync(model.Id);
                    if (c == null)
                    {
                        return NotFound();
                    }
                    c.Name = model.Name;
                    c.UpdatedBy = "Admin";
                    c.UpdatedAt = DateTime.Now;
                    db.Update(c);
                    await db.SaveChangesAsync();

                    return RedirectToAction("Category", "Category", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên danh mục đã tồn tại.");
                    return View(model);
                }
            }
            return View(model);
        }
    }
}
