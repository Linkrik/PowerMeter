#ifndef DETECTOR_H
#define DETECTOR_H

#include <QtGlobal>
#include <QtMath>

#include <QObject>
#include <QThread>
#include <QDebug>

#include "rsnrpz.h"

typedef enum
{
    MODE_PULSE = 1,
    MODE_CONTINUE = 2
} DetectorMode;

typedef enum
{
    DEVICE_NRP_Z85 = 1,
    DEVICE_NRP_Z81 = 2,
    DEVICE_NRP_18T = 3,
    DEVICE_NRP_Z24 = 4
} DeviceDetector;

typedef struct
{
    ViString  ResourceName;
    ViBoolean IDQuery;
    ViBoolean ResetDevice;
    ViSession Session;
    qint32    Channel;
    DeviceDetector Detector;
    DetectorMode Mode;
    bool is_connect;
    qint32 uid;
} DetectorSettings;

typedef struct
{
    QString sensorName;
    QString sensorType;
    QString sensorSN;
} SensorInfo;

class Detector : public QObject
{
    Q_OBJECT
public:
    Detector(DetectorSettings detector_settings, DeviceDetector device);

    void SetMode(DetectorMode mode);
    void SetFrequency(qint64 frequency);
    double GetPower();
    bool IsConnect();
    SensorInfo GetSensorInfo();

private:
    DetectorSettings detector;
    SensorInfo sensor_info;

signals:

};

#endif // DETECTOR_H
