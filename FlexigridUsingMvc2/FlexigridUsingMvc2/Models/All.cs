﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace FlexigridUsingMvc2.Models
{
    public class Customer
    {
        public string CustomerID { get; set; }
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string ContactTitle { get; set; }
    }




    public class EntContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }
    }
}