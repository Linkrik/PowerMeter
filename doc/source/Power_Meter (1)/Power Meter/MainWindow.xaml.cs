using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
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
using System.Windows.Threading;
using InstrumentDrivers;

namespace Power_Meter
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {


        public MainWindow() : base()
        {
            InitializeComponent();



            buttonFreq.IsEnabled = false;

            timer.Tick += new EventHandler(timer_Tick);
            timer.Interval= new TimeSpan(0, 0, 0, 0, 200); ;

            dataFromPowerMeter.DoWork += dataFromPowerMeter_DoWork;
            dataFromPowerMeter.ProgressChanged += dataFromPowerMeter_ProgressChanged;
            buttonLevelDbm.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x00, 0x74, 0xFD));

            //labelPower.Text = $"{P:F2}";
        }
        BackgroundWorker frequencySetting = new BackgroundWorker();
        BackgroundWorker deviceDefinition = new BackgroundWorker();
        BackgroundWorker dataFromPowerMeter = new BackgroundWorker();//поток с получением данных с ваттметра 
        DispatcherTimer timer = new DispatcherTimer();
        string freqLabelString = "100";
        double freqLabelDouble;            //число которое будет отправляться в датчик для установки коэффициента по частоте
        string LevelLabelStringVisual = "__.__ __";
        static rsnrpz sensor = null;
        bool СheckBoxChanget = false; //положение СheckBox
        bool didСheckBoxСhange = false; //было ли изменение СheckBox
        bool timerOnOff = false;  //true=On false=Off
        bool buttonGhzAndMhz  = false; //true=GHz folse=MHz
        bool buttonDbmWatt = true; //true=dBm folse=Watt
        



        private void buttonGHz_Click(object sender, RoutedEventArgs e)
        {
            buttonGhzAndMhz = true;
            buttonGHz.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x00, 0x74, 0xFD));
            buttonMHz.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x74, 0xB2, 0xFB));
        }

        private void buttonMHz_Click(object sender, RoutedEventArgs e)
        {
            buttonGhzAndMhz = false;
            buttonMHz.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x00, 0x74, 0xFD));
            buttonGHz.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x74, 0xB2, 0xFB));

        }

        private void buttonLevelDbm_Click(object sender, RoutedEventArgs e)
        {
            buttonLevelDbm.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x00, 0x74, 0xFD));
            buttonLevelDb.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x74, 0xB2, 0xFB));
            labelLevel.Content = LevelLabelStringVisual + "   dBm";
            buttonDbmWatt = true;
        }

        private void buttonLevelDb_Click(object sender, RoutedEventArgs e)
        {
            buttonLevelDb.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x00, 0x74, 0xFD));
            buttonLevelDbm.Background = new SolidColorBrush(Color.FromArgb(0xFF, 0x74, 0xB2, 0xFB));
            labelLevel.Content = LevelLabelStringVisual + "   Watt";
            buttonDbmWatt = false;
        }

        private void buttonСonnection_Click(object sender, RoutedEventArgs e)//подключение к датчику
        {

            deviceDefinition.DoWork += deviceDefinition_DoWork;
            deviceDefinition.RunWorkerAsync();

        }

        private void buttonStart_Click(object sender, RoutedEventArgs e)
        {
            buttonStart.IsEnabled = false;
            buttonStop.IsEnabled = true;
            timer.Start();
            timerOnOff = true;

        }

        private void buttonStop_Click(object sender, RoutedEventArgs e)
        {
            buttonStart.IsEnabled = true;
            buttonStop.IsEnabled = false;
            timer.Stop();
            timerOnOff = false;
            labelLevel.Content = LevelLabelStringVisual + "   dBm";
        }

        private void buttonFreq_Click(object sender, RoutedEventArgs e)
        {
            textBoxFreq.Clear();
            buttonFreqNumeral_.IsEnabled = true;
            buttonFreqNumeral_1.IsEnabled = true;
            buttonFreqNumeral_2.IsEnabled = true;
            buttonFreqNumeral_3.IsEnabled = true;
            buttonFreqNumeral_4.IsEnabled = true;
            buttonFreqNumeral_5.IsEnabled = true;
            buttonFreqNumeral_6.IsEnabled = true;
            buttonFreqNumeral_7.IsEnabled = true;
            buttonFreqNumeral_8.IsEnabled = true;
            buttonFreqNumeral_9.IsEnabled = true;
            buttonFreqNumeral_0.IsEnabled = true;
            buttonFreqDelete.IsEnabled = true;
            buttonFreqEnter.IsEnabled = true;
            buttonFreq.IsEnabled = false;
            buttonGHz.IsEnabled = true;
            buttonMHz.IsEnabled = true;
            textBoxFreq.Visibility = Visibility.Visible;
            textBoxFreq.Focus();
        }


        private void buttonFreqEnter_Click(object sender, RoutedEventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            buttonFreqNumeral_.IsEnabled = false;
            buttonFreqNumeral_1.IsEnabled = false;
            buttonFreqNumeral_2.IsEnabled = false;
            buttonFreqNumeral_3.IsEnabled = false;
            buttonFreqNumeral_4.IsEnabled = false;
            buttonFreqNumeral_5.IsEnabled = false;
            buttonFreqNumeral_6.IsEnabled = false;
            buttonFreqNumeral_7.IsEnabled = false;
            buttonFreqNumeral_8.IsEnabled = false;
            buttonFreqNumeral_9.IsEnabled = false;
            buttonFreqNumeral_0.IsEnabled = false;
            buttonFreqDelete.IsEnabled = false;
            buttonFreqEnter.IsEnabled = false;
            buttonFreq.IsEnabled = true;
            buttonGHz.IsEnabled = false;
            buttonMHz.IsEnabled = false;
            textBoxFreq.Visibility = Visibility.Hidden;



          
           freqLabelString = textBoxFreq.Text;

            if (Convert.ToDouble(freqLabelString) > 0.0)
            {
                if ((freqLabelString.Contains('.')) && buttonGhzAndMhz)
                {
                    int find = freqLabelString.IndexOf('.');
                    if (find > 2)
                    {
                        freqLabelString = freqLabelString.Remove(find, 1);
                        freqLabelString = freqLabelString.Insert(2, ".");

                        if (Convert.ToDouble(freqLabelString) > 18)
                        {
                            freqLabelString = "18";
                        }
                    }
                    if ((find == 1) && (freqLabelString.Length == 6))
                    {
                        freqLabelString = freqLabelString.Remove(5);
                    }
                    if (freqLabelString.IndexOf('.') == freqLabelString.Length - 1)
                    {
                        freqLabelString = freqLabelString.Remove(freqLabelString.Length - 1);
                    }
                    labelFreq.Content = "Freq   " + freqLabelString;
                    freqLabelString = freqLabelString + "E9";
                }
                else if ((freqLabelString.Contains('.')) && !buttonGhzAndMhz)
                {
                    int find = freqLabelString.IndexOf('.');
                    freqLabelString = freqLabelString.Remove(find, 1);
                    if (freqLabelString.Length > 3)
                    {
                        freqLabelString = freqLabelString.Remove(3);
                    }
 
                    if (Convert.ToDouble(freqLabelString)<50.0)
                    {
                        freqLabelString = "50";
                    }
                    labelFreq.Content = "Freq   " + freqLabelString;
                    freqLabelString = freqLabelString + "E6";
                }
                else if (buttonGhzAndMhz)
                {
                    if (freqLabelString.Length > 2)
                    {
                        if (freqLabelString.Length > 5)
                        {
                            freqLabelString = freqLabelString.Remove(5);
                        }
                        freqLabelString = freqLabelString.Insert(2, ".");

                        if (Convert.ToDouble(freqLabelString) > 18)
                        {
                            freqLabelString = "18";
                        }
                        labelFreq.Content = "Freq   " + freqLabelString;
                        freqLabelString = freqLabelString + "E9";
                    }
                    else
                    {
                        if (Convert.ToDouble(freqLabelString) > 18)
                        {
                            freqLabelString = "18";
                        }
                        labelFreq.Content = "Freq   " + freqLabelString;
                        freqLabelString = freqLabelString + "E9";
                    }
                }
                else if (!buttonGhzAndMhz)
                {
                    if (freqLabelString.Length > 3)
                    {
                        freqLabelString = freqLabelString.Remove(3);
                    }
                    else
                    {
                        if (freqLabelString.Length == 1)
                            freqLabelString = "50";
                    }
                    labelFreq.Content = "Freq   " + freqLabelString;
                    freqLabelString = freqLabelString + "E6";
                }


                if (buttonGhzAndMhz)
                {
                    labelFreqFaceValue.Content = "GHz";
                }
                else
                {
                    labelFreqFaceValue.Content = "MHz";
                }



                timer.Stop();

                while (dataFromPowerMeter.IsBusy)
                {
                    //задержка для окончания работы потока снятия данных с ваттметра
                }
                frequencySetting.DoWork += frequencySetting_DoWork;
                frequencySetting.RunWorkerAsync();

                if (timerOnOff) // сделано для того чтобы не включался во время выбора частоты
                {
                    timer.Start();
                }
            }
        }
            

        # region--клавиаутура
        private void buttonFreqNumeral_1_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "1";
        }

        private void buttonFreqNumeral_2_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "2";
        }

        private void buttonFreqNumeral_3_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "3";
        }

        private void buttonFreqNumeral_4_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "4";
        }

        private void buttonFreqNumeral_5_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "5";
        }

        private void buttonFreqNumeral_6_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "6";
        }

        private void buttonFreqNumeral_7_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "7";
        }

        private void buttonFreqNumeral_8_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "8";
        }

        private void buttonFreqNumeral_9_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "9";
        }

        private void buttonFreqNumeral__Click(object sender, RoutedEventArgs e)
        {

            if ((textBoxFreq.Text.Length < 6) && textBoxFreq.Text.Length != 0 && !textBoxFreq.Text.Contains('.')&&textBoxFreq.Text.Length!=5)
                textBoxFreq.Text += ".";
            
        }

        private void buttonFreqNumeral_0_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length < 6)
                textBoxFreq.Text += "0";
        }

        private void buttonFreqDelete_Click(object sender, RoutedEventArgs e)
        {
            if (textBoxFreq.Text.Length != 0)
            {
                textBoxFreq.Text = textBoxFreq.Text.Remove(textBoxFreq.Text.Length - 1);
            }
                
        }
        #endregion
        


        private 
        void deviceDefinition_DoWork(object sender, DoWorkEventArgs e)
        {
            this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
               (ThreadStart)delegate ()
               {
                   this.Cursor = Cursors.Wait;
                   CheckBoxOffset.IsChecked = false;
               });


            try
            {
                // Find the first available sensor
                sensor = new rsnrpz("USB::0xAAD::*?", true, true);
            }
            catch (Exception)
            {
                this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                (ThreadStart)delegate ()
                {
                    this.Cursor = Cursors.Arrow;
                });



                MessageBox.Show("Error initializing the sensor. Press any key to finish");
                return;
            }


            //int measurementsCount = 1; //колличество выводимых значений
            //int count = 0;
            //bool complete = false;
            var resourceName = new StringBuilder(1000);
            var sensorType = new StringBuilder(1000);
            var sensorSN = new StringBuilder(1000);


            try
            {
                sensor.GetSensorInfo(1, resourceName, sensorType, sensorSN); //read sensor info

                this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                (ThreadStart)delegate ()
                {
                    this.Cursor = Cursors.Arrow;
                });

                MessageBox.Show("Sensor Resource Name: " + resourceName + "\n" +
                    "Sensor Type: " + resourceName + "\n" +
                    "Sensor Serial Number: " + sensorSN + "\n" +
                    "");

                MessageBox.Show("Applying timeslot measurement settings ...");


                this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                (ThreadStart)delegate ()
                {
                    this.Cursor = Cursors.Wait;
                });

                sensor.reset();
                sensor.corr_configureCorrections(1, false,0.0,false,"",false);//использование смещения dB -200...200  (ключевое слово offset) (изночально последнее bool и есть включение выключение стандартного аттенюатора - по умолчанию выключено)
                sensor.chan_mode(1, rsnrpzConstants.SensorModeTimeslot); //timeslot mode
                sensor.chan_setCorrectionFrequency(1, 100E6); //correction frequency 100MHz  //NRP-Z85  from 50MHz to 40GHz           //NRP-Z24  from 10MHz to 18GHz
                //sensor.trigger_setSource(1, rsnrpzConstants.TriggerSourceImmediate); //trigger immediate
                sensor.tslot_configureTimeSlot(1, 1, 577E-6); //timeslot count and width
                sensor.timing_setTimingExcludeStop(1, 3E-6); //exclude stop time
                //sensor.trigger_setLevel(1, Math.Pow(10, -30.0 / 10.0) / 1000.0); //trigger level in Watts, calculate -30dBm to Watts
                sensor.avg_configureAvgManual(1, 2); //average count 2 samples


                this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                (ThreadStart)delegate ()
                {
                    this.Cursor = Cursors.Arrow;
                });

                MessageBox.Show(" finished.");


                //MessageBox.Show("\nZeroing sensor, remove any signal from its input ...");


                //this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                //(ThreadStart)delegate ()
                //{
                //    this.Cursor = Cursors.Wait;
                //});

                //sensor.chan_zero(1);
                ////wait until the zeroing is ready with the timeout of 10 seconds
                //System.DateTime tout = System.DateTime.Now.AddSeconds(10.0);
                //do
                //{
                //    sensor.chan_isZeroComplete(1, out complete);
                //    System.Threading.Thread.Sleep(500);
                //} while (!complete && (System.DateTime.Now.CompareTo(tout) < 0));


                //this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                //(ThreadStart)delegate ()
                //{
                //    this.Cursor = Cursors.Arrow;
                //});


                //MessageBox.Show(" finished.");

            }
            //------------------------------------------------------------------------------------------End

            catch (Exception ex)
            {
                MessageBox.Show("Exception occured: " + ex.Message);
                return;
            }

            this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
               (ThreadStart)delegate ()
               {
                   buttonFreq.IsEnabled = true;
                   buttonStart.IsEnabled = true;
               });


        }



        


        double measValue=0;
        void dataFromPowerMeter_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            labelLevel.Content = $"{measValue:F2}" + "  dBm"; 
        }

        void dataFromPowerMeter_DoWork(object sender, DoWorkEventArgs e)
        {

            if (didСheckBoxСhange)
            {
                sensor.corr_configureCorrections(1, false, 0.0, false, "", СheckBoxChanget);
                didСheckBoxСhange = false;
            }

            //start the measurement
            sensor.chans_initiate();

            //wait until the measurement is ready with the timeout of 2seconds
            bool complete;
            double[] result = new double[100];
            int count = 0;

            System.DateTime tout = System.DateTime.Now.AddSeconds(1.0);
            do
            {
                sensor.chan_isMeasurementComplete(1, out complete);
                System.Threading.Thread.Sleep(1);
            } while (!complete && (System.DateTime.Now.CompareTo(tout) < 0));

            if (complete)
            {
                sensor.meass_fetchBufferMeasurement(1, 100, result, out count); //fetch the result in Watts

                if (count > 0)
                {
                    if(buttonDbmWatt)
                    {
                        //Watt to dBm, for low and sometimes slightly negative values coerce to -200dBm
                        measValue = result[0] > 0 ? (10 * Math.Log(result[0]) / Math.Log(10)) + 30.0 : -70;
                    }
                    else
                    {
                        measValue = result[0] > 0 ? result[0] : 0; ;
                    }
                }


            }
            this.Dispatcher.BeginInvoke(DispatcherPriority.Normal,
                (ThreadStart)delegate ()
                {
                    if (buttonDbmWatt)
                    {
                        labelLevel.Content = $"{measValue:F2}" + "  dBm";
                    }
                    else
                    {
                        labelLevel.Content = $"{measValue:F3}" + "  Watt";
                    }
                   
                }
                );


        }

        private void timer_Tick(object sender, EventArgs e)
        {
            if (!dataFromPowerMeter.IsBusy)
            {
                dataFromPowerMeter.RunWorkerAsync();
            }
        }

        void frequencySetting_DoWork(object sender, DoWorkEventArgs e)
        {

            freqLabelDouble = Convert.ToDouble(freqLabelString);

            sensor.chan_setCorrectionFrequency(1, freqLabelDouble); //correction frequency 100MHz  //NRP-Z85  from 50MHz to 40GHz
        }



        private void CheckBoxOffset_Click(object sender, RoutedEventArgs e)
        {
            if (CheckBoxOffset.IsChecked == true)
            {
                СheckBoxChanget = true;
            }
            else
            {
                СheckBoxChanget = false;
            }

            didСheckBoxСhange = true;
        }
    }
}
