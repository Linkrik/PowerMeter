#ifndef MEASURER_H
#define MEASURER_H

#include <QtGlobal>
#include <QRandomGenerator>

#include  <QTime>

#include <QThread>

#include <QFile>
#include <QDir>
#include <QDataStream>

#include <QtNetwork/QTcpSocket>

#include "rsnrpz.h"
#include "detector.h"

typedef enum
{
    POWER_CORRECTION = 1,
    POWER_SETUP = 2
} Type_SetPower;

typedef enum
{
    CHANNEL_Z85 = 1,
    CHANNEL_18T = 1
} Detector_Channel;

typedef enum
{
    SIZE_35x15 = 1,
    SIZE_285x126 = 2
} SizeWaveguide;

//typedef enum
//{
//    MODE_PULSE = 1,
//    MODE_CONTINUE = 2
//} MeasureMode;


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
    double GetRefPower(qint64 frequency);

    void SetPowerGenerator(double output_power, qint64 frequency, Type_SetPower mode);

    qint64 GetMaxFrequency();
    qint64 GetMinFrequency();

    void Calibration(SizeWaveguide size_waveguide);

signals:
    void OnUpdateProgressBar(qint32 progress);

private:
    bool is_measure_connect;
    bool is_reference_connect;
    SizeWaveguide size_waveguide;
    qint64 frequency;
    MeasureMode mode;

    qint64 max_frequency;
    qint64 min_frequency;
    qint64 step_frequency;

    QTcpSocket *generator_socket;

    double current_generator_power;

    Detector NRP_Z81;
    Detector NRP_Z85;
    Detector NRP_Z24;
    Detector NRP_18T;

    ViString  gs_sResourceName = "USB::0xAAD::0x0083::101358"; //NRP-Z85
    ViBoolean gs_hIDQuery = VI_TRUE;
    ViBoolean gs_hResetDevice = VI_TRUE;
    ViSession g_Session = 0;

    ViString  ref_sResourceName = "USB::0xAAD::0x0150::102136"; //NRP-18T
    ViBoolean ref_hIDQuery = VI_TRUE;
    ViBoolean ref_hResetDevice = VI_TRUE;
    ViSession ref_Session = 0;

    QString generator_address;
    qint32 generator_port;

    QVector<double> calibration_table_35x15;
    QVector<double> calibration_table_285x126;

};

#endif // MEASURER_H
