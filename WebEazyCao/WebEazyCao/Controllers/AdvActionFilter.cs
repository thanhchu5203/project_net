using Microsoft.AspNetCore.Mvc.Filters;
using WebEazyCao.Controllers;

public class AdvActionFilter : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        var controller = filterContext.Controller as HomeController;

        if (controller != null)
        {
            controller.SetAdvItems();
        }

        base.OnActionExecuting(filterContext);
    }
}