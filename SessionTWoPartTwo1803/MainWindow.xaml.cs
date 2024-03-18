using Microsoft.EntityFrameworkCore;
using SessionTWoPartTwo1803.DataBaseFolder;
using SessionTWoPartTwo1803.Tools;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SessionTWoPartTwo1803
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private string fIO;

        public int HospitalizationCode { get; set; }
        public string FIO { get => fIO; 
            set { fIO = value;
                Signal(); } }

        public string BedRoomNumber { get; set; }

        public List<Canvas> Canvases { get; set; }

        public MainWindow()
        {
            InitializeComponent();
            DataContext = this;

            Canvases = new List<Canvas>()
            {
                А111,
                Б111,
                В111,
                Г111,
                А112,
                Б112,
                В112,
                Г112,
                А113,
                Б113,
                В113,
                Г113,
                А114,
                Б114,
                В114,
                Г114,
                А104,
                Б104,
                В104,
                Г104,
                А105,
                Б105,
                В105,
                Г105,
                А106,
                Б106,
                В106,
                Г106,
                А107,
                Б107,
                В107,
                Г107,
                А108,
                Б108,
                В108,
                А109,
                Б109,
                В109,
                А110,
                Б110,
                В110,
                А103,
                Б103,
                В103,
                Г103,
                Д103,
                Е103,
                А115,
                Б115,
                В115,
                Г115,
                Д115,
                Е115,
                А102,
                Б102,
                В102,
                Г102,
                Д102,
                А101,
                Б101,
                В101,
                Г101,
                Д101,
                А116,
                Б116,
                А117,
                Б117,
                А118,
                Б118,
            };

            GenerateEllipse();
        }

        private void GenerateEllipse()
        {
            List<Hospitalization> hospitalizations = DataBase.Instance.Hospitalizations.ToList();

            foreach(var item in hospitalizations)
            {
                if(item.BedNumber != null)
                {
                    Canvas canvas = Canvases.FirstOrDefault(s => s.Name == $"{item.BedNumber}{item.RoomNumber}");
                    if (canvas != null)
                        canvas.Children.Add(Clone());
                }
            }
        }

        private Ellipse Clone()
        {
            ContextMenu context = new ContextMenu();
            MenuItem menuItem = new MenuItem();
            menuItem.Header = "Выписать";
            menuItem.Click += PatientOut;
            context.Items.Add(menuItem);

            Ellipse ellipse = new Ellipse()
            {
                Height = 20,
                Width = 20,
                Fill = Brushes.Green
            };

            ellipse.ContextMenu = context;
            ellipse.MouseLeftButtonDown += EllipseDrag;

            return ellipse;
        }

        private void EllipseDrag(object sender, MouseButtonEventArgs e)
        {
            Ellipse ellipse = (Ellipse)sender;

            DragDrop.DoDragDrop(ellipse, ellipse, DragDropEffects.Move);
        }

        private void PatientOut(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = (MenuItem)sender;
            ContextMenu context = (ContextMenu)menuItem.Parent;

            Ellipse ellipse = (Ellipse)context.PlacementTarget;
            Canvas canvas = (Canvas)ellipse.Parent;

            Hospitalization hospitalization = DataBase.Instance.Hospitalizations.FirstOrDefault(s => s.RoomNumber == int.Parse(canvas.Name.Substring(1)) && s.BedNumber == canvas.Name[0].ToString());

            hospitalization.RoomNumber = null;
            hospitalization.BedNumber = null;

            DataBase.Instance.Hospitalizations.Update(hospitalization);
            DataBase.Instance.SaveChanges();

            canvas.Children.Remove(ellipse);    
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        public void Signal([CallerMemberName] string prop = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));

        private void Drop(object sender, DragEventArgs e)
        {
            Ellipse ellipse = (Ellipse)e.Data.GetData(typeof(Ellipse));
            Canvas parent = (Canvas)ellipse.Parent;

            Canvas newParent = (Canvas)sender;

            if(newParent.Children.Count > 0)
            {
                e.Handled = true;
                return;
            }
            if(newParent == parent)
            {
                e.Handled = true;
                return;
            }

            parent.Children.Remove(ellipse);

            Hospitalization hospitalization = DataBase.Instance.Hospitalizations.FirstOrDefault(s => s.RoomNumber == int.Parse(parent.Name.Substring(1)) && s.BedNumber == parent.Name[0].ToString());
            hospitalization.RoomNumber = int.Parse(newParent.Name.Substring(1));
            hospitalization.BedNumber = newParent.Name[0].ToString();

            DataBase.Instance.Hospitalizations.Update(hospitalization);
            DataBase.Instance.SaveChanges();

            ellipse.MouseLeftButtonDown += EllipseDrag;

            Canvas.SetTop(ellipse, newParent.ActualHeight / 2 - 10);
            Canvas.SetLeft(ellipse, newParent.ActualWidth / 2 - 10);
            newParent.Children.Add(ellipse);
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            if (HospitalizationCode == 0)
                return;

            Hospitalization hospitalization = DataBase.Instance.Hospitalizations.FirstOrDefault(s => s.Id == HospitalizationCode);

            if(hospitalization == null)
            {
                MessageBox.Show("Неверный код госпитализации");
                return;
            }
            if (string.IsNullOrWhiteSpace(BedRoomNumber))
                return;

            Canvas canvas = Canvases.FirstOrDefault(s => s.Name == BedRoomNumber);

            if(canvas == null)
            {
                MessageBox.Show("Неверно указан номер места. Введите номер кровати и номер комнаты. Пример: Д115");
                return;
            }

            if(hospitalization.BedNumber != null)
            {
                MessageBox.Show($"Пациент уже добавлен. Место: {hospitalization.BedNumber}{hospitalization.RoomNumber}");
                return;
            }
            if(canvas.Children.Count > 0)
            {
                MessageBox.Show("Место уже занято. Выберите свободное место");
                return;
            }

            hospitalization.RoomNumber = int.Parse(canvas.Name.Substring(1));
            hospitalization.BedNumber = canvas.Name[0].ToString();

            DataBase.Instance.Hospitalizations.Update(hospitalization);
            DataBase.Instance.SaveChanges();

            canvas.Children.Add(Clone());

        }

        private void Check(object sender, RoutedEventArgs e)
        {
            if (HospitalizationCode == null)
                return;

            Hospitalization hospitalization = DataBase.Instance.Hospitalizations.Include(s => s.MedicCardCodeNavigation).FirstOrDefault(s => s.Id == HospitalizationCode);

            if(hospitalization == null)
            {
                MessageBox.Show("неверный код госпитализации");
                return;
            }

            FIO = $"{hospitalization.MedicCardCodeNavigation.LastName} {hospitalization.MedicCardCodeNavigation.FirstName} {hospitalization.MedicCardCodeNavigation.Patronymic} {hospitalization.BedNumber}{hospitalization.RoomNumber}";
        }
    }
}
