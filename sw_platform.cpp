#include "sw_platform.h"
#include "ui_sw_platform.h"
#include "managergui.h"
#include "eventprocessor.h"

enum
{
    PAGE1_SELECT_FREQ = 0,
    PAGE2_ENTER_PIN_CODE = 1,
    PAGE3_SECRET_MODE = 2,
    PAGE4_SYSTEM = 3,
    PAGE5_LOAD_SECRET_FILE = 4,
    PAGE6_PIN_FOR_DEV = 5,
    PAGE7_DEV_MODE = 6,
    PAGE8_SELF_TEST_ATT = 7,
    PAGE9_SENSOR_INFO = 8
} PageState;

sw_platform::sw_platform(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::sw_platform)
{
    ui->setupUi(this);

    QVector<QPushButton *> buttons;

    buttons.append(ui->btn_select_35x15);
    buttons.append(ui->btn_select_285x126);
    buttons.append(ui->btn_system);
    buttons.append(ui->btn_secret);

    this->dev_pin_code_counter = 0;
    this->dev_mode_access = false;

    ManagerGUI *gui = new ManagerGUI(buttons);

    this->event_processor = new EventProcessor(gui);

    connect(event_processor, &EventProcessor::OnUpdatePower, this, &sw_platform::on_update_power);
    connect(event_processor,&EventProcessor::OnFrequencyChange, this, &sw_platform::on_frequency_change);
    connect(event_processor, &EventProcessor::OnSecretCodeChanged, this, &sw_platform::on_secret_code_changed);

    ui->frequency->setPlainText("6.000000");
    ui->te_pin_code->setAlignment(Qt::AlignCenter);
    ui->te_pin_code->setAlignment(Qt::AlignVCenter);
    ui->te_pin_code->setAlignment(Qt::AlignHCenter);

    ui->btn_select_35x15->setStyleSheet(QString("background-color: #FF007F"));
    ui->btn_set_unit_dbm_in_select_freq->setStyleSheet(QString("background-color: #FF007F"));

    connect(event_processor->measurer, &Measurer::OnUpdateProgressBar, this, &sw_platform::on_update_progress_bar);

//    this->setWindowFlags(Qt::FramelessWindowHint | Qt::WindowStaysOnBottomHint);
//    SizeWaveguide sizeWave_guide;
//    this->event_processor->StartCalibration(sizeWave_guide);



}

sw_platform::~sw_platform()
{
    delete ui;
}


void sw_platform::on_btn_select_35x15_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SELECT_35x15);
    ui->btn_select_35x15->setStyleSheet(QString("background-color: #FF007F"));
    ui->btn_select_285x126->setStyleSheet("");
}

void sw_platform::on_btn_select_285x126_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SELECT_285x126);
    ui->btn_select_285x126->setStyleSheet(QString("background-color: #FF007F"));
    ui->btn_select_35x15->setStyleSheet(QString(""));
}

void sw_platform::on_btn_system_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SYSTEM_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE4_SYSTEM);

    qDebug() << "dirContent.at(i)";

    QDir dir(QDir::currentPath() + "/styles");
    QStringList qss = dir.entryList(QStringList("*.qss"));

    ui->cb_color_theme->clear();

    foreach (QString file, qss)
        ui->cb_color_theme->addItem(file);

//    QFileInfoList dirContent = dir.entryInfoList(QStringList() << "*.qss", QDir::Dirs | QDir::Files | QDir::NoDotAndDotDot);
//    for (qint32 i = 0; i < dirContent.count(); i++)
//        qDebug() << dirContent.at(i);
//        ui->cb_color_theme->addItem(dirContent.at(i));
}

void sw_platform::on_btn_secret_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_PIN_SECRET_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE5_LOAD_SECRET_FILE);
}

void sw_platform::on_update_power(double power)
{
    ui->power_label->setText(QString::number(power));
}

void sw_platform::on_btn_1_clicked()
{
    event_processor->ButtonHandle(BUTTON_1);
}

void sw_platform::on_btn_2_clicked()
{
    event_processor->ButtonHandle(BUTTON_2);
}

void sw_platform::on_btn_3_clicked()
{
    event_processor->ButtonHandle(BUTTON_3);
}

void sw_platform::on_btn_4_clicked()
{
    event_processor->ButtonHandle(BUTTON_4);
}

void sw_platform::on_btn_5_clicked()
{
    event_processor->ButtonHandle(BUTTON_5);
}

void sw_platform::on_btn_6_clicked()
{
    event_processor->ButtonHandle(BUTTON_6);
}

