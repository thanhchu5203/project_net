// ViewModels/DashboardViewModel.cs
using WebEazyCao.Models;
using System.Linq;
namespace WebEazyCao.ViewModels
{
    public class DashboardViewModel
    {
        public List<Product> Products { get; set; }
        public List<User> Users { get; set; }
        public List<Feedback> Feedbacks { get; set; }
        public List<OrderHistory> OrderHistories { get; set; }
        public List<int?> Quantities { get; set; }
        public decimal TotalRevenue { get; set; }
        public List<string> AllMonths { get; set; }
        public List<decimal> MonthlyRevenues { get; set; }
        public List<Product> BestSellingProducts { get; set; }
        public int QuantitySold { get; set; }
        public decimal PercentGrowth { get; set; }
        public DashboardViewModel()
        {
            AllMonths = new List<string>
            {
                "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            };

            MonthlyRevenues = new List<decimal>(new decimal[12]);
        }
    }
}
