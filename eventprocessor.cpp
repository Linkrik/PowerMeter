#include "eventprocessor.h"

EventProcessor::EventProcessor(ManagerGUI * gui)
{
    this->gui = gui;
    this->measurer = new Measurer();
    measurer->MeasurerInit();

    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &EventProcessor::GetPower);
    timer->setInterval(250);
    timer->start();

    this->input_state = INPUT_STATE_INACTIVE;
    this->is_used_dot = false;
}

void EventProcessor::RefreshGUI(GUIAction id)
{ 
    switch (id)
    {
        case GUI_ACTION_SELECT_35x15:
        {
            this->measurer->SetSizeWaveguide(SIZE_35x15);
        } break;

        case GUI_ACTION_SELECT_285x126:
        {
            this->measurer->SetSizeWaveguide(SIZE_285x126);
        } break;

        case GUI_ACTION_SWITCH_TO_SYSTEM_MODE:
        {
            this->gui->SetStateGUI(STATE_SYSTEM_MODE);
        } break;

        case GUI_ACTION_SWITCH_TO_PIN_SECRET_MODE:
        {
            this->gui->SetStateGUI(STATE_ENTER_PIN_CODE_FOR_SECRET_MODE);
        } break;

        case GUI_ACTION_SWITCH_TO_SECRET_MODE:
        {
            this->gui->SetStateGUI(STATE_SECRET_MODE);
        } break;

        case GUI_ACTION_SWITCH_TO_SELECT_FREQ:
        {
            this->gui->SetStateGUI(STATE_SELECT_FREQ);
        } break;

        case GUI_ACTION_SWITCH_TO_PIN_DEV_MODE:
        {
            this->gui->SetStateGUI(STATE_PIN_FOR_DEV);
        } break;

        case GUI_ACTION_SWITCH_TO_DEV_MODE:
        {
            this->gui->SetStateGUI(STATE_DEV_MODE);
        } break;
    }

}

void EventProcessor::SetMeasureUnit(MeasureUnit measure_unit)
{
    this->measure_unit = measure_unit;
}

void EventProcessor::GetPower()
{
    if (this->gui->GetStateGUI() == STATE_SELECT_FREQ)
    {
        double power = measurer->GetPower();
        if (this->measure_unit == UNIT_WATT)
        {
            power = (pow(10, (power - 30)/10.0));
        }

        OnUpdatePower(power);
    }
}

void EventProcessor::ButtonHandle(ButtonID id)
{
    if (this->gui->GetStateGUI() == STATE_SELECT_FREQ)
    {
        if (this->input_state == INPUT_STATE_INACTIVE)
        {
            if (id != BUTTON_ENTER || id != BUTTON_DOT)
            {
                this->frequency_value = "";
                this->input_state = INPUT_STATE_ACTIVE;
                OnFrequencyChange(this->frequency_value);
            }
        }

        switch (id)
        {
            case BUTTON_0:
            {
                this->frequency_value += "0";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_1:
            {
                this->frequency_value += "1";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_2:
            {
                this->frequency_value += "2";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_3:
            {
                this->frequency_value += "3";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_4:
            {
                this->frequency_value += "4";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_5:
            {
                this->frequency_value += "5";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_6:
            {
                this->frequency_value += "6";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_7:
            {
                this->frequency_value += "7";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_8:
            {
                this->frequency_value += "8";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_9:
            {
                this->frequency_value += "9";
                OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_DOT:
            {
                if (this->input_state == INPUT_STATE_ACTIVE)
                {
                    if (!this->is_used_dot)
                    {
                        this->frequency_value += ".";
                        this->is_used_dot = true;
                        OnFrequencyChange(this->frequency_value);
                    }
                }
            } break;

            case BUTTON_BKS:
            {
                if (this->frequency_value.size() > 0)
                {
                    if (this->frequency_value[this->frequency_value.size() - 1] == ".")
                        this->is_used_dot = false;

                    this->frequency_value = this->frequency_value.remove(this->frequency_value.size() - 1, 1);
                    OnFrequencyChange(this->frequency_value);
                }
            } break;

            case BUTTON_ENTER:
            {
                if (this->input_state == INPUT_STATE_ACTIVE)
                {
                    this->input_state = INPUT_STATE_INACTIVE;

                    qint64 freq = qint64 (this->frequency_value.toDouble() * TO_GHZ);

                    if (freq >= this->measurer->GetMinFrequency() &&
                        freq <= this->measurer->GetMaxFrequency())
                    {
                        this->measurer->SetFrequency(freq);
                        OnFrequencyChange(this->frequency_value);
                    }
                }
            } break;
        }
    }
}

void EventProcessor::StartCalibration(SizeWaveguide sizeWave_guide)
{
    QFuture<void> future = QtConcurrent::run(measurer, &Measurer::Calibration, sizeWave_guide);
//    future.waitForFinished();
}
