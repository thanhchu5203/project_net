
namespace WebEazyCao.ViewModels
{
	public class FeedbackViewModel
	{
		public int Id { get; set; }

		public string Description { get; set; }

		public string Image { get; set; }

		public int UserId { get; set; }

		public int ProductId { get; set; }
        public int ReplyId { get; set; }

        public DateTime Date { get; set; }
		public string Name { get; set; }
		public int? DaysAgo { get; set; }
		public string ElapsedTime { get; set; }
	}
}
