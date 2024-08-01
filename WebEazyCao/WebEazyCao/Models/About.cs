using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class About
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public string? Detail { get; set; }

    public bool? IsRead { get; set; }

    public int? UserId { get; set; }

    public virtual User? User { get; set; }
}
