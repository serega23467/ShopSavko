using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop
{
    public class ProductDataGrid
    {
        public string ProductArticle { get; set; }
        public string? ProductPhoto {  get; set; }
        public string ProductInfo { get; set; }
        public string ProductCount { get; set; }
        public decimal ProductPrice { get; set; }
        public ProductDataGrid(string article, string photo, string name, string desc, string manufactor, decimal price, int count, string meas)
        {
            ProductArticle = article;
            if(photo != null) 
                ProductPhoto = $"{Environment.CurrentDirectory}\\resources\\Images\\{photo}";
            else
                ProductPhoto = $"{Environment.CurrentDirectory}\\resources\\Images\\picture.png";
            ProductInfo = $"{name}\n{desc}\nПроизводитель: {manufactor}\nЦена: {price}";
            ProductCount = $"{count} {meas}";
            ProductPrice = price;
        }
    }
}
