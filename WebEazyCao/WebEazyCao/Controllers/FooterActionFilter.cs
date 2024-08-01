using Microsoft.AspNetCore.Mvc.Filters;
using WebEazyCao.Controllers;

public class FooterActionFilter : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        var controller = filterContext.Controller as HomeController;

        if (controller != null)
        {
            controller.SetFooterItems();
        }

        base.OnActionExecuting(filterContext);
    }
}