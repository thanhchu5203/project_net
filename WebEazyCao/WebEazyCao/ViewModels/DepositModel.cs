﻿using System.ComponentModel.DataAnnotations;

namespace WebEazyCao.ViewModels
{
    public class DepositModel
    {
        [Range(10000, 500000, ErrorMessage = "Số tiền chỉ trong khoảng từ 10,000 đến 500,000")]
        public int amount { get; set; }
        public string? description { get; set; }
    }
}
