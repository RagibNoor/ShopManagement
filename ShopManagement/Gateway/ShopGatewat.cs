using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using ShopManagement.Models;
using ShopManagement.ViewModel;

namespace ShopManagement.Gateway
{
    public class ShopGateway
    {
        private string ConnectinString = WebConfigurationManager.ConnectionStrings["ShopMangement"].ConnectionString;
        public int AddCustomer(Customer customer)
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "insert into Customer_tbl(CustomerName,customerId) values(@name,@customerId)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("name", customer.Name);
            cmd.Parameters.AddWithValue("customerId", customer.CustomerId);
            int rowCount = cmd.ExecuteNonQuery();
            con.Close();
            return rowCount;
        }
        public int AddSupplier(Supplier supplier)
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "insert into Supplier_tbl(SupplierName,SupplierId) values(@name,@SupplierId)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("name", supplier.Name);
            cmd.Parameters.AddWithValue("SupplierId", supplier.SupplierId);
            int rowCount = cmd.ExecuteNonQuery();
            con.Close();
            return rowCount;
        }
        public int AddProduct(Product product)
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "insert into Product_tbl(Name,SupplierId) values(@name,@SupplierId)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("name", product.Name);
            cmd.Parameters.AddWithValue("SupplierId", product.SupplierId);
            int rowCount = cmd.ExecuteNonQuery();
            con.Close();
            return rowCount;
        }

        public List<Supplier> GetsSuppliers()
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "Select * from Supplier_tbl";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            List<Supplier> suppliers = new List<Supplier>();
            while (reader.Read())
            {
                Supplier supplier = new Supplier();
                supplier.Name = reader["SupplierName"].ToString();
                supplier.Id = (int)reader["Id"];
                suppliers.Add(supplier);
            }
            reader.Close();
            con.Close();
            return suppliers;
        }

        public List<Customer> GetsCustomers()
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "Select * from Customer_tbl";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            List<Customer> customers = new List<Customer>();
            while (reader.Read())
            {
                Customer customer = new Customer();
                customer.Name = reader["CustomerName"].ToString();
                customer.Id = (int)reader["Id"];
                customers.Add(customer);
            }
            reader.Close();
            con.Close();
            return customers;
        }

        public List<Product> GetsproProducts()
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "Select * from Product_tbl";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            List<Product> products = new List<Product>();
            while (reader.Read())
            {
                Product product = new Product();
                product.Name = reader["Name"].ToString();
                product.Id = Convert.ToInt32(reader["Id"]);
                

                products.Add(product);
            }
            reader.Close();
            con.Close();
            return products;
        }

        public int SellProduct(Sell product)
        {
            SqlConnection con = new SqlConnection(ConnectinString);
            con.Open();
            string query = "insert into sell_tbl(ProductId,CustomerId) values(@ProductId,@CustomerId)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("ProductId", product.ProductId);
            cmd.Parameters.AddWithValue("CustomerId", product.CustomerId);
            int rowCount = cmd.ExecuteNonQuery();
            con.Close();
            return rowCount;
        }

        
    }
}