#include "detector.h"

#define DEBUG

Detector::Detector(DetectorSettings detector_settings, DeviceDetector device)
{    
    this->detector = detector_settings;
    this->detector.is_connect = false;

    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    ViInt32 detector_count = 9;
//    rsnrpz_GetSensorCount(0, &detector_count);

//    rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);

//    rsnrpz_setTimeout(5000);

    status = rsnrpz_init(detector.ResourceName, detector.IDQuery, detector.ResetDevice, &detector.Session);

    rsnrpz_chan_zero(detector.Session, detector.Channel);

//    status = rsnrpz_chan_reset(detector.Session, detector.Channel);

//    status = rsnrpz_avg_reset(detector.Session, detector.Channel);

//    status = rsnrpz_chan_zero(detector.Session, detector.Channel);

    if (detector_count > 0)
    {
        qDebug() << "detector_count = " << detector_count;

        switch (device)
        {
            case DEVICE_NRP_18T:
            {
                if (status == 0)
                {
                    this->detector.Mode = MODE_CONTINUE;
                    this->detector.Detector = DEVICE_NRP_18T;

                    qDebug() << "status init NRP-18T: " << status;

                    if (status == VI_SUCCESS)
                    {

                        rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                        rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                        rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 4);

                        rsnrpz_chan_setCorrectionFrequency(detector.Session, detector.Channel, 10 );

                        this->sensor_info.sensorName = sensorName;
                        this->sensor_info.sensorType = sensorType;
                        this->sensor_info.sensorSN = sensorSN;

                        detector.uid = 18;
        #ifdef DEBUG
                        qDebug() << "NRP-18T SensorName: " << sensorName;
                        qDebug() << "NRP-18T SensorType: " << sensorType;
                        qDebug() << "NRP-18T SensorSN: " << sensorSN;
                        qDebug() << "NRP-18T UID: " << detector.uid;
        #endif
                        this->detector.is_connect = true;
                    }
                }
                else
                {
                    this->sensor_info.sensorName = "ERR";
                    this->sensor_info.sensorType = "NRP18T";
                    this->sensor_info.sensorSN = "ERR";
                    detector.uid = 98;
                }
            } break;

            case DEVICE_NRP_Z24:
            {
                if (status == 0)
                {
                    this->detector.Mode = MODE_CONTINUE;
                    this->detector.Detector = DEVICE_NRP_Z24;

    //                rsnrpz_setTimeout(5000);

    //                status = rsnrpz_init(detector.ResourceName, detector.IDQuery, detector.ResetDevice, &detector.Session);

    //                status = rsnrpz_chan_reset(detector.Session, detector.Channel);

    //                status = rsnrpz_avg_reset(detector.Session, detector.Channel);

    //                status = rsnrpz_chan_zero(detector.Session, detector.Channel);

        //            QThread::sleep(1);

                    qDebug() << "status init NRP-Z24: " << status;

                    if (status == VI_SUCCESS)
                    {
                        rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                        rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                        //                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                        rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 4);

                        this->detector.is_connect = true;

                        this->sensor_info.sensorName = sensorName;
                        this->sensor_info.sensorType = sensorType;
                        this->sensor_info.sensorSN = sensorSN;


                        detector.uid = 24;
    #ifdef DEBUG
                        qDebug() << "NRP-Z24 SensorName: " << sensorName;
                        qDebug() << "NRP-Z24 SensorType: " << sensorType;
                        qDebug() << "NRP-Z24 SensorSN: " << sensorSN;
                        qDebug() << "NRP-Z24 UID: " << detector.uid;
    #endif
                    }
                }
                else
                {
                    this->sensor_info.sensorName = "ERR";
                    this->sensor_info.sensorType = "NRP-Z24";
                    this->sensor_info.sensorSN = "ERR";
                    detector.uid = 99;
                }
            } break;

            case DEVICE_NRP_Z81:
            {
                if (status == 0)
                {
                    this->detector.Mode = MODE_CONTINUE;
                    this->detector.Detector = DEVICE_NRP_Z81;

    //                rsnrpz_setTimeout(5000);


    //                status = rsnrpz_init(detector.ResourceName, detector.IDQuery, detector.ResetDevice, &detector.Session);

    //                status = rsnrpz_chan_reset(detector.Session, detector.Channel);

    //                status = rsnrpz_avg_reset(detector.Session, detector.Channel);

    //                status = rsnrpz_chan_zero(detector.Session, detector.Channel);

        //            QThread::sleep(1);

                    qDebug() << "status init NRP-Z81: " << status;

                    if (status == VI_SUCCESS)
                    {
                        rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                        rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                        rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 4);

                        this->detector.is_connect = true;

                        this->sensor_info.sensorName = sensorName;
                        this->sensor_info.sensorType = sensorType;
                        this->sensor_info.sensorSN = sensorSN;
                        detector.uid = 81;
        #ifdef DEBUG
                        qDebug() << "NRP-Z81 SensorName: " << sensorName;
                        qDebug() << "NRP-Z81 SensorType: " << sensorType;
                        qDebug() << "NRP-Z81 SensorSN: " << sensorSN;
                        qDebug() << "NRP-Z81 UID: " << detector.uid;

        #endif
                    }
                }
                else
                {
                    this->sensor_info.sensorName = "ERR";
                    this->sensor_info.sensorType = "NRP-Z81";
                    this->sensor_info.sensorSN = "ERR";
                    detector.uid = 97;
                }
            } break;

            case DEVICE_NRP_Z85:
            {
                if (status == 0)
                {
                    this->detector.Mode = MODE_CONTINUE;
                    this->detector.Detector = DEVICE_NRP_Z85;

                    qDebug() << "status init NRP-Z85: " << status;

    //                while (sensorType != "NRP-Z81")
    //                {
    //                    status = rsnrpz_init(detector.ResourceName, detector.IDQuery, detector.ResetDevice, &detector.Session);

    //                    status = rsnrpz_chan_reset(detector.Session, detector.Channel);

    //                    status = rsnrpz_avg_reset(detector.Session, detector.Channel);

    //                    status = rsnrpz_chan_zero(detector.Session, detector.Channel);

    //                    QThread::msleep(500);

    //                    rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);

    //                }

                    if (status == VI_SUCCESS)
                    {
                        rsnrpz_GetSensorInfo(detector.Session, detector.Channel, sensorName, sensorType, sensorSN);
                        rsnrpz_chan_mode(detector.Session, detector.Channel, RSNRPZ_SENSOR_MODE_CONTAV);
                        //                rsnrpz_avg_setAutoEnabled(detector.Session, detector.Channel, VI_FALSE);
                        rsnrpz_avg_configureAvgManual(detector.Session, detector.Channel, 4);

                        this->sensor_info.sensorName = sensorName;
                        this->sensor_info.sensorType = sensorType;
                        this->sensor_info.sensorSN = sensorSN;

                        this->detector.is_connect = true;

                                        this->sensor_info.sensorName = sensorName;
                                        this->sensor_info.sensorType = sensorType;
                                        this->sensor_info.sensorSN = sensorSN;
                                        detector.uid = 85;
                        #ifdef DEBUG
                                        qDebug() << "NRP-Z85 SensorName: " << sensorName;
                                        qDebug() << "NRP-Z85 SensorType: " << sensorType;
                                        qDebug() << "NRP-Z85 SensorSN: " << sensorSN;
                                        qDebug() << "NRP-Z85 UID: " << detector.uid;
                        #endif
                    }
                }
                else
                {
                    this->sensor_info.sensorName = "ERR";
                    this->sensor_info.sensorType = "NRP-Z85";
                    this->sensor_info.sensorSN = "ERR";
                    detector.uid = 96;
                }
            } break;
        }
    }
}

