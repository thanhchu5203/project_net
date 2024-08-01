using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace WebEazyCao.Controllers
{
    public class MenuActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var controller = context.Controller as HomeController;
            controller?.SetMenuItems();
            base.OnActionExecuting(context);
        }
    }
}
