using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.DbClasses
{
    public class Product
    {
        [Key]
        public string ProductArticleNumber { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCategory { get; set; }
        public string? ProductPhoto { get; set; }
        public int ProductManufacturer { get; set; }
        public string ProductSupplier { get; set; }
        public decimal ProductCost { get; set; }
        public byte ProductDiscountAmount { get; set; }
        public byte ProductMaxDiscountAmount { get; set; }
        public int ProductQuantityInStock { get; set; }
        public string ProductUnitOfMeasure { get; set; }
    }
}
