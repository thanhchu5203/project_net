using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebEazyCao.Models;

namespace WebEazyCao.ViewComponents
{
    [ViewComponent(Name = "Category")]
    public class CategoryViewComponent : ViewComponent
    {
        private readonly BanTheCaoContext _db;

        public CategoryViewComponent(BanTheCaoContext context)
        {
            _db = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = await _db.Categories
                                      .Where(c => c.IsDelete == false)
                                      .Include(c => c.Brands)
                                      .ToListAsync();
            return View("Index", categories);
        }
    }
}
