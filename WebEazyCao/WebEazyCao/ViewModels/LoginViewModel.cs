using System.ComponentModel.DataAnnotations;
namespace WebEazyCao.ViewModels
{
    public class LoginViewModel
    {
		[Required(ErrorMessage = "Vui lòng nhập tên tài khoản.")]
		[Display(Name = "Username")]
        public string Username { get; set; }

		[Required(ErrorMessage = "Vui lòng nhập mật khẩu.")]
		[DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }
}
