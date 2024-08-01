using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Footer
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int? Position { get; set; }

    public string? Description { get; set; }

    public string? Links { get; set; }
}
