using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class OrderHistoryDetail
{
    public int Id { get; set; }

    public int ProductDetailId { get; set; }

    public int OrderHistoryId { get; set; }

    public int CategoryId { get; set; }

    public string ProductName { get; set; } = null!;

    public string? Serial { get; set; }

    public string? Code { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual OrderHistory OrderHistory { get; set; } = null!;

    public virtual ProductDetail ProductDetail { get; set; } = null!;
}
