using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using EasyCaptcha.Wpf;
using Shop.DbClasses;

namespace Shop
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        int enterCount = 0;
        bool hasCaptcha = false;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void buttonLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = textBoxLogin.Text;
            string password = passwordBox.Password;

            if (login == "" || password == "")
            {
                MessageBox.Show("Введите логин и пароль!", "Ошибка");
                return;
            }
            if (enterCount >= 1)
            {
                if(!hasCaptcha)
                {
                    hasCaptcha = true;
                    captcha.Visibility = Visibility.Visible;
                    textBoxCaptcha.Visibility = Visibility.Visible;
                    textBlockCaptcha.Visibility = Visibility.Visible;
                }
                else
                {
                    if (captcha.CaptchaText.ToLower() != textBoxCaptcha.Text.ToLower())
                    {
                        MessageBox.Show("Неверная капча!", "Ошибка");
                        captcha.CreateCaptcha(Captcha.LetterOption.Alphanumeric, 4);
                        return;
                    }
                }
            }
            User user = ShopDB.GetInstance().User.FirstOrDefault(u=>u.UserLogin == login && u.UserPassword == password);
            if (user == null)
            {
                MessageBox.Show("Неверный логин или пароль!", "Ошибка");
                enterCount++;
                if (hasCaptcha)
                {
                    captcha.CreateCaptcha(Captcha.LetterOption.Alphanumeric, 4);
                }
                return;
            }
            WindowClient window = new WindowClient(user);
            window.Show();
            Close();
        }

        private void buttonLoginGuest_Click(object sender, RoutedEventArgs e)
        {
            WindowClient window = new WindowClient();
            window.Show();
            Close();
        }
    }
}