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
    PAGE7_DEV_MODE = 6
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

    ManagerGUI *gui = new ManagerGUI(buttons);

    this->event_processor = new EventProcessor(gui);

    connect(event_processor, &EventProcessor::OnUpdatePower, this, &sw_platform::on_update_power);
    connect(event_processor,&EventProcessor::OnFrequencyChange, this, &sw_platform::on_frequency_change);

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
}

void sw_platform::on_btn_enter_dev_pin_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_DEV_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE7_DEV_MODE);
}

void sw_platform::on_btn_bks_4_clicked()
{
    event_processor->RefreshGUI(GUI_ACTION_SWITCH_TO_SECRET_MODE);
    ui->stackedWidget->setCurrentIndex(PAGE3_SECRET_MODE);
}

void sw_platform::on_btn_calibration_35x15_clicked()
{
    ui->progressBar->setValue(0);
    event_processor->StartCalibration(SIZE_35x15);
}

void sw_platform::on_btn_calibration_285x126_clicked()
{
    ui->progressBar->setValue(0);
    event_processor->StartCalibration(SIZE_285x126);
}

void sw_platform::on_update_progress_bar(qint32 progress)
{
    ui->progressBar->setValue(progress);
}
