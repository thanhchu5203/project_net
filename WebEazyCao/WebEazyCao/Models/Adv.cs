using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Adv
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public string? Image { get; set; }

    public string? Link { get; set; }

    public DateTime? CreatedAt { get; set; }

    public string? CreatedBy { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? DeletedAt { get; set; }

    public bool? IsDelete { get; set; }

    public string? DeletedBy { get; set; }
}
