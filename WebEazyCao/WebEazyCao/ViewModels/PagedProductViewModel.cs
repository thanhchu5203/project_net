using System.ComponentModel.DataAnnotations;
using WebEazyCao.Models;

namespace WebEazyCao.ViewModels
{
    public class PagedProductViewModel
    {
        public List<Product> Products { get; set; }
        public int PageNumber { get; set; }
        public int TotalPages { get; set; }
        public int PageSize { get; set; }
    }
}
