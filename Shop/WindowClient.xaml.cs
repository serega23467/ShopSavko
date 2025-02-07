using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Shop.DbClasses;

namespace Shop
{
    /// <summary>
    /// Логика взаимодействия для WindowClient.xaml
    /// </summary>
    public partial class WindowClient : Window
    {
        User client;
        public WindowClient(User user = null)
        {
            InitializeComponent();
            client = user;
            if (client != null)
            {
                switch(ShopDB.GetInstance().GetRoleById(user.UserRole).RoleName)
                {
                    case "Клиент":
                    case "Менеджер":
                        buttonDeleteProduct.Visibility = Visibility.Hidden;
                        buttonAddProduct.Visibility = Visibility.Hidden;
                        buttonEditProduct.Visibility = Visibility.Hidden;
                        break;
                }
                textBlockUserInfo.Text = $"{user.UserSurname}\n{user.UserName}\n{user.UserPatronymic}";
            }
            else
            {
                buttonDeleteProduct.Visibility = Visibility.Hidden;
                buttonAddProduct.Visibility = Visibility.Hidden;
                buttonEditProduct.Visibility = Visibility.Hidden;
            }
            comboBoxFilter.Items.Add("Все производители");
            foreach (var m in ShopDB.GetInstance().Manufactor.ToList())
            {
                comboBoxFilter.Items.Add(m.ManufactorName);
            }
            comboBoxFilter.SelectedIndex = 0;
            FilterListBox();
            SortListBox();
        }
        void UpdateListBox(int manId = -1)
        {
            listBoxProducts.ItemsSource = null;
            List<ProductDataGrid> productList = new List<ProductDataGrid>();
            var products = ShopDB.GetInstance().Product.ToList();
            int count = products.Count;
            if(manId > 0 && ShopDB.GetInstance().Manufactor.FirstOrDefault(m=>m.ManufactorID == manId) != null)
            {
                products = products.Where(p => p.ProductManufacturer == manId).ToList();
            }
            foreach (var p in products)
            {
                var man = ShopDB.GetInstance().GetManufactorById(p.ProductManufacturer);
                if (man == null)
                    return;
                productList.Add(new ProductDataGrid(p.ProductArticleNumber,p.ProductPhoto, p.ProductName, p.ProductDescription, man.ManufactorName, p.ProductCost, p.ProductQuantityInStock, p.ProductUnitOfMeasure));
            }
            if(textBlockResult!=null)
                textBlockResult.Text = $"{productList.Count} из {count} элементов";
            listBoxProducts.ItemsSource = productList;
        }
        void FilterListBox()
        {
            var man = ShopDB.GetInstance().GetManufactorByName(comboBoxFilter.SelectedItem.ToString());
            if (man != null)
            {
                UpdateListBox(man.ManufactorID);
            }
            else
            {
                UpdateListBox();
            }
        }
        void SortListBox()
        {
            bool byUp = true;
            if (comboBoxSort.SelectedIndex == 1)
            {
                 byUp = false;
            }
            var items = listBoxProducts.Items.Cast<ProductDataGrid>().ToList();
            if(items != null)
            {
                listBoxProducts.ItemsSource = null;
                if (byUp)
                    listBoxProducts.ItemsSource = items.OrderBy(i => i.ProductPrice).ToList();
                else
                    listBoxProducts.ItemsSource = items.OrderByDescending(i => i.ProductPrice).ToList();

            //    for (int i = 0; i < listBoxProducts.Items.Count; i++)
            //    {
            //        var prod = listBoxProducts.Items[i] as ProductDataGrid;
            //        if (prod != null)
            //        {
            //            if(int.Parse(string.Join("", prod.ProductCount.Where(c=>char.IsDigit(c)))) <= 0)
            //            {
            //                var listBoxItem = listBoxProducts.Items[i] = new ListBoxItem { Content = prod, Foreground = Brushes.Black };
            //            }
            //        }
            //    }
            //
            }
        }
        private void buttonExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            Close();
        }
        private void buttonDeleteProduct_Click(object sender, RoutedEventArgs e)
        {
            ProductDataGrid productDataGrid = listBoxProducts.SelectedItem as ProductDataGrid;
            if (productDataGrid != null)
            {
                var product = ShopDB.GetInstance().Product.FirstOrDefault(p => p.ProductArticleNumber == productDataGrid.ProductArticle);
                if (product != null)
                {
                    if (ShopDB.GetInstance().OrderProduct.Select(p => p.ProductArticleNumber).Contains(product.ProductArticleNumber))
                    {
                        MessageBox.Show("Товар есть в заказе!", "Ошибка");
                        return;
                    }
                    ShopDB.GetInstance().Product.Remove(product);
                    ShopDB.GetInstance().SaveChanges();
                    MessageBox.Show("Товар удален!", "Успех");
                    FilterListBox();
                    SortListBox();
                }
            }
            else
            {
                MessageBox.Show("Выберите товар!", "Ошибка");
            }
        }

        private void comboBoxFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FilterListBox();
            SortListBox();
        }

        private void comboBoxSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortListBox();
        }

        private void textBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterListBox();
            SortListBox();
            var items = listBoxProducts.Items.Cast<ProductDataGrid>().ToList();
            if (items != null)
            {
                listBoxProducts.ItemsSource = null;
                var toShow = items.Where(i=>i.ProductInfo.ToLower().Contains(textBoxSearch.Text.ToLower()) || i.ProductCount.Contains(textBoxSearch.Text.ToLower())).ToList();
                listBoxProducts.ItemsSource = toShow;
                if (textBlockResult != null)
                    textBlockResult.Text = $"{toShow.Count} из {ShopDB.GetInstance().Product.ToList().Count} элементов";
            }
            SortListBox();
        }

        private void buttonEditProduct_Click(object sender, RoutedEventArgs e)
        {
            ProductDataGrid productDataGrid = listBoxProducts.SelectedItem as ProductDataGrid;
            if (productDataGrid != null)
            {
                var product = ShopDB.GetInstance().Product.FirstOrDefault(p => p.ProductArticleNumber == productDataGrid.ProductArticle);
                if (product != null)
                {
                    WindowAddProduct windowEditProduct = new WindowAddProduct(false, product);
                    windowEditProduct.ShowDialog();
                    FilterListBox();
                    SortListBox();
                }
            }
            else
            {
                MessageBox.Show("Выберите товар!", "Ошибка");
            }
        }

        private void buttonAddProduct_Click(object sender, RoutedEventArgs e)
        {
            WindowAddProduct windowAddProduct = new WindowAddProduct();
            windowAddProduct.ShowDialog();
            FilterListBox();
            SortListBox();
        }
    }
}
