#include "measurer.h"

Measurer::Measurer()
{
    this->is_connect = false;
    this->min_frequency = 5E9;
    this->max_frequency = 7E9;
    this->step_frequency = 1000000;
    this->mode = MODE_CONTINUE;
}

void Measurer::SetSizeWaveguide(SizeWaveguide size_waveguide)
{
    this->size_waveguide = size_waveguide;
}

void Measurer::SetFrequency(qint64 frequency)
{
    this->frequency = frequency;
}

void Measurer::SetMode(MeasureMode mode)
{
    this->mode = mode;
}

void Measurer::MeasurerMode(MeasureMode mode)
{
    this->mode = mode;
    this->is_connect = false;

    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    rsnrpz_close(this->g_Session);

    QThread::sleep(1);

    status = rsnrpz_init(this->gs_sResourceName, this->gs_hIDQuery, this->gs_hResetDevice, &this->g_Session);

    QThread::sleep(1);

    if (this->mode == MODE_CONTINUE)
    {
        if (status == VI_SUCCESS)
        {
            rsnrpz_GetSensorInfo(this->g_Session, 1, sensorName, sensorType, sensorSN);
            rsnrpz_chan_mode(this->g_Session, 1, RSNRPZ_SENSOR_MODE_CONTAV);
            rsnrpz_chan_setCorrectionFrequency(this->g_Session, 1, 3E9);
            rsnrpz_avg_setAutoEnabled(this->g_Session, 1, VI_FALSE);
            rsnrpz_avg_configureAvgManual(this->g_Session, 1, 1);
            rsnrpz_chan_setContAvAperture(this->g_Session, 1, 100E-6);
            rsnrpz_trigger_setSource(this->g_Session, 1, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
            rsnrpz_chan_setContAvSmoothingEnabled(this->g_Session, 1, VI_TRUE);

            this->is_connect = true;
        }
    }
    else
        if (this->mode == MODE_PULSE)
    {
            rsnrpz_GetSensorInfo(this->g_Session, 1, sensorName, sensorType, sensorSN);
            rsnrpz_chan_mode(this->g_Session, 1, RSNRPZ_SENSOR_MODE_TIMESLOT);
            rsnrpz_chan_setCorrectionFrequency(this->g_Session, 1, 100E6);
            rsnrpz_trigger_setSource(this->g_Session, 1, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
            rsnrpz_tslot_configureTimeSlot(this->g_Session, 1, 1, 577E-6);
            rsnrpz_timing_setTimingExcludeStop(this->g_Session, 1, 3E-6);
            rsnrpz_trigger_setLevel(this->g_Session, 1, pow(10, -30.0 / 10.0) / 1000.0);
            rsnrpz_avg_configureAvgManual(this->g_Session, 1, 2);
    }
}

double Measurer::GetPower()
{
    double measValue = 0;

    if (this->is_connect)
    {
        if (this->mode == MODE_CONTINUE)
        {
            ViBoolean measComplete = VI_FALSE;
            ViReal64 result;

            rsnrpz_chans_initiate(this->g_Session);

            do
            {
                rsnrpz_chan_isMeasurementComplete(this->g_Session, 1, &measComplete);
    //            qDebug() << "measComplete -> " << measComplete;
            } while (!measComplete);

            rsnrpz_meass_fetchMeasurement(this->g_Session, 1, &result);

            measValue = 10 * log(fabs(result)) / log(10.0) + 30.0;
        }
        else
            if (this->mode == MODE_PULSE)
            {
                ViBoolean measComplete = VI_FALSE;
                ViReal64 result[100];
                ViInt32 count = 0;

                rsnrpz_chans_initiate(this->g_Session);

                do
                {
                    rsnrpz_chan_isMeasurementComplete(this->g_Session, 1, &measComplete);
        //            qDebug() << "measComplete -> " << measComplete;
                } while (!measComplete);

                rsnrpz_meass_fetchBufferMeasurement(this->g_Session, 1, 100, result, &count);
                if (count > 0)
                {
                    measValue = 10 * log(fabs(result[0])) / log(10.0) + 30.0; //Watt to dBm
//                    printf("%0.3f, ", measValue);
                }
            }
        return measValue;
    }
    else
        return -1;
}

void Measurer::MeasurerInit()
{
    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    status = rsnrpz_init(this->gs_sResourceName, this->gs_hIDQuery, this->gs_hResetDevice, &this->g_Session);

    QThread::sleep(1);

    if (status == VI_SUCCESS)
    {
        rsnrpz_GetSensorInfo(this->g_Session, 1, sensorName, sensorType, sensorSN);
        rsnrpz_chan_mode(this->g_Session, 1, RSNRPZ_SENSOR_MODE_CONTAV);
        rsnrpz_chan_setCorrectionFrequency(this->g_Session, 1, 3E9);
        rsnrpz_avg_setAutoEnabled(this->g_Session, 1, VI_FALSE);
        rsnrpz_avg_configureAvgManual(this->g_Session, 1, 1);
        rsnrpz_chan_setContAvAperture(this->g_Session, 1, 100E-6);
        rsnrpz_trigger_setSource(this->g_Session, 1, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
        rsnrpz_chan_setContAvSmoothingEnabled(this->g_Session, 1, VI_TRUE);

        this->is_connect = true;
    }
}

bool Measurer::IsConnect()
{
    return this->is_connect;
}

qint64 Measurer::GetMaxFrequency()
{
    return this->max_frequency;
}

qint64 Measurer::GetMinFrequency()
{
    return this->min_frequency;
}

void Measurer::OpenConnection()
{

}

void Measurer::Calibration(SizeWaveguide size_waveguide)
{
//    QFuture<void> future = QtConcurrent::run(this, &Measurer::Calibration, sizeWave_guide);

//    this->generator_address = new QHostAddress;

//    for (qint8 j = 0; j < 10; j++)
//    {
//        QThread::sleep(1);
//        OnUpdateProgressBar((j + 1) * 10);
//    }
    // 1) Открыть все соединения (с эталонной башкой, с генератором) и настроить все приборы
    //  1.1) Открыть сессию для башки-эталона
    //      Установить первоначальные настройки
    //  1.2) Открыть сессию для генератора
    //      Установить первоначальные настройки
    // 2) Произвести калибровку
    //    цикл от мин_часты до макс_частоты шаг++
    //      1. Задаем на генераторе частоту
    //      2. Ждём (QThread::sleep) 10 мс
    //      3. Измеряем показания эталоной башки (А - это показания эталоной башки)
    //      4. Измеряем показания измерительной башшки (Б - это показания измерительной башшки)
    //      5. Вычисляем коэф. А-Б
    //          Vector<double> table.  table.append(А-Б);
    //    Записываем полученную таблицу в поле класса
    // 3) Сохранить в файл
    //    Структуру Vector<double> table пишем в QFile.
    // 4) Закрыть все соединения
}
