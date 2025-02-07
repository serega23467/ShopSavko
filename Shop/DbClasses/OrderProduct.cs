using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.DbClasses
{
    public class OrderProduct
    {
        [Key]
        public int OrderProductID { get; set; }
        public int OrderID { get; set; }
        public string ProductArticleNumber { get; set; }
        public int ProductCount { get; set; }
    }
}
