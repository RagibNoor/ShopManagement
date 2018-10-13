using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopManagement.Gateway;
using ShopManagement.Models;
using ShopManagement.ViewModel;

namespace ShopManagement.Controllers
{
    public class HomeController : Controller
    {
        ShopGateway shop = new ShopGateway();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpGet]
        public ActionResult AddCustomer()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCustomer( Customer customer)
        {
            if (shop.AddCustomer(customer)>0)
            {
                ViewBag.Message = "Saved";
            }
            else
            {
                ViewBag.Message = "error";
            }
            
            return View();
        }
        [HttpGet]
        public ActionResult AddSupplier()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddSupplier(Supplier supplier)
        {
            if (shop.AddSupplier(supplier) > 0)
            {
                ViewBag.Message = "Saved";
            }
            else
            {
                ViewBag.Message = "error";
            }
           
            return View();
        }

        [HttpGet]
        public ActionResult AddProduct()
        {
            ViewBag.Supplieres = shop.GetsSuppliers();
            return View();
        }
        [HttpPost]
        public ActionResult AddProduct(Product product)
        {
            ViewBag.Supplieres = shop.GetsSuppliers();
            if (shop.AddProduct(product) > 0)
            {
                ViewBag.Message = "Saved";
            }
            else
            {
                ViewBag.Message = "error";
            }
            return View();
        }

        [HttpGet]
        public ActionResult sellProduct()
        {
            ViewBag.Customers = shop.GetsCustomers();
            ViewBag.Products = shop.GetsproProducts();
            return View();
        }

        [HttpPost]
        public ActionResult sellProduct(Sell sell)
        {
            ViewBag.Customers = shop.GetsCustomers();
            ViewBag.Products = shop.GetsproProducts();
            if (shop.SellProduct(sell) > 0)
            {
                ViewBag.Message = "Saved";
            }
            else
            {
                ViewBag.Message = "error";
            }
            return View();
        }
    }
}