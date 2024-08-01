using Microsoft.AspNetCore.Mvc;
using WebEazyCao.Models;

namespace WebEazyCao.ViewComponents
{
    [ViewComponent(Name = "Search")]
    public class SearchViewComponent : ViewComponent
    {
        BanTheCaoContext db = new BanTheCaoContext();

        public async Task<IViewComponentResult> InvokeAsync()
        {
            List<Category> categories = db.Categories.ToList();
            return View("Index", categories);
        }
    }
}
