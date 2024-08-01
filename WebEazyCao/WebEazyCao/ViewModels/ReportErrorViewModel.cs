using System.ComponentModel.DataAnnotations;

namespace WebEazyCao.ViewModels
{
    public class ReportErrorViewModel
    {
        public int OrderHistoryDetailId { get; set; }
        public string ProductName { get; set; } = null!;
        public string? Serial { get; set; }
        public string? Code { get; set; }

        [Required]
        [Display(Name = "Mô tả lỗi")]
        public string IssueDescription { get; set; } = null!;
    }
}
