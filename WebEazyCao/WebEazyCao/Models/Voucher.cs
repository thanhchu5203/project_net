using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Voucher
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public decimal Discount { get; set; }

    public int Type { get; set; }

    public int RemainUsed { get; set; }

    public bool? IsActive { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? DeletedAt { get; set; }

    public bool? IsDelete { get; set; }

    public string? DeletedBy { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
