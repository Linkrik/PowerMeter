#ifndef SW_PLATFORM_H
#define SW_PLATFORM_H

#include <QWidget>
#include <QTimer>

#include "eventprocessor.h"
#include "measurer.h"

//#include "rsnrpz.h"

QT_BEGIN_NAMESPACE
namespace Ui { class sw_platform; }
QT_END_NAMESPACE

class sw_platform : public QWidget
{
    Q_OBJECT

public:
    sw_platform(QWidget *parent = nullptr);
    ~sw_platform();

private slots:
    void on_btn_select_35x15_clicked();

    void on_btn_select_285x126_clicked();

    void on_btn_system_clicked();

    void on_btn_secret_clicked();

    void on_update_power(double power);

    void on_frequency_change(QString new_frequency);

    void on_btn_1_clicked();

    void on_btn_2_clicked();

    void on_btn_3_clicked();

    void on_btn_4_clicked();

    void on_btn_5_clicked();

    void on_btn_6_clicked();

    void on_btn_7_clicked();

    void on_btn_8_clicked();

    void on_btn_9_clicked();

    void on_btn_dot_clicked();

    void on_btn_0_clicked();

    void on_btn_bks_clicked();

    void on_btn_enter_clicked();

    void on_btn_exit_calibration_clicked();

    void on_btn_cancel_select_liter_file_clicked();

    void on_btn_set_unit_dbm_in_select_freq_clicked();

    void on_btn_set_unit_watt_in_select_freq_clicked();

    void on_btn_exit_secret_mode_clicked();

    void on_btn_select_liter_file_clicked();

    void on_btn_cancel_pin_code_clicked();

    void on_btn_exit_system_mode_clicked();

    void on_btn_developer_mode_clicked();

    void on_btn_enter_dev_pin_clicked();

    void on_btn_bks_4_clicked();

    void on_btn_calibration_35x15_clicked();

    void on_btn_calibration_285x126_clicked();

    void on_update_progress_bar(qint32 progress);

private:
    Ui::sw_platform *ui;
    EventProcessor *event_processor;
};
#endif // SW_PLATFORM_H
