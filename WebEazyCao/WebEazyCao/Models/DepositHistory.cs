using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class DepositHistory
{
    public int Id { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? CreatedBy { get; set; }

    public string? Description { get; set; }

    public decimal Money { get; set; }

    public int? UserId { get; set; }

    public bool? IsSuccess { get; set; }

    public virtual User? User { get; set; }
}
