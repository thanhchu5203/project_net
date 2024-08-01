using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging.Signing;
using WebEazyCao.FIlter;
using WebEazyCao.Models;
namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BrandController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();
        // GET: Admin/Brand
        [Route("Admin/Brand")]
        public async Task<IActionResult> Brand()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            // Giả sử bạn muốn lấy tất cả thương hiệu và sản phẩm liên kết
            var brandsWithProducts = await db.Brands.Include(b => b.Products)
                                                    .Where(b => b.IsDelete == false) 
                                                    .OrderByDescending(b => b.Id)
                                                    .Include(b => b.Category)
                                                    .ToListAsync();
            return View(brandsWithProducts);
        }

        private List<SelectListItem> GetCategory()
        {
            // Fetch categories from the database
            var categories = db.Categories
                                     .Where(c => !c.IsDelete.HasValue || !c.IsDelete.Value)
                                     .ToList();

            // Map to SelectListItem
            return categories.Select(c => new SelectListItem
            {
                Value = c.Id.ToString(),
                Text = c.Name
            }).ToList();
        }

        [Route("Admin/Brand/Add")]
        public IActionResult Add()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var categories = GetCategory();
            ViewBag.CategoryId = new SelectList(categories, "Value", "Text");
            return View();
        }

        [HttpPost]
        [Route("Admin/Brand/Add")]
        public async Task<IActionResult> Add(Brand model)
        {
            if (ModelState.IsValid)
            {
                var check = await db.Brands.FirstOrDefaultAsync(x => x.Name == model.Name && x.IsDelete == false);
                if (check == null)
                {
                    Brand b = new Brand()
                    {
                        Name = model.Name,
                        CategoryId = model.CategoryId,
                        CreatedAt = DateTime.Now,
                        CreatedBy = "Admin",
                        IsDelete = false,
                    };
                    db.Brands.Add(b);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Brand", "Brand", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên thương hiệu đã tồn tại.");
                    ViewBag.CategoryId = new SelectList(GetCategory(), "Value", "Text", model.CategoryId);
                    return View(model);
                }
            }
            return View(model);
        }

        //[HttpPost]
        //public IActionResult Delete(int id)
        //{
        //    // Tìm thương hiệu cần xóa
        //    var brand = db.Brands.FirstOrDefault(b => b.Id == id);
        //    if (brand != null)
        //    {
        //        // Xóa tất cả các sản phẩm liên quan
        //        db.Products.RemoveRange(brand.Products);
        //        // Xóa thương hiệu
        //        db.Brands.Remove(brand);

        //        db.SaveChanges();
        //        return Json(new { success = true, message = "Xóa thương hiệu thành công!" });
        //    }
        //    return Json(new { success = false, message = "Thương hiệu không tồn tại." });
        //}

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var brand = db.Brands.FirstOrDefault(b => b.Id == id);
            if (brand != null)
            {
                // Cập nhật trạng thái IsDelete thay vì xóa
                brand.IsDelete = true;
                brand.DeletedAt = DateTime.Now;
                brand.DeletedBy = "Admin";

                db.SaveChanges();
                return Json(new { success = true, message = "Xóa thương hiệu thành công!" });
            }
            return Json(new { success = false, message = "Thương hiệu không tồn tại." });
        }

        //[HttpPost]
        //public IActionResult DeleteAllSelect(int[] ids)
        //{
        //    if (ids == null || !ids.Any())
        //    {
        //        return Json(new { success = false, message = "Không có thương hiệu nào được chọn để xóa." });
        //    }
        //        // Tìm tất cả thương hiệu có ID trong danh sách ids
        //        var brandsToDelete = db.Brands.Where(b => ids.Contains(b.Id)).ToList();
        //        if (brandsToDelete.Count == 0)
        //        {
        //            return Json(new { success = false, message = "Không tìm thấy thương hiệu để xóa." });
        //        }
        //        // Xóa các thương hiệu đã tìm được
        //        db.Brands.RemoveRange(brandsToDelete);
        //        // Lưu thay đổi vào database
        //        db.SaveChanges();
        //    return Json(new { success = true, message = "Xóa thương hiệu thành công!" });
        //}

        [HttpPost]
        public IActionResult DeleteAllSelect(int[] ids)
        {
            if (ids == null || !ids.Any())
            {
                return Json(new { success = false, message = "Không có thương hiệu nào được chọn để xóa." });
            }

            var brandsToDelete = db.Brands.Where(b => ids.Contains(b.Id)).ToList();
            if (brandsToDelete.Count == 0)
            {
                return Json(new { success = false, message = "Không tìm thấy thương hiệu để xóa." });
            }

            foreach (var brand in brandsToDelete)
            {
                brand.IsDelete = true;
                brand.DeletedAt = DateTime.Now;
                brand.DeletedBy = "Admin";
            }

            db.SaveChanges();
            return Json(new { success = true, message = "Xóa thương hiệu thành công!" });
        }

        [HttpGet]
        [Route("Admin/Brand/Edit/{id?}")]
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
            var brand = db.Brands.Find(id);
            if (brand == null)
            {
                return NotFound();
            }
            var categories = GetCategory();
            ViewBag.CategoryId = new SelectList(categories, "Value", "Text");
            return View(brand);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Brand model)
        {
            if (ModelState.IsValid)
            {
                var check = db.Brands.FirstOrDefault(x => x.Name == model.Name && x.Id != model.Id && x.IsDelete == false);
                if (check == null)
                {
                    var b = await db.Brands.FindAsync(model.Id);
                    if (b == null)
                    {
                        return NotFound();
                    }
                    b.Name = model.Name;
                    b.CategoryId = model.CategoryId;
                    b.UpdatedBy = "Admin";
                    b.UpdatedAt = DateTime.Now;
                    db.Update(b);
                    await db.SaveChangesAsync();

                    return RedirectToAction("Brand", "Brand", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên thương hiệu đã tồn tại.");
                    ViewBag.CategoryId = new SelectList(GetCategory(), "Value", "Text", model.CategoryId);
                    return View(model);
                }
            }
            return View(model);
        }
    }
}
