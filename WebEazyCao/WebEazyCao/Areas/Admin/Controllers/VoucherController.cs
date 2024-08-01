using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class VoucherController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();
        // GET: Admin/Voucher
        [Route("Admin/Voucher")]
        public async Task<IActionResult> Voucher()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var vouchers = await db.Vouchers.Include(v => v.Orders)
                                            .Where(v => v.IsDelete == false)
                                            .OrderByDescending(v => v.Id)
                                            .ToListAsync();
            return View(vouchers);
        }

        private List<SelectListItem> GetVoucherTypes()
        {
            return new List<SelectListItem>
            {
                 new SelectListItem { Value = "1", Text = "%" },
                 new SelectListItem { Value = "2", Text = "VNĐ" },
            };
        }

        [Route("Admin/Voucher/Add")]
        public IActionResult Add()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            // Giả sử bạn có một phương thức để lấy danh sách các loại voucher
            var voucherTypes = GetVoucherTypes();

            // Truyền danh sách này vào ViewBag
            ViewBag.VoucherTypes = new SelectList(voucherTypes, "Value", "Text");

            return View();
        }

        [HttpPost]
        [Route("Admin/Voucher/Add")]
        public async Task<IActionResult> Add(Voucher model)
        {
            if (ModelState.IsValid)
            {
                var check = await db.Categories.FirstOrDefaultAsync(x => x.Name == model.Name && x.IsDelete == false);
                if (check == null)
                {
                    Voucher v = new Voucher()
                    {
                        Name = model.Name,
                        Discount = model.Discount,
                        Type = model.Type,
                        RemainUsed = model.RemainUsed,
                        IsActive = true,
                        CreatedAt = DateTime.Now,
                        CreatedBy = "Admin",
                        IsDelete = false,
                    };
                    db.Vouchers.Add(v);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Voucher", "Voucher", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên mã giảm giá đã tồn tại.");
                    return View(model);
                }
            }
            return View(model);
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            // Tìm mã giảm giá cần xóa
            var voucher = db.Vouchers.FirstOrDefault(v => v.Id == id);
            if (voucher != null)
            {
                // Cập nhật trạng thái IsDelete thay vì xóa
                voucher.IsDelete = true;
                voucher.DeletedAt = DateTime.Now;
                voucher.DeletedBy = "Admin";

                db.SaveChanges();
                return Json(new { success = true, message = "Xóa mã giảm giá thành công!" });
            }
            return Json(new { success = false, message = "Mã giảm giá không tồn tại." });
        }

        [HttpPost]
        public IActionResult DeleteAllSelect(int[] ids)
        {
            if (ids == null || !ids.Any())
            {
                return Json(new { success = false, message = "Không có danh mục nào được chọn để xóa." });
            }
            // Tìm tất cả mã giảm giá có ID trong danh sách ids
            var vouchersToDelete = db.Vouchers.Where(b => ids.Contains(b.Id)).ToList();
            if (vouchersToDelete.Count == 0)
            {
                return Json(new { success = false, message = "Không tìm thấy danh mục để xóa." });
            }
            foreach (var voucher in vouchersToDelete)
            {
                voucher.IsDelete = true;
                voucher.DeletedAt = DateTime.Now; 
                voucher.DeletedBy = "Admin"; 
            }
            // Lưu thay đổi vào database
            db.SaveChanges();
            return Json(new { success = true, message = "Xóa danh mục thành công!" });
        }

        [HttpGet]
        [Route("Admin/Voucher/Edit/{id?}")]
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
            var voucher = db.Vouchers.Find(id);
            if (voucher == null)
            {
                return NotFound();
            }
            // Giả sử bạn có một phương thức để lấy danh sách các loại voucher
            var voucherTypes = GetVoucherTypes();

            // Truyền danh sách này vào ViewBag
            ViewBag.VoucherTypes = new SelectList(voucherTypes, "Value", "Text");
            return View(voucher);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Voucher model)
        {
            if (ModelState.IsValid)
            {
                var check = db.Vouchers.FirstOrDefault(x => x.Name == model.Name && x.Id != model.Id && x.IsDelete == false);
                if (check == null)
                {
                    var v = await db.Vouchers.FindAsync(model.Id);
                    if (v == null)
                    {
                        return NotFound();
                    }
                    v.Name = model.Name;
                    v.Discount = model.Discount;
                    v.Type = model.Type;
                    v.RemainUsed = model.RemainUsed;
                    v.IsActive = model.IsActive;
                    v.UpdatedAt = DateTime.Now;
                    v.UpdatedBy = "Admin";
                    db.Update(v);
                    await db.SaveChangesAsync();

                    return RedirectToAction("Voucher", "Voucher", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("Name", "Tên mã giảm giá đã tồn tại.");
                    return View(model);
                }
            }
            return View(model);
        }
    }
}
