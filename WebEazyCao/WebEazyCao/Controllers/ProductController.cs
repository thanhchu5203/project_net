using DataAccess.MailSender;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using WebEazyCao.DAO;
using WebEazyCao.Models;
using WebEazyCao.ViewModels;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using Microsoft.AspNetCore.Identity;
using System.Text.Json;
using static System.Runtime.InteropServices.JavaScript.JSType;
using WebEazyCao.FIlter;


namespace WebEazyCao.Controllers
{

    [Route("product")]
    [MenuActionFilter]
    [AdvActionFilter]
    [FooterActionFilter]
    public class ProductController : Controller
	{

		BanTheCaoContext db = new BanTheCaoContext();
        
        public IActionResult Index()
		{
			return View();
		}

        [Route("productDetail/{Id}")]

        public IActionResult ProductDetail(int Id)
		{
			var objProduct = db.Products
					 .Include(p => p.Category)
					 .Include(p => p.Brand)
					 .FirstOrDefault(n => n.Id == Id);
			if (objProduct == null)
			{
				return NotFound();
			}

			// Lấy các sản phẩm liên quan theo danh mục
			var relatedProducts = db.Products
                                    .Where(p => p.CategoryId == objProduct.CategoryId && p.Id != Id && p.IsDelete == false)
                                    .Take(6) // Giới hạn số lượng sản phẩm liên quan
									.ToList();

			var model = new ProductDetailViewModel
			{
				Product = objProduct,
				RelatedProducts = relatedProducts
			};

			// Lấy UserId từ session
			int? userId = HttpContext.Session.GetInt32("Id");
			// Gán UserId và danh sách phản hồi vào ViewBag
			if (userId.HasValue)
			{
				ViewBag.UserID = userId.Value;
				ViewBag.ListFeedback = new FeedbackDAO().ListFeedbackViewmodel(0, Id);
			}
			else
			{
				ViewBag.UserID = null;
				ViewBag.ListFeedback = new FeedbackDAO().ListFeedbackViewmodel(0, Id); 
			}

			return View(model);
		}


        [HttpGet("search")]
        public async Task<IActionResult> Search(string key, int? page)
        {
            var products = from p in db.Products select p;
            var pageNumber = page ?? 1;
            decimal price;
            bool isNumeric = decimal.TryParse(key, out price);

            IPagedList<Product> pagedProducts = null;

            if (!string.IsNullOrEmpty(key))
            {
                pagedProducts = products.Where(p => p.Name.Contains(key) || p.Description.Contains(key) || (isNumeric && p.Price == price))
                                        .ToList()
                                        .ToPagedList(pageNumber, 6);
            }
            else
            {
                pagedProducts = products.ToList().ToPagedList(pageNumber, 6);
            }

            ViewBag.Products = pagedProducts;
            ViewBag.SearchKey = key;

            return View("Search");
        }

        [Route("category/{categoryId}/{brandId?}")]
        public IActionResult Category(int categoryId, int? brandId, int? page)
        {
            var pageNumber = page ?? 1;
            var products = db.Products.Where(p => p.CategoryId == categoryId && p.IsDelete == false);

            if (brandId.HasValue && brandId.Value != 0)
            {
                products = products.Where(p => p.BrandId == brandId.Value);
            }

            ViewBag.Category = db.Categories.Find(categoryId);
            ViewBag.Products = products.ToList().ToPagedList(pageNumber, 6);
            ViewBag.CurrentCategoryId = categoryId; // Pass the current category ID to the view

            return View("Category");
        }

        [Route("_Comment")]
        public ActionResult _Comment(int userid, int productid)
		{
			var data = new FeedbackDAO().ListFeedbackViewmodel(userid, productid);
			var sessionUser = HttpContext.Session.GetString(CommonConstants.USER_SESSION);
			if (!string.IsNullOrEmpty(sessionUser))
			{
				var userLoginInfo = System.Text.Json.JsonSerializer.Deserialize<UserLoginInfo>(sessionUser);
				if (userLoginInfo != null)
				{
					for (int k = 0; k < data.Count; k++)
					{
						data[k].UserId = userLoginInfo.UserId;
					}
				}
			}
			return PartialView("~/Views/Shared/_Comment.cshtml", data);
		}

		public class UserLogin
		{
			public long UserID { set; get; }
			public string UserName { set; get; }
			public string GroupID { set; get; }
		}

		public class UserLoginInfo
		{
			public int UserId { get; set; }
			public string UserName { get; set; }
			// Các thuộc tính khác...
		}

		public static class CommonConstants
		{
			public static string USER_SESSION = "USER_SESSION";
			public static string CurrentCulture { set; get; }
		}

		[HttpPost]
        [Route("AddNewComment")]
        public JsonResult AddNewComment(int productid, int userid, string feedback, int replyid)
		{
			try
			{
				var newFeedback = new Feedback
				{
					ProductId = productid,
					UserId = userid,
					Description = feedback,
					ReplyId = replyid,
					Date = DateTime.Now
				};

				db.Feedbacks.Add(newFeedback);
				db.SaveChanges();

				return Json(new { status = true });
			}
			catch (Exception ex)
			{
				// Log lỗi nếu cần thiết
				return Json(new { status = false, message = ex.Message });
			}
		}

        [Route("GetFeedback")]
        public ActionResult GetFeedback(int productid)
		{
			var data = new FeedbackDAO().ListFeedbackViewmodel(0, productid);
			return PartialView("~/Views/Shared/_Comment.cshtml", data);
		}
	}
}