using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopManagement.Models
{
    public class Product
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        [Display(Name = "Supplier")]
        public string SupplierId { get; set; }

        public string SupplierName { get; set; }
    }
}