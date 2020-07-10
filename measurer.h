#ifndef MEASURER_H
#define MEASURER_H

#include <QtGlobal>
#include <QRandomGenerator>

#include <QThread>

#include <QtNetwork/QTcpSocket>

#include "rsnrpz.h"

typedef enum
{
    SIZE_35x15 = 1,
    SIZE_285x126 = 2
} SizeWaveguide;

typedef enum
{
    MODE_PULSE = 1,
    MODE_CONTINUE = 2
} MeasureMode;


class Measurer : public QObject
{
    Q_OBJECT
public:
    Measurer();

    void MeasurerInit();
    void SetSizeWaveguide(SizeWaveguide size_waveguide);
    void SetFrequency(qint64 frequency);
    void SetMode(MeasureMode mode);

    bool IsConnect();

    void MeasurerMode(MeasureMode mode);

    double GetPower();

    qint64 GetMaxFrequency();
    qint64 GetMinFrequency();

    void Calibration(SizeWaveguide size_waveguide);
    void OpenConnection();

signals:
    void OnUpdateProgressBar(qint32 progress);

private:
    bool is_connect;
    SizeWaveguide size_waveguide;
    qint64 frequency;
    MeasureMode mode;

    qint64 max_frequency;
    qint64 min_frequency;
    qint64 step_frequency;

    ViString  gs_sResourceName = "USB::0xAAD::*?";
    ViBoolean gs_hIDQuery = VI_TRUE;
    ViBoolean gs_hResetDevice = VI_TRUE;
    ViSession g_Session = 0;

    QHostAddress *generator_address;

    QVector<double> calibration_table_35x15;
    QVector<double> calibration_table_285x126;

};

#endif // MEASURER_H
