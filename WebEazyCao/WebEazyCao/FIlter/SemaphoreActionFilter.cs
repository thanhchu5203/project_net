using Microsoft.AspNetCore.Mvc.Filters;

namespace WebEazyCao.FIlter
{
    public class SemaphoreActionFilter : IAsyncActionFilter
    {
        private static SemaphoreSlim semaphoreSlim = new SemaphoreSlim(1, 1);

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            await semaphoreSlim.WaitAsync();
            try
            {
                await next.Invoke();
            }
            finally
            {
                semaphoreSlim.Release();
            }
        }
    }
}
