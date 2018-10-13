using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopManagement.Models
{
    public class Customer
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        public string Name { get; set; }
        [Required(ErrorMessage = "This Field is Required")]
        [Display(Name = " Customer code")]
        public string CustomerId { get; set; }
    }
}