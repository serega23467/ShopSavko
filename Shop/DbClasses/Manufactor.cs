using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Shop.DbClasses
{
    public class Manufactor
    {
        [Key]
        public int ManufactorID { get; set; }
        public string ManufactorName { get; set; }
    }
}
