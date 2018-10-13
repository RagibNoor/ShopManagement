using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopManagement.ViewModel
{
    public class Sell
    {
        [Required(ErrorMessage = "This Field is Required")]
        [Display(Name = "Customer")]
        public int CustomerId { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        [Display(Name = "Product")]
        public int ProductId { get; set; }

        public string ProductName { get; set; }
        public string CustomerName { get; set; }
        public string SupplierName { get; set; }
    }
}