using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class ProductDetail
{
    public int Id { get; set; }

    public string? Serial { get; set; }

    public string? Code { get; set; }

    public int? ProductId { get; set; }

    public bool IsDelete { get; set; }

    public virtual ICollection<OrderHistoryDetail> OrderHistoryDetails { get; set; } = new List<OrderHistoryDetail>();

    public virtual Product? Product { get; set; }
}
