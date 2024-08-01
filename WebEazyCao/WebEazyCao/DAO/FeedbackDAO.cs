using WebEazyCao.Models;
using WebEazyCao.ViewModels;

namespace WebEazyCao.DAO
{
	public class FeedbackDAO
	{
		BanTheCaoContext db = new BanTheCaoContext();
		public bool Insert(Feedback feedback)
		{
			db.Feedbacks.Add(feedback);
			db.SaveChanges();
			return true;
		}
		public List<Feedback> ListFeedback(int ReplyId, int ProductId)
		{
			return db.Feedbacks.Where(x => x.ReplyId == ReplyId && x.ProductId == ProductId).ToList();
		}
		public List<FeedbackViewModel> ListFeedbackViewmodel(int ReplyId, int ProductId)
		{
			var model = (from a in db.Feedbacks
						 join b in db.Users
						 on a.UserId equals b.Id
						 where a.ProductId == ProductId && (ReplyId == 0 || a.ReplyId == ReplyId)
						 select new
						 {
							 Id = a.Id,
							 Description = a.Description,
							 Date = a.Date,
							 UserId = a.UserId,
							 ProductId = ProductId,
							 Name = b.Name,
							 ReplyId=a.ReplyId

						 }).AsEnumerable().Select(x => new FeedbackViewModel()
						 {
							 Id = x.Id,
							 Description = x.Description,
                             Date = x.Date.HasValue ? x.Date.Value : DateTime.MinValue,
                             UserId = (int)x.UserId,
							 ProductId = x.ProductId,
                             ReplyId = x.ReplyId ?? default(int),
                             Name = x.Name,
							 DaysAgo = x.Date.HasValue ? (DateTime.Now.Date - x.Date.Value.Date).Days : (int?)null,
							 ElapsedTime = GetElapsedTime(x.Date)
						 });
			return model.OrderByDescending(y=> y.Id).ToList();

		}
		private string GetElapsedTime(DateTime? commentDate)
		{
			if (!commentDate.HasValue)
			{
				return "Không xác định";
			}

			var elapsed = DateTime.Now - commentDate.Value;

			if (elapsed.TotalDays >= 1)
			{
				return $"{(int)elapsed.TotalDays} ngày trước";
			}
			else if (elapsed.TotalHours >= 1)
			{
				return $"{(int)elapsed.TotalHours} giờ trước";
			}
			else if (elapsed.TotalMinutes >= 1)
			{
				return $"{(int)elapsed.TotalMinutes} phút trước";
			}
			else
			{
				return "Vừa xong";
			}
		}

	}
}
