using Microsoft.AspNetCore.Mvc;
using WebEazyCao.Models;

namespace WebEazyCao.Areas.Admin.Controllers
{
    public class RoleController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();

        // GET: Admin/Role
        public IActionResult Index()
        {
            var items = db.Roles.ToList();
            return View(items);
        }

        public IActionResult Create()
        {
            return View();
        }


        //public IActionResult Create(IdentityRole model) 
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var roleManage = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(db));
        //        roleManage.Create(model);
        //    }
        //    return View(model);
        //}
    }
}
