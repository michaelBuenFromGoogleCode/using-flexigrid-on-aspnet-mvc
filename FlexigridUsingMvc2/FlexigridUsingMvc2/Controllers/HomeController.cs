using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FlexigridUsingMvc2.Models;

using FlexigridUsingMvc2.Extensions;

namespace FlexigridUsingMvc2.Controllers
{
    public class HomeController : Controller
    {

        [HttpPost]
        public JsonResult List(int page, int rp, string qtype, string letter_pressed, string query)
        {

            using (var db = new EntContext())
            {
                if (letter_pressed == "ALL" ) letter_pressed = "";

                Func<IQueryable<Customer>> CustomerFiltered = () =>
                    db.Customers
                    .Where(x =>                                 
                            (
                                (
                                    !string.IsNullOrEmpty(letter_pressed)
                                    && x.CompanyName.StartsWith(letter_pressed)
                                )
                                ||
                                string.IsNullOrEmpty(letter_pressed)
                            )
                            &&
                            (
                                (
                                    !string.IsNullOrEmpty(query)
                                    && 
                                    (
                                        (qtype == "CompanyName" && x.CompanyName.Contains(query))
                                        ||
                                        (qtype == "ContactName" && x.ContactName.Contains(query))
                                        ||
                                        (qtype == "ContactTitle" && x.ContactTitle.Contains(query))
                                    )
                                )
                                ||
                                string.IsNullOrEmpty(query)
                            )
                        );
                

                return Json(
                    new
                    {
                        page = page,
                        total = CustomerFiltered().Count(),
                        rows =
                            CustomerFiltered()                            
                            .OrderBy(x => x.CompanyName)
                            .LimitAndOffset(pageSize: rp, pageOffset: page)
                            .ToList()
                            .Select(x =>
                                new
                                {
                                    id = x.CustomerID,
                                    cell = new string[] { x.CompanyName, x.ContactName, x.ContactTitle }
                                })                            
                    });
                

            }//using
        }//List

        public ActionResult Index()
        {
            return View();
        }


    }
}
