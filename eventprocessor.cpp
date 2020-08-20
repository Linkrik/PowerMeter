#include "eventprocessor.h"

EventProcessor::EventProcessor(ManagerGUI * gui)
{
    this->gui = gui;
    this->measurer = new Measurer();
    measurer->MeasurerInit();

    timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &EventProcessor::GetPower);
    timer->setInterval(250);
    timer->stop();

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

        emit OnUpdatePower(power);
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
                emit OnFrequencyChange(this->frequency_value);
            }
        }

        switch (id)
        {
            case BUTTON_0:
            {
                this->frequency_value += "0";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_1:
            {
                this->frequency_value += "1";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_2:
            {
                this->frequency_value += "2";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_3:
            {
                this->frequency_value += "3";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_4:
            {
                this->frequency_value += "4";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_5:
            {
                this->frequency_value += "5";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_6:
            {
                this->frequency_value += "6";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_7:
            {
                this->frequency_value += "7";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_8:
            {
                this->frequency_value += "8";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_9:
            {
                this->frequency_value += "9";
                emit OnFrequencyChange(this->frequency_value);
            } break;

            case BUTTON_DOT:
            {
                if (this->input_state == INPUT_STATE_ACTIVE)
                {
                    if (!this->is_used_dot)
                    {
                        this->frequency_value += ".";
                        this->is_used_dot = true;
                        emit OnFrequencyChange(this->frequency_value);
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
                    emit OnFrequencyChange(this->frequency_value);
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
                        emit OnFrequencyChange(this->frequency_value);
                    }
                }
            } break;
        }
    }
}

void EventProcessor::StartTimer()
{
    this->timer->start();
}

void EventProcessor::StopTimer()
{
    this->timer->stop();
}

void EventProcessor::StartCalibration(SizeWaveguide sizeWave_guide)
{
//    this->timer->stop();
    QFuture<void> future = QtConcurrent::run(measurer, &Measurer::Calibration, sizeWave_guide);
//    this->timer->start(250);
//    future.waitForFinished();
}

void EventProcessor::SercetCodeButtonHandler(ButtonID id)
{
    if (this->input_state == INPUT_STATE_INACTIVE)
    {
        if (id != BUTTON_ENTER)
        {
            this->secret_symbol = "";
            this->input_state = INPUT_STATE_ACTIVE;
            emit OnSecretCodeChanged(this->secret_symbol);
        }
    }

        switch (id)
        {
            case BUTTON_0:
            {
                this->secret_symbol = "0";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_1:
            {
                this->secret_symbol = "1";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_2:
            {
                this->secret_symbol = "2";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_3:
            {
                this->secret_symbol = "3";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_4:
            {
                this->secret_symbol = "4";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_5:
            {
                this->secret_symbol = "5";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_6:
            {
                this->secret_symbol = "6";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_7:
            {
                this->secret_symbol = "7";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_8:
            {
                this->secret_symbol = "8";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_9:
            {
                this->secret_symbol = "9";
                emit OnSecretCodeChanged(this->secret_symbol);
            } break;

            case BUTTON_BKS:
            {
                if (this->secret_symbol.size() > 0)
                {
                    this->secret_symbol = this->secret_symbol.remove(this->secret_symbol.size() - 1, 1);
                    emit OnSecretCodeChanged(this->secret_symbol);
                }
            } break;

            case BUTTON_ENTER:
            {
                if (this->input_state == INPUT_STATE_ACTIVE)
                {
                    this->input_state = INPUT_STATE_INACTIVE;
                    emit OnSecretCodeChanged(this->secret_symbol);
                }
            } break;
        }
}
