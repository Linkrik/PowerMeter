#ifndef MANAGERGUI_H
#define MANAGERGUI_H

#include <QObject>
#include <QWidget>

#include <QPushButton>
#include <QHash>

#include <QDebug>

typedef enum
{
    STATE_SELECT_FREQ = 1,
    STATE_ENTER_PIN_CODE_FOR_SECRET_MODE = 2,
    STATE_SECRET_MODE = 3,
    STATE_SYSTEM_MODE = 4,
    STATE_PIN_FOR_DEV = 5,
    STATE_DEV_MODE = 6
} StateGUI;

class ManagerGUI : public QObject
{
    Q_OBJECT
public:
    ManagerGUI(QVector<QPushButton *> buttons);
    StateGUI GetStateGUI();
    void SetStateGUI(StateGUI new_state);

private:
    QVector<QPushButton *> button_visible;
    QHash<StateGUI, QVector<bool>> button_matrix;
    StateGUI state_gui;
signals:

};

#endif // MANAGERGUI_H
