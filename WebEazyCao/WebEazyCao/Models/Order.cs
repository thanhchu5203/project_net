using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Order
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public int? Quantity { get; set; }

    public int? ProductId { get; set; }

    public int? VoucherId { get; set; }

    public virtual Product? Product { get; set; }

    public virtual User? User { get; set; }

    public virtual Voucher? Voucher { get; set; }
}
