using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Feedback
{
    public int Id { get; set; }

    public string? Description { get; set; }

    public string? Image { get; set; }

    public int? UserId { get; set; }

    public int? ProductId { get; set; }

    public int? ReplyId { get; set; }

    public bool? IsRead { get; set; }

    public DateTime? Date { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? DeletedAt { get; set; }

    public bool? IsDelete { get; set; }

    public string? DeletedBy { get; set; }

    public virtual Product? Product { get; set; }

    public virtual User? User { get; set; }
}
