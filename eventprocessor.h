#ifndef EVENTPROCESSOR_H
#define EVENTPROCESSOR_H

#include <QObject>
#include <QWidget>
#include <QTimer>
#include <QFuture>
#include <QtConcurrent/QtConcurrent>

#include "managergui.h"
#include "measurer.h"

#define TO_GHZ    1000000000

typedef enum
{
    BUTTON_1 = 1,
    BUTTON_2 = 2,
    BUTTON_3 = 3,
    BUTTON_4 = 4,
    BUTTON_5 = 5,
    BUTTON_6 = 6,
    BUTTON_7 = 7,
    BUTTON_8 = 8,
    BUTTON_9 = 9,
    BUTTON_0 = 10,
    BUTTON_DOT = 11,
    BUTTON_BKS = 12,
    BUTTON_ENTER = 13
} ButtonID;

typedef enum
{
    GUI_ACTION_SELECT_35x15 = 1,
    GUI_ACTION_SELECT_285x126 = 2,
    GUI_ACTION_SWITCH_TO_SYSTEM_MODE = 3,
    GUI_ACTION_SWITCH_TO_PIN_SECRET_MODE = 4,
    GUI_ACTION_SWITCH_TO_SECRET_MODE = 5,
    GUI_ACTION_SWITCH_TO_SELECT_FREQ = 6,
    GUI_ACTION_SWITCH_TO_PIN_DEV_MODE = 7,
    GUI_ACTION_SWITCH_TO_DEV_MODE = 8,
} GUIAction;

typedef enum
{
    INPUT_STATE_INACTIVE = 1,
    INPUT_STATE_ACTIVE = 2
} InputState;

typedef enum
{
    UNIT_DBM = 1,
    UNIT_WATT = 2
} MeasureUnit;

class EventProcessor : public QObject
{
    Q_OBJECT
public:
    EventProcessor(ManagerGUI * gui);
    void RefreshGUI(GUIAction id);

    void ButtonHandle(ButtonID id);

    void SetMeasureUnit(MeasureUnit measure_unit);

    void StartCalibration(SizeWaveguide sizeWave_guide);

    Measurer *measurer; /**TODO отправить из контруктора */

private:
    void GetPower();
    ManagerGUI *gui;
    QTimer *timer;

    QString frequency_value;
    InputState input_state;
    bool is_used_dot;

    MeasureUnit measure_unit;
signals:
    void OnUpdatePower(double power);
    void OnFrequencyChange(QString new_frequency);
    void OnPINCodeChanged(QString pin_code);
};

#endif // EVENTPROCESSOR_H
