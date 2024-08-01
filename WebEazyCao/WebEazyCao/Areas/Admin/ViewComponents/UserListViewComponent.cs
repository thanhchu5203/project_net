// File: ViewComponents/UserListViewComponent.cs
using Microsoft.AspNetCore.Mvc;
using X.PagedList;
using WebEazyCao.Models;
using System.Linq;
using System.Threading.Tasks;

namespace WebEazyCao.ViewComponents
{
    public class UserListViewComponent : ViewComponent
    {
        private readonly BanTheCaoContext _context;

        public UserListViewComponent(BanTheCaoContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync(string searchKey, int? page)
        {
            var pageSize = 2;
            var pageNumber = page ?? 1;

            var users = from u in _context.Users
                        where u.IsDelete == false
                        select u;

            bool isNumeric = int.TryParse(searchKey, out var id);

            if (!string.IsNullOrEmpty(searchKey))
            {
                users = users.Where(u => u.UserName.Contains(searchKey) || u.Name.Contains(searchKey) || (isNumeric && u.Id == id));
            }

            var pagedUsers = await users
                .OrderByDescending(u => u.Id)
                .ToPagedListAsync(pageNumber, pageSize);

            return View("Index", pagedUsers);
        }
    }
}