SensorInfo Detector::GetSensorInfo()
{
    return sensor_info;
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

bool Detector::IsConnect()
{
    return this->detector.is_connect;
}


double Detector::GetPower()
{
    if (this->detector.is_connect == true)
    {
        double measValue = 0;

        switch (this->detector.Detector)
        {
            case DEVICE_NRP_18T:
            {
                qDebug() << "NRP-18T";
                ViBoolean measComplete = VI_FALSE;
                ViReal64 result;

                rsnrpz_chans_initiate(this->detector.Session);

                QThread::currentThread()->msleep(20);

                qint32 timeout = 0;

                do
                {
                    rsnrpz_chan_isMeasurementComplete(this->detector.Session, this->detector.Channel, &measComplete);
                    QThread::currentThread()->msleep(100);
                    timeout++;
//                    qDebug() << "do-while timeout=" << timeout;
                } while (!measComplete && timeout <= 10);


                if (measComplete == VI_TRUE)
                {
                    rsnrpz_meass_fetchMeasurement(this->detector.Session, this->detector.Channel, &result);
                    measValue = 10 * log(fabs(result)) / log(10.0) + 30.0;
//                    qDebug() << "measComplete == VI_TRUE";
                }
                else
                {
                    measValue = -2;
//                    qDebug() << "measComplete == -2";
                }

                return measValue;
            } break;

            case DEVICE_NRP_Z24:
            {

            } break;

            case DEVICE_NRP_Z81:
            {
                qDebug() << "NRP-Z81";
                ViBoolean measComplete = VI_FALSE;
                ViReal64 result;

                rsnrpz_chans_initiate(this->detector.Session);

                QThread::currentThread()->msleep(20);

                qint32 timeout = 0;
//                    qDebug() << "rsnrpz_chans_initiate";

                do
                {
                    rsnrpz_chan_isMeasurementComplete(this->detector.Session, this->detector.Channel, &measComplete);
                    QThread::currentThread()->msleep(50);
                    timeout++;
//                    qDebug() << "do-while timeout=" << timeout;
                } while (!measComplete && timeout <= 10);


                if (measComplete == VI_TRUE)
                {
                    rsnrpz_meass_fetchMeasurement(this->detector.Session, this->detector.Channel, &result);
                    measValue = 10 * log(fabs(result)) / log(10.0) + 30.0;
//                    qDebug() << "measComplete == VI_TRUE";
                }
                else
                {
                    measValue = -2;
//                    qDebug() << "measComplete == -2";
                }

                return measValue;
            } break;

            case DEVICE_NRP_Z85:
            {

            } break;
        }
    }
    else
    {
        return -2;
    }
}

