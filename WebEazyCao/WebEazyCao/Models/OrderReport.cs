using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class OrderReport
{
    public int Id { get; set; }

    public int? OrderHistoryId { get; set; }

    public string ReportedBy { get; set; } = null!;

    public DateTime? ReportDate { get; set; }

    public string Issue { get; set; } = null!;

    public bool? IsResolved { get; set; }

    public virtual OrderHistory? OrderHistory { get; set; }
}
