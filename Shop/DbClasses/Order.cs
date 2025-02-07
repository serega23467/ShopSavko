using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.DbClasses
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime OrderDeliveryDate { get; set; }
        public int OrderStatusID { get; set; }
        public int OrderUserID { get; set; }
        public int OrderPickupPoint { get; set; }
        public int OrderCode { get; set; }
    }
}
