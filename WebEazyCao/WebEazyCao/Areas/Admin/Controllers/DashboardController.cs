// Areas/Admin/Controllers/DashboardController.cs
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using WebEazyCao.Models;
using WebEazyCao.ViewModels;

namespace WebEazyCao.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DashboardController : Controller
    {
        BanTheCaoContext db = new BanTheCaoContext();

        [Route("Admin/Dashboard")]
        public IActionResult Dashboard()
        {
            string role = HttpContext.Session.GetString("Role");
            if (role == "User" || role == null)
            {
                return RedirectToAction("AccessDenied", "Home", new { area = "" });
            }
            var viewModel = new DashboardViewModel();

            viewModel.Products = db.Products.ToList();
            viewModel.Users = db.Users.ToList();
            viewModel.Feedbacks = db.Feedbacks.ToList();
            viewModel.OrderHistories = db.OrderHistories.ToList();

            viewModel.Quantities = viewModel.OrderHistories.Select(o => o.Quantity).ToList();
            viewModel.TotalRevenue = viewModel.OrderHistories.Sum(o => o.TotalPrice);
            viewModel.QuantitySold = viewModel.OrderHistories.Sum(o => o.Quantity) ?? 0;
            viewModel.PercentGrowth = CalculatePercentageRevenueGrowth(viewModel);
            LoadMonthlyRevenues(viewModel); // Load monthly revenue data
            LoadBestSellingProducts(viewModel);
            return View(viewModel);
        }

        private void LoadMonthlyRevenues(DashboardViewModel viewModel)
        {
            var orderHistories = viewModel.OrderHistories;

            if (orderHistories != null && orderHistories.Any())
            {
                var monthlyData = orderHistories
                    .Where(o => o.Date.HasValue && o.Date.Value.Year == DateTime.Now.Year)
                    .GroupBy(o => o.Date.Value.Month)
                    .Select(g => new { Month = g.Key, Total = g.Sum(o => o.TotalPrice) })
                    .ToList();

                foreach (var data in monthlyData)
                {
                    viewModel.MonthlyRevenues[data.Month - 1] = data.Total;
                }
            }
        }
        private void LoadBestSellingProducts(DashboardViewModel viewModel)
        {
            var bestSellingProducts = viewModel.OrderHistories
                .GroupBy(o => o.ProductId)
                .Select(g => new { ProductId = g.Key, TotalQuantity = g.Sum(o => o.Quantity) })
                .OrderByDescending(g => g.TotalQuantity)
                .Take(6) // Lấy 5 sản phẩm có số lượng bán nhiều nhất
                .ToList();

            viewModel.BestSellingProducts = new List<Product>();

            foreach (var item in bestSellingProducts)
            {
                var product = db.Products.FirstOrDefault(p => p.Id == item.ProductId);
                if (product != null)
                {
                    product.Quantity = item.TotalQuantity;
                    viewModel.BestSellingProducts.Add(product);
                }
            }
        }
        private decimal CalculatePercentageRevenueGrowth(DashboardViewModel viewModel)
        {
            // Get total revenue of the previous month
            var previousMonthRevenue = viewModel.OrderHistories
                .Where(o => o.Date.HasValue && o.Date.Value.Year == DateTime.Now.Year && o.Date.Value.Month == DateTime.Now.Month - 1)
                .Sum(o => o.TotalPrice);

            if (previousMonthRevenue == 0)
                return 1000; // Return 0 if there's no revenue in the previous month

            // Calculate percentage growth
            var currentMonthRevenue = viewModel.OrderHistories
                .Where(o => o.Date.HasValue && o.Date.Value.Year == DateTime.Now.Year && o.Date.Value.Month == DateTime.Now.Month)
                .Sum(o => o.TotalPrice);

            return (currentMonthRevenue - previousMonthRevenue) / previousMonthRevenue * 100;
        }
    }
}
