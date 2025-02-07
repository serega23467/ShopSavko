using System;
using System.Collections.Generic;
using System.IO;
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
using Microsoft.Win32;
using Shop.DbClasses;

namespace Shop
{
    /// <summary>
    /// Логика взаимодействия для WindowAddProduct.xaml
    /// </summary>
    public partial class WindowAddProduct : Window
    {
        string sourceFile = "";
        bool isAddProduct = true;
        Product editedProduct;
        public WindowAddProduct(bool isAdd = true, Product product = null)
        {
            InitializeComponent();

            foreach (var m in ShopDB.GetInstance().Manufactor.ToList())
            {
                comboBoxManufactor.Items.Add(m.ManufactorName);
            }
            comboBoxManufactor.SelectedIndex = 0;
            if (!isAdd)
            {
                if(product == null)
                {
                    Close();
                }
                isAddProduct = false;
                editedProduct = product;
                textBoxArticle.Text = product.ProductArticleNumber;
                textBoxName.Text = product.ProductName;
                textBoxDescriptiom.Text = product.ProductDescription;
                textBoxCategory.Text = product.ProductCategory;
                textBoxCost.Text = product.ProductCost.ToString();
                textBoxAmount.Text = product.ProductQuantityInStock.ToString();
                textBoxDiscount.Text = product.ProductDiscountAmount.ToString();
                textBoxMaxDiscount.Text = product.ProductMaxDiscountAmount.ToString();
                textBoxMeasure.Text = product.ProductUnitOfMeasure;
                textBoxSupplier.Text = product.ProductSupplier;
                comboBoxManufactor.SelectedItem = ShopDB.GetInstance().GetManufactorById(product.ProductManufacturer).ManufactorName;

                textBoxArticle.IsEnabled = false;
                buttonAdd.Content = "Изменить";
                Title = "Окно изменения товара";

                if (product.ProductPhoto != "" && product.ProductPhoto != null)
                {
                    BitmapImage bitmap = new BitmapImage(new Uri($"{Environment.CurrentDirectory}\\resources\\Images\\{product.ProductPhoto}"));
                    imageBox.Source = bitmap;
                    sourceFile = product.ProductPhoto;
                }
            }
        }

        private void buttonImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files|*.jpg;*.jpeg;*.png;*.bmp;*.gif",
                Title = "Выберите изображение"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                sourceFile = openFileDialog.FileName;
                BitmapImage bitmap = new BitmapImage(new Uri(sourceFile));
                imageBox.Source = bitmap;
            }
        }

        private void buttonAdd_Click(object sender, RoutedEventArgs e)
        {
            if(isAddProduct)
            {
                if (textBoxArticle.Text.Length < 4)
                {
                    MessageBox.Show("Введите артикль больше 4 символов!", "Ошибка");
                    return;
                }
                if (ShopDB.GetInstance().Product.Select(p=>p.ProductArticleNumber).Contains(textBoxArticle.Text))
                {
                    MessageBox.Show("Артикль уже используется!", "Ошибка");
                    return;
                }
            }
            if (textBoxName.Text.Length < 4)
            {
                MessageBox.Show("Введите название больше 4 символов!", "Ошибка");
                return;
            }
            if (textBoxDescriptiom.Text.Length < 4)
            {
                MessageBox.Show("Введите описание больше 4 символов!", "Ошибка");
                return;
            }
            if (textBoxSupplier.Text.Length < 4)
            {
                MessageBox.Show("Введите поставщика больше 4 символов!", "Ошибка");
                return;
            }
            if (textBoxMeasure.Text.Length < 1)
            {
                MessageBox.Show("Введите единицу измерения больше 0 символов!", "Ошибка");
                return;
            }
            if (textBoxCategory.Text.Length < 4)
            {
                MessageBox.Show("Введите категорию больше 4 символов!", "Ошибка");
                return;
            }
            if (!decimal.TryParse(textBoxCost.Text.Replace('.', ','), out decimal cost))
            {
                MessageBox.Show("Введите цену!", "Ошибка");
                return;
            }
            if (!byte.TryParse(textBoxDiscount.Text, out byte discount))
            {
                MessageBox.Show("Введите скидку!", "Ошибка");
                return;
            }
            if (!byte.TryParse(textBoxMaxDiscount.Text, out byte maxDiscount))
            {
                MessageBox.Show("Введите максимальную!", "Ошибка");
                return;
            }
            if (!int.TryParse(textBoxAmount.Text, out int count))
            {
                MessageBox.Show("Введите колво на складе!", "Ошибка");
                return;
            }
            if(!isAddProduct)
            {
                editedProduct.ProductName = textBoxName.Text;
                editedProduct.ProductDescription = textBoxDescriptiom.Text;
                editedProduct.ProductCategory = textBoxCategory.Text;
                editedProduct.ProductManufacturer = ShopDB.GetInstance().GetManufactorByName(comboBoxManufactor.SelectedItem.ToString()).ManufactorID;
                editedProduct.ProductUnitOfMeasure = textBoxMeasure.Text;
                editedProduct.ProductSupplier = textBoxSupplier.Text;
                if (sourceFile != "" && editedProduct.ProductPhoto!= sourceFile)
                {
                    File.Copy(sourceFile, $"{Environment.CurrentDirectory}\\resources\\Images\\{System.IO.Path.GetFileName(sourceFile)}", true);
                    editedProduct.ProductPhoto = System.IO.Path.GetFileName(sourceFile);
                }
                editedProduct.ProductDiscountAmount = discount;
                editedProduct.ProductMaxDiscountAmount = maxDiscount;
                editedProduct.ProductQuantityInStock = count;
                editedProduct.ProductCost = cost;

                ShopDB.GetInstance().SaveChanges();
                MessageBox.Show("Продукт успешно изменен!", "Успех");
                Close();
            }
            else
            {
                Product product = new Product();
                product.ProductArticleNumber = textBoxArticle.Text;
                product.ProductName = textBoxName.Text;
                product.ProductDescription = textBoxDescriptiom.Text;
                product.ProductCategory = textBoxCategory.Text;
                product.ProductManufacturer = ShopDB.GetInstance().GetManufactorByName(comboBoxManufactor.SelectedItem.ToString()).ManufactorID;
                product.ProductUnitOfMeasure = textBoxMeasure.Text;
                product.ProductSupplier = textBoxSupplier.Text;
                if (sourceFile!="")
                {
                    File.Copy(sourceFile, $"{Environment.CurrentDirectory}\\resources\\Images\\{System.IO.Path.GetFileName(sourceFile)}", true);
                    product.ProductPhoto = System.IO.Path.GetFileName(sourceFile);
                }
                product.ProductDiscountAmount = discount;
                product.ProductMaxDiscountAmount = maxDiscount;
                product.ProductQuantityInStock = count;
                product.ProductCost = cost;
                ShopDB.GetInstance().Add(product);
                ShopDB.GetInstance().SaveChanges();
                MessageBox.Show("Продукт успешно добавлен!", "Успех");
                Close();
            }
        }

        private void textBoxAmount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void textBoxCost_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
        && (!textBoxCost.Text.Contains(".")
        && textBoxCost.Text.Length != 0)))
            {
                e.Handled = true;
            }
        }
    }
}
