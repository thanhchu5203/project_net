using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class OrderHistory
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public int? ProductId { get; set; }

    public DateTime? Date { get; set; }

    public int? Quantity { get; set; }

    public decimal TotalPrice { get; set; }

    public string ProductName { get; set; } = null!;

    public virtual ICollection<OrderHistoryDetail> OrderHistoryDetails { get; set; } = new List<OrderHistoryDetail>();

    public virtual ICollection<OrderReport> OrderReports { get; set; } = new List<OrderReport>();

    public virtual Product? Product { get; set; }

    public virtual User? User { get; set; }
}