void sw_platform::on_btn_7_clicked()
{
    event_processor->ButtonHandle(BUTTON_7);
}

void sw_platform::on_btn_8_clicked()
{
    event_processor->ButtonHandle(BUTTON_8);
}

void sw_platform::on_btn_9_clicked()
{
    event_processor->ButtonHandle(BUTTON_9);
}

void sw_platform::on_btn_dot_clicked()
{
    event_processor->ButtonHandle(BUTTON_DOT);
}

void sw_platform::on_btn_0_clicked()
{
    event_processor->ButtonHandle(BUTTON_0);
}

void sw_platform::on_btn_bks_clicked()
{
    event_processor->ButtonHandle(BUTTON_BKS);
}

void sw_platform::on_btn_enter_clicked()
{
    event_processor->ButtonHandle(BUTTON_ENTER);
}

void sw_platform::on_frequency_change(QString new_frequency)
{
    ui->frequency->setPlainText(new_frequency);
}

void sw_platform::on_btn_exit_calibration_clicked()
{
    this->dev_mode_access = false;
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_cancel_select_liter_file_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_set_unit_dbm_in_select_freq_clicked()
{
    event_processor->SetMeasureUnit(UNIT_DBM);
    ui->btn_set_unit_dbm_in_select_freq->setStyleSheet(QString("background-color: #FF007F"));
    ui->btn_set_unit_watt_in_select_freq->setStyleSheet(QString(""));
}

void sw_platform::on_btn_set_unit_watt_in_select_freq_clicked()
{
    event_processor->SetMeasureUnit(UNIT_WATT);
    ui->btn_set_unit_dbm_in_select_freq->setStyleSheet(QString(""));
    ui->btn_set_unit_watt_in_select_freq->setStyleSheet(QString("background-color: #FF007F"));
}

void sw_platform::on_btn_exit_secret_mode_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_select_liter_file_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_PIN_SECRET_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE2_ENTER_PIN_CODE);

    QDir dir(QDir::currentPath() + "/secret");
    QStringList slf = dir.entryList(QStringList("*.slf"));

    ui->cb_list_secret_files->clear();

    foreach (QString file, slf)
        ui->cb_list_secret_files->addItem(file);
}

void sw_platform::on_btn_cancel_pin_code_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_exit_system_mode_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_developer_mode_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_PIN_DEV_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE6_PIN_FOR_DEV);
    ui->lb_is_status_pin->setText("");
    ui->lb_is_status_pin->setStyleSheet("");
    ui->le_dev_pin->setText("_ _ _ _ _ _ _");
}

void sw_platform::on_btn_enter_dev_pin_clicked()
{
    if (this->dev_mode_access)
    {
        event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_DEV_MODE);
        ui->stackedWidget->setCurrentIndex(PAGE7_DEV_MODE);
        ui->progressBar->setHidden(true);
    }
    else
    {
        ui->lb_is_status_pin->setText("PLEASE ENTER PIN CODE");
        ui->lb_is_status_pin->setStyleSheet(QString("background-color: Gray"));
    }
}

void sw_platform::on_btn_bks_4_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SECRET_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE3_SECRET_MODE);
}

void sw_platform::on_btn_calibration_35x15_clicked()
{
    ui->progressBar->setHidden(false);
    ui->progressBar->setValue(0);

    event_processor->StopTimer();
//    event_processor->measurer->Calibration(SIZE_35x15);
        event_processor->StartCalibration(SIZE_35x15);
}

void sw_platform::on_btn_calibration_285x126_clicked()
{
    ui->progressBar->setValue(0);
    event_processor->StartCalibration(SIZE_285x126);
}

void sw_platform::on_update_progress_bar(qint32 progress)
{
    ui->progressBar->setMinimum(0);
    ui->progressBar->setMaximum((event_processor->measurer->GetMaxFrequency() - event_processor->measurer->GetMinFrequency())/1E6);
    ui->progressBar->setValue(progress);
//    qDebug() << "progress = " << (event_processor->measurer->GetMaxFrequency() - event_processor->measurer->GetMinFrequency())/1E6;
}

