using System.ComponentModel.DataAnnotations;
using WebEazyCao.Models;
namespace WebEazyCao.ViewModels
{
	public class ProductDetailViewModel
	{
		public Product Product { get; set; }
		public List<Product> RelatedProducts { get; set; }
	}
}
