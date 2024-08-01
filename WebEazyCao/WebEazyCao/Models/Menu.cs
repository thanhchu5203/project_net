using System;
using System.Collections.Generic;

namespace WebEazyCao.Models;

public partial class Menu
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public string? Description { get; set; }

    public int? Position { get; set; }

    public string? Links { get; set; }

    public string? Location { get; set; }

    public string? Url { get; set; }
}