void sw_platform::on_secret_code_changed(QString secret_code)
{
    if (ui->stackedWidget->currentIndex() == PAGE6_PIN_FOR_DEV)
    {
        if (secret_code != "")
        {
            QString line = ui->le_dev_pin->text();
            int index = line.indexOf("_");
            line.replace(index, 1, secret_code);
            ui->le_dev_pin->setText(line);

            this->dev_pin_code += secret_code;

            QTimer *timer = new QTimer(this);
            timer->setSingleShot(true);
            timer->setInterval(100);

            connect(timer, &QTimer::timeout, [this,timer,index]()
            {
                QString line = ui->le_dev_pin->text();
                line.replace(index, 1, "*");
                ui->le_dev_pin->setText(line);
                timer->deleteLater();

                this->dev_pin_code_counter++;
                if (this->dev_pin_code_counter >= 7)
                {
                    this->dev_pin_code_counter = 0;

                    if (QString(QCryptographicHash::hash(this->dev_pin_code.toUtf8(), QCryptographicHash::Sha3_256).toHex()) == this->hash_pin)
                    {
                        this->dev_mode_access = true;
                        this->dev_pin_code = "";
                        ui->lb_is_status_pin->setText("ACCESS DEVELOPER MODE");
                        ui->lb_is_status_pin->setStyleSheet(QString("background-color: Green"));
                        qDebug() << "Access " << this->dev_pin_code;
                    }
                    else
                    {
                        this->dev_mode_access = false;
                        this->dev_pin_code = "";
                        ui->le_dev_pin->setText("_ _ _ _ _ _ _");
                        ui->lb_is_status_pin->setText("PIN INCORRECT");
                        ui->lb_is_status_pin->setStyleSheet(QString("background-color: Red"));
                        qDebug() << "Incorrect PIN code " << this->dev_pin_code;
                    }
                }
            });

            timer->start();
         }
        else
        {
            ui->le_dev_pin->setText("_ _ _ _ _ _ _");
        }
    }
}

void sw_platform::on_btn_1_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_1);
}

void sw_platform::on_btn_2_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_2);
}

void sw_platform::on_btn_3_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_3);
}

void sw_platform::on_btn_4_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_4);
}

void sw_platform::on_btn_5_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_5);
}

void sw_platform::on_btn_6_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_6);
}

void sw_platform::on_btn_7_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_7);
}

void sw_platform::on_btn_8_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_8);
}

void sw_platform::on_btn_9_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_9);
}

void sw_platform::on_btn_0_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_0);
}

void sw_platform::on_btn_bks_dev_pin_clicked()
{
    this->event_processor->SercetCodeButtonHandler(BUTTON_BKS);
}

void sw_platform::on_btn_cancel_dev_pin_clicked()
{
    this->dev_mode_access = false;
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_cancel_pin_secret_mode_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELECT_FREQ);
    ui->stackedWidget->setCurrentIndex(PAGE1_SELECT_FREQ);
}

void sw_platform::on_btn_self_test_att_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SELF_TEST_ATT);
    ui->stackedWidget->setCurrentIndex(PAGE8_SELF_TEST_ATT);

    ui->tw_self_test_attenuation->setColumnWidth(0, (ui->tw_self_test_attenuation->width()/4 - 14));
    ui->tw_self_test_attenuation->setColumnWidth(1, (ui->tw_self_test_attenuation->width()/4 - 14));
    ui->tw_self_test_attenuation->setColumnWidth(2, (ui->tw_self_test_attenuation->width()/4 - 14));
    ui->tw_self_test_attenuation->setColumnWidth(3, (ui->tw_self_test_attenuation->width()/4 - 14));
    ui->tw_self_test_attenuation->rowHeight(40);
}

void sw_platform::on_btn_self_test_attenuation_clicked()
{
    qDebug() << "GetMinFrequency(): " << event_processor->measurer->GetMinFrequency();
    qDebug() << "GetMaxFrequency(): " << event_processor->measurer->GetMaxFrequency();
    for (qint64 i = event_processor->measurer->GetMinFrequency();
                i <=event_processor->measurer->GetMaxFrequency(); i += 1E6)
    {
        QTableWidgetItem item;

        item.setText("(_!_)");//QString::number(i/1E6) + "MHz");
        item.setTextColor(Qt::red);

        if (ui->tw_self_test_attenuation->rowCount() > 0)
        {
            ui->tw_self_test_attenuation->insertRow(ui->tw_self_test_attenuation->currentRow());
            ui->tw_self_test_attenuation-> setItem(ui->tw_self_test_attenuation->currentRow(), 0, &item);
        }
        else
        {
            ui->tw_self_test_attenuation->insertRow(0);
            ui->tw_self_test_attenuation->selectRow(0);
            ui->tw_self_test_attenuation->setItem(0, 0, &item);
        }
    }
}

void sw_platform::on_btn_exit_self_test_attenuation_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_DEV_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE7_DEV_MODE);
}

