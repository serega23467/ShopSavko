using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Shop.DbClasses
{
    public class ShopDB : DbContext
    {
        static ShopDB instance;
        public DbSet<User> User { get; set; } = null!;
        public DbSet<Role> Role { get; set; } = null!;
        public DbSet<Manufactor> Manufactor { get; set; } = null!;
        public DbSet<Product> Product { get; set; } = null!;
        public DbSet<OrderProduct> OrderProduct { get; set; } = null!;

        ShopDB() { }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=GK220_1;Database=Trade;Trusted_Connection=True;TrustServerCertificate=True;");
        }
        public static ShopDB GetInstance()
        {
            if (instance == null)
            {
                instance = new ShopDB();
            }
            return instance;
        }
        public User GetUserById(int id)
        {
            return User.FirstOrDefault(u => u.UserID == id);
        }
        public Role GetRoleById(int id)
        {
            return Role.FirstOrDefault(u => u.RoleID == id);
        }
        public Manufactor GetManufactorById(int id)
        {
            return Manufactor.FirstOrDefault(m => m.ManufactorID == id);
        }
        public Product GetProductByArticle(string article)
        {
            return Product.FirstOrDefault(p => p.ProductArticleNumber == article);
        }
        public Manufactor GetManufactorByName(string name)
        {
            return Manufactor.FirstOrDefault(m => m.ManufactorName == name);
        }
    }
}
