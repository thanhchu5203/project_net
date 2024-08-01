namespace WebEazyCao.Models
{
    public class Item
    {
		public int Id { get; set; }

		public string Name { get; set; } = null!;

		public string? Image { get; set; }

		public string? Description { get; set; }

		public decimal Price { get; set; }

		public int Quantity { get; set; }

		public int? CategoryId { get; set; }

		public int? BrandId { get; set; }

		public DateTime? CreatedAt { get; set; }

		public string? CreatedBy { get; set; }

		public DateTime? UpdatedAt { get; set; }

		public string? UpdatedBy { get; set; }

		public DateTime? DeletedAt { get; set; }

		public bool? IsDelete { get; set; }

		public string? DeletedBy { get; set; }

		public virtual ICollection<Adv> Advs { get; set; } = new List<Adv>();

		public virtual Brand? Brand { get; set; }

		public virtual Category? Category { get; set; }

		public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();


		public virtual ICollection<ProductDetail> ProductDetails { get; set; } = new List<ProductDetail>();

	}
}