void sw_platform::on_btn_exit_sensor_info_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_DEV_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE7_DEV_MODE);
}

void sw_platform::on_btn_sensor_information_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SENSOR_INFORMATION);
    ui->stackedWidget->setCurrentIndex(PAGE9_SENSOR_INFO);

    const qint32  sensor_count = 4;

    QString cell_data[4][3];
    QColor color[4];
/** --------------------------------------- SENSOR NRP-18T --------------------------------------- */
    cell_data[0][0] = event_processor->measurer->Sensor_NRP_18T->GetSensorInfo().sensorType;
    cell_data[0][1] = event_processor->measurer->Sensor_NRP_18T->GetSensorInfo().sensorName;
    cell_data[0][2] = event_processor->measurer->Sensor_NRP_18T->GetSensorInfo().sensorSN;

    if (event_processor->measurer->Sensor_NRP_18T->IsConnect())
        color[0] = Qt::green;
    else
        color[0] = Qt::red;

/** --------------------------------------- SENSOR NRP-Z24 --------------------------------------- */
    cell_data[1][0] = event_processor->measurer->Sensor_NRP_Z24->GetSensorInfo().sensorType;
    cell_data[1][1] = event_processor->measurer->Sensor_NRP_Z24->GetSensorInfo().sensorName;
    cell_data[1][2] = event_processor->measurer->Sensor_NRP_Z24->GetSensorInfo().sensorSN;

    if (event_processor->measurer->Sensor_NRP_Z24->IsConnect())
        color[1] = Qt::green;
    else
        color[1] = Qt::red;

/** --------------------------------------- SENSOR NRP-Z81 --------------------------------------- */
    cell_data[2][0] = event_processor->measurer->Sensor_NRP_Z81->GetSensorInfo().sensorType;
    cell_data[2][1] = event_processor->measurer->Sensor_NRP_Z81->GetSensorInfo().sensorName;
    cell_data[2][2] = event_processor->measurer->Sensor_NRP_Z81->GetSensorInfo().sensorSN;

    if (event_processor->measurer->Sensor_NRP_Z81->IsConnect())
        color[2] = Qt::green;
    else
        color[2] = Qt::red;

/** --------------------------------------- SENSOR NRP-Z85 --------------------------------------- */
    cell_data[3][0] = event_processor->measurer->Sensor_NRP_Z85->GetSensorInfo().sensorType;
    cell_data[3][1] = event_processor->measurer->Sensor_NRP_Z85->GetSensorInfo().sensorName;
    cell_data[3][2] = event_processor->measurer->Sensor_NRP_Z85->GetSensorInfo().sensorSN;

    if (event_processor->measurer->Sensor_NRP_Z85->IsConnect())
        color[3] = Qt::green;
    else
        color[3] = Qt::red;

    ui->tw_sensor_list->setColumnWidth(0, (ui->tw_sensor_list->width()/3) - 12);
    ui->tw_sensor_list->setColumnWidth(1, (ui->tw_sensor_list->width()/3) - 12);
    ui->tw_sensor_list->setColumnWidth(2, (ui->tw_sensor_list->width()/3) - 12);

    if (ui->tw_sensor_list->rowCount() >= 4)
    {
        for (qint32 i = 0; i < ui->tw_sensor_list->rowCount(); i++)
        {
            ui->tw_sensor_list->removeRow(i);
        }
    }

    for (qint32 i = 0; i < sensor_count; i++)
    {
        ui->tw_sensor_list->insertRow(i);
        ui->tw_sensor_list->selectRow(i);

        for (qint32 j = 0; j < ui->tw_sensor_list->columnCount(); j++)
        {
            QTableWidgetItem *item = new QTableWidgetItem();
            item->setText(cell_data[i][j]);
            item->setTextColor(color[i]);
            ui->tw_sensor_list->setItem(i, j, item);
//            ui->tw_sensor_list->setStyleSheet(cell_data[i][3]);
        }
    }
}

void sw_platform::on_cb_color_theme_currentIndexChanged(int index)
{
    if (ui->cb_color_theme->count() > 0)
    {
        ui->cb_color_theme->setCurrentIndex(this->color_theme);

        this->color_theme = index;

        QFile style_file(QDir::currentPath() + "\\styles\\" + ui->cb_color_theme->itemText(index));
        style_file.open(QFile::ReadOnly | QFile::Text);

        QTextStream stream(&style_file);
        qApp->setStyleSheet(stream.readAll());
    }
    else
        this->color_theme = index;
//    QApplication::setStyleSheet(stream.readAll());
}
