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
} RF_Detector;

class Detector : public QObject
{
    Q_OBJECT
public:
    Detector(DeviceDetector device);

    void SetMode(DetectorMode mode);
    void SetFrequency(qint64 frequency);
    double GetPower();

private:
    RF_Detector detector;

signals:

};

#endif // DETECTOR_H
