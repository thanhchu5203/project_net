using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Notification
{
    public int Id { get; set; }

    public string? Content { get; set; }

    public bool? IsRead { get; set; }

    public DateTime? CreatedAt { get; set; }

    public int? FeedbackId { get; set; }

    public string? Url { get; set; }

    public virtual Feedback? Feedback { get; set; }
}
