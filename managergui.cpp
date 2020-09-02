#include "managergui.h"

ManagerGUI::ManagerGUI(QVector<QPushButton *> buttons)
{
    this->button_visible = buttons;

    //                                                         |  35x15 | 28.5x12.6 | System | Secret
    this->button_matrix[STATE_SELECT_FREQ]                      << true  << true  << true  << true;
    this->button_matrix[STATE_ENTER_PIN_CODE_FOR_SECRET_MODE]   << false << false << false << true;
    this->button_matrix[STATE_SECRET_MODE]                      << true  << true  << false << false;
    this->button_matrix[STATE_SYSTEM_MODE]                      << false << false << true  << false;
    this->button_matrix[STATE_PIN_FOR_DEV]                      << false << false << false << false;
    this->button_matrix[STATE_DEV_MODE]                         << false << false << false << false;
    this->button_matrix[STATE_SELF_TEST_ATT]                    << false << false << true  << false;
    this->button_matrix[STATE_SENSOR_INFO]                      << false << false << true  << false;

    this->state_gui = STATE_SELECT_FREQ;
}

StateGUI ManagerGUI::GetStateGUI()
{
    return this->state_gui;
}

void ManagerGUI::SetStateGUI(StateGUI new_state)
{
    this->state_gui = new_state;

    for (int i = 0; i < this->button_matrix[new_state].size(); i++)
    {
        bool set_enable = this->button_matrix[new_state][i];
        this->button_visible[i]->setEnabled(set_enable);
    }
}
