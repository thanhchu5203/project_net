using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;
using X.PagedList;
using System.Threading.Tasks;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UserControllers : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();

        [Route("Admin/User")]
        public async Task<IActionResult> User(int? page)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }

            var pageSize = 10;
            var pageNumber = page ?? 1;

            // Use asynchronous operations with `await`
            var users = await db.Users
                                .Where(u => u.IsDelete == false)
                                .OrderByDescending(c => c.Id)
                                .ToPagedListAsync(pageNumber, pageSize);

            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = users.PageCount;

            return View(users);
        }


        [Route("Admin/User/Add")]
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
        [Route("Admin/User/Add")]
        public async Task<IActionResult> Add(User model)
        {
            if (ModelState.IsValid)
            {
                var userExists = await db.Users.AnyAsync(x => x.Id == model.Id);
                if (!userExists)
                {
                    User u = new User
                    {
                        Name = model.Name,
                        Email = model.Email,
                        Phone = model.Phone,
                        Address = model.Address,
                        UserName = model.UserName,
                        Password = GetMD5(model.Password),
                        RoleId = 2,
                        IsActive = false,
                        Money = model.Money,
                        CreatedAt = DateTime.Now,
                        CreatedBy = "Admin",
                        IsDelete = false,
                    };

                    db.Users.Add(u);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Search","User", new { area = "Admin" });
                }
                else
                {
                    ModelState.AddModelError("UserName", "Tên đăng nhập đã tồn tại.");
                }
            }
            return View(model);
        }

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
        [Route("Admin/User/Delete")]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await db.Users.FirstOrDefaultAsync(c => c.Id == id);
            if (user != null)
            {
                // Check if the username is "admin" or if the user is active
                if (user.RoleId == 1)
                {
                    return Json(new { success = false, message = "Không thể xoá tài khoản admin" });
                }

                if (user.IsActive == true)
                {
                    return Json(new { success = false, message = "Không thể xoá tài khoản đang hoạt động" });
                }

                // Proceed with deletion for non-admin, inactive users
                user.IsDelete = true;
                user.DeletedAt = DateTime.Now;
                user.DeletedBy = "Admin";

                await db.SaveChangesAsync();
                return Json(new { success = true, message = "Xoá tải khoản thành công!" });
            }
            return Json(new { success = false, message = "Tài khoản không tồn tại." });
        }

        [HttpGet]
        [Route("Admin/User/Edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }

            var user = await db.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        [HttpPost]
        [Route("Admin/User/Edit")]
        public async Task<IActionResult> Edit(User model)
        {
            if (ModelState.IsValid)
            {
                var user = await db.Users.FirstOrDefaultAsync(x => x.Id == model.Id);
                if (user == null)
                {
                    return NotFound();
                }

                user.Name = model.Name;
                user.Email = model.Email;
                user.Phone = model.Phone;
                user.Address = model.Address;
                user.IsActive = model.IsActive;
                user.Money = model.Money;
                user.UpdatedAt = DateTime.Now;
                user.UpdatedBy = "Admin";

                db.Update(user);
                await db.SaveChangesAsync();

                return RedirectToAction("Search", "User", new { area = "Admin" });
            }
            return View(model);
        }

        [HttpGet("Admin/User/Search")]
        public async Task<IActionResult> Search(string key, int? page)
        {
            var users = db.Users.Where(u => u.IsDelete == false);
            var pageNumber = page ?? 1;
            bool isNumeric = int.TryParse(key, out var id);
            var pageSize = 10;
            IPagedList<User> pagedUsers;

            if (!string.IsNullOrEmpty(key))
            {
                pagedUsers = await users
                    .Where(u => u.UserName.Contains(key) || u.Name.Contains(key) || (isNumeric && u.Id == id))
                    .OrderByDescending(u => u.Id)
                    .ToPagedListAsync(pageNumber, pageSize);
            }
            else
            {
                pagedUsers = await users
                    .OrderByDescending(u => u.Id)
                    .ToPagedListAsync(pageNumber, pageSize);
            }

            ViewBag.SearchKey = key;
            ViewBag.PageNumber = pageNumber;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = pagedUsers.PageCount;

            return View("User", pagedUsers);
        }

    }
}
