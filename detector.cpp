#include "detector.h"

Detector::Detector(DeviceDetector device)
{
    this->detector.is_connect = false;

    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    status = rsnrpz_init(detector.ResourceName, detector.IDQuery, detector.ResetDevice, &detector.Session);

    QThread::sleep(1);

    switch (device)
    {
        case DEVICE_NRP_18T:
        {
            this->detector.Mode = MODE_CONTINUE;
            this->detector.Detector = DEVICE_NRP_18T;

            if (status == VI_SUCCESS)
            {
                rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 1);

                this->detector.is_connect = true;
            }
        } break;

        case DEVICE_NRP_Z24:
        {
            this->detector.Mode = MODE_CONTINUE;
            this->detector.Detector = DEVICE_NRP_Z24;

            if (status == VI_SUCCESS)
            {
                rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 1);

                this->detector.is_connect = true;
            }
        } break;

        case DEVICE_NRP_Z81:
        {
            this->detector.Mode = MODE_CONTINUE;
            this->detector.Detector = DEVICE_NRP_Z81;

            if (status == VI_SUCCESS)
            {
                rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 1);

                this->detector.is_connect = true;
            }
        } break;

        case DEVICE_NRP_Z85:
        {
            this->detector.Mode = MODE_CONTINUE;
            this->detector.Detector = DEVICE_NRP_Z85;

            if (status == VI_SUCCESS)
            {
                rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 1);

                this->detector.is_connect = true;
            }
        } break;
    }
}

void Detector::SetMode(DetectorMode mode)
{
    if (this->detector.Detector == DEVICE_NRP_Z81 ||
        this->detector.Detector == DEVICE_NRP_Z85)
    {
        if (mode == MODE_CONTINUE)
        {
            this->detector.Mode = MODE_CONTINUE;
        }

        if (mode == MODE_PULSE)
        {
            this->detector.Mode = MODE_PULSE;
        }
    }
}

void Detector::SetFrequency(qint64 frequency)
{
    if (this->detector.is_connect)
    {
        rsnrpz_chan_setCorrectionFrequency(this->detector.Session, this->detector.Channel, frequency);
    }
}

double Detector::GetPower()
{
    double measValue = 0;

    if (this->detector.Mode == MODE_CONTINUE)
    {
        ViBoolean measComplete = VI_FALSE;
        ViReal64 result;

        rsnrpz_chans_initiate(this->detector.Session);

        QThread::currentThread()->msleep(20);

        qint32 timeout = 0;
            qDebug() << "rsnrpz_chans_initiate";

        do
        {
            rsnrpz_chan_isMeasurementComplete(this->detector.Session, this->detector.Channel, &measComplete);
            QThread::currentThread()->msleep(50);
            timeout++;
            qDebug() << "do-while timeout=" << timeout;
        } while (!measComplete && timeout <= 10);


        if (measComplete == VI_TRUE)
        {
            rsnrpz_meass_fetchMeasurement(this->detector.Session, this->detector.Channel, &result);
            measValue = 10 * log(fabs(result)) / log(10.0) + 30.0;
            qDebug() << "measComplete == VI_TRUE";
        }
        else
        {
            measValue = -2;
            qDebug() << "measComplete == -2";
        }
    }

    return measValue;
}
