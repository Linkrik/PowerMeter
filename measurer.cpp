#include "measurer.h"

Measurer::Measurer()
{
    this->is_measure_connect = false;
    this->min_frequency = 5.9E9;
    this->max_frequency = 7.1E9;
    this->step_frequency = 1000000;

    RF_Detector detector;

    detector.Mode = MODE_CONTINUE;
    detector.Channel = CHANNEL_18T;
//    this->mode = MODE_CONTINUE;
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
    this->is_measure_connect = false;

    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    status = rsnrpz_init(this->gs_sResourceName, this->gs_hIDQuery, this->gs_hResetDevice, &this->g_Session);

    QThread::sleep(1);


    if (this->mode == MODE_CONTINUE)
    {
        if (status == VI_SUCCESS)
        {
            rsnrpz_GetSensorInfo(this->g_Session, CHANNEL_Z85, sensorName, sensorType, sensorSN);
            rsnrpz_chan_mode(this->g_Session, CHANNEL_Z85, RSNRPZ_SENSOR_MODE_CONTAV);
//            rsnrpz_chan_setCorrectionFrequency(this->g_Session, CHANNEL_Z85, 3E9);
            rsnrpz_avg_setAutoEnabled(this->g_Session, CHANNEL_Z85, VI_FALSE);
            rsnrpz_avg_configureAvgManual(this->g_Session, CHANNEL_Z85, 1);
//            rsnrpz_chan_setContAvAperture(this->g_Session, CHANNEL_Z85, 100E-6);
//            rsnrpz_trigger_setSource(this->g_Session, CHANNEL_Z85, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
//            rsnrpz_chan_setContAvSmoothingEnabled(this->g_Session, CHANNEL_Z85, VI_TRUE);

            this->is_measure_connect = true;
        }
    }
    else
        if (this->mode == MODE_PULSE)
    {
            rsnrpz_GetSensorInfo(this->g_Session, CHANNEL_Z85, sensorName, sensorType, sensorSN);
            rsnrpz_chan_mode(this->g_Session, CHANNEL_Z85, RSNRPZ_SENSOR_MODE_TIMESLOT);
            rsnrpz_chan_setCorrectionFrequency(this->g_Session, CHANNEL_Z85, 11E9);
            rsnrpz_trigger_setSource(this->g_Session, CHANNEL_Z85, RSNRPZ_TRIGGER_SOURCE_INTERNAL);
            rsnrpz_tslot_configureTimeSlot(this->g_Session, CHANNEL_Z85, 1, 577E-6);
            rsnrpz_timing_setTimingExcludeStop(this->g_Session, CHANNEL_Z85, 3E-3);
            rsnrpz_trigger_setLevel(this->g_Session, CHANNEL_Z85, pow(10, 7.0 / 10.0) / 1000.0);
            rsnrpz_avg_configureAvgManual(this->g_Session, CHANNEL_Z85, 50);

            this->is_measure_connect = true;
    }

    qDebug() << "Z85 SensorName: " << sensorName;
    qDebug() << "Z85 SensorType: " << sensorType;
    qDebug() << "Z85 SensorSN: " << sensorSN;

}

double Measurer::GetPower()
{
    double measValue = 0;

    if (this->is_measure_connect)
    {

        if (this->mode == MODE_CONTINUE)
        {
            ViBoolean measComplete = VI_FALSE;
            ViReal64 result;

            rsnrpz_chans_initiate(this->g_Session);

            QThread::currentThread()->msleep(20);

            qint32 timeout = 0;
             qDebug() << "rsnrpz_chans_initiate";

            do
            {
                rsnrpz_chan_isMeasurementComplete(this->g_Session, CHANNEL_Z85, &measComplete);
                QThread::currentThread()->msleep(50);
                timeout++;
                qDebug() << "do-while timeout=" << timeout;
            } while (!measComplete && timeout <= 10);


            if (measComplete == VI_TRUE)
            {
                rsnrpz_meass_fetchMeasurement(this->g_Session, CHANNEL_Z85, &result);
                measValue = 10 * log(fabs(result)) / log(10.0) + 30.0;
                qDebug() << "measComplete == VI_TRUE";
            }
            else
            {
                measValue = -2;
                qDebug() << "measComplete == -2";
            }
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
                    rsnrpz_chan_isMeasurementComplete(this->g_Session, CHANNEL_Z85, &measComplete);
                } while (!measComplete);

                rsnrpz_meass_fetchBufferMeasurement(this->g_Session, CHANNEL_Z85, 100, result, &count);
                if (count > 0)
                {
                    measValue = 10 * log(fabs(result[0])) / log(10.0) + 30.0; //Watt to dBm
                }
            }
        return measValue;
    }
    else
        return -1;
}

double Measurer::GetRefPower(qint64 frequency)
{
    double reference_power;

    ViBoolean measComplete = VI_FALSE;
    ViReal64 result;

    rsnrpz_chans_initiate(this->ref_Session);

    qint32 timeout = 0;

    rsnrpz_chan_setCorrectionFrequency(this->ref_Session, CHANNEL_18T, frequency);
    QThread::currentThread()->msleep(10);

    do
    {
        rsnrpz_chan_isMeasurementComplete(this->ref_Session, CHANNEL_18T, &measComplete);
        QThread::currentThread()->msleep(30);
        timeout++;
    } while (!measComplete && timeout <= 10);


    rsnrpz_meass_fetchMeasurement(this->ref_Session, CHANNEL_18T, &result);
//        rsnrpz_meass_readMeasurement(this->ref_Session, 1, 30, &result);

    reference_power = 10 * log(fabs(result)) / log(10.0) + 30.0;

    return reference_power;

}

void Measurer::MeasurerInit()
{
    this->MeasurerMode(MODE_CONTINUE);
//    this->Calibration(SIZE_35x15);

//    rsnrpz_AddSensor(this->g_Session, 2, this->ref_sResourceName, this->ref_hIDQuery, this->ref_hResetDevice);
//    rsnrpz_chan_zero(this->g_Session, 2);
//    ViStatus status = VI_SUCCESS;
//    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

//    status = rsnrpz_init(this->gs_sResourceName, this->gs_hIDQuery, this->gs_hResetDevice, &this->g_Session);

//    QThread::sleep(1);

//    if (status == VI_SUCCESS)
//    {
//        rsnrpz_GetSensorInfo(this->g_Session, 1, sensorName, sensorType, sensorSN);
//        rsnrpz_chan_mode(this->g_Session, 1, RSNRPZ_SENSOR_MODE_CONTAV);
//        rsnrpz_chan_setCorrectionFrequency(this->g_Session, 1, 3E9);
//        rsnrpz_avg_setAutoEnabled(this->g_Session, 1, VI_FALSE);
//        rsnrpz_avg_configureAvgManual(this->g_Session, 1, 1);
//        rsnrpz_chan_setContAvAperture(this->g_Session, 1, 100E-6);
//        rsnrpz_trigger_setSource(this->g_Session, 1, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
//        rsnrpz_chan_setContAvSmoothingEnabled(this->g_Session, 1, VI_TRUE);

//        this->is_connect = true;
//    }
}

bool Measurer::IsConnect()
{
    return this->is_measure_connect;
}

qint64 Measurer::GetMaxFrequency()
{
    return this->max_frequency;
}

qint64 Measurer::GetMinFrequency()
{
    return this->min_frequency;
}

void Measurer::SetPowerGenerator(double output_power, qint64 frequency, Type_SetPower mode)
{
    QString scpi_cmd;
    double k = 0;
    double current_power;

    double reference_power = 0;
    if (mode == POWER_SETUP)
        current_power = output_power;
    else
        if (mode == POWER_CORRECTION)
            current_power = this->current_generator_power;


    while (!(reference_power > output_power + k - 0.01 &&
             reference_power < output_power + k + 0.01))
    {
        ViBoolean measComplete = VI_FALSE;
        ViReal64 result;
        qint32 timeout = 0;

        rsnrpz_chan_setCorrectionFrequency(this->ref_Session, CHANNEL_18T, frequency);
        QThread::currentThread()->msleep(200);

//        ViInt32 err_code = 0;
//        ViChar _VI_FAR errorMessage[128];
//        while (err_code != 0)
//            rsnrpz_error_query (this->ref_Session, &err_code, errorMessage);

        rsnrpz_chans_initiate(this->ref_Session);

        do
        {
            rsnrpz_chan_isMeasurementComplete(this->ref_Session, CHANNEL_18T, &measComplete);
            QThread::currentThread()->msleep(100);
            timeout++;
        } while (!measComplete && timeout <= 30);

        rsnrpz_meass_fetchMeasurement(this->ref_Session, CHANNEL_18T, &result);
    //        rsnrpz_meass_readMeasurement(this->ref_Session, 1, 30, &result);

        reference_power = 10 * log(fabs(result)) / log(10.0) + 30.0;

//        qDebug() << "reference_power: " << reference_power;

        if (reference_power >= output_power + k)
        {
            current_power -= 0.005;
            scpi_cmd = ":POW " + QString::number(current_power) + " dBm\n"; //set power
            generator_socket->write(scpi_cmd.toLocal8Bit());
            generator_socket->waitForBytesWritten();
//            qDebug() << "SCPI: " << scpi_cmd;
        }
        else
            if (reference_power <= output_power + k)
            {
                current_power += 0.005;
                scpi_cmd = ":POW " + QString::number(current_power) + " dBm\n"; //set power
                generator_socket->write(scpi_cmd.toLocal8Bit());
                generator_socket->waitForBytesWritten();
//                qDebug() << "SCPI: " << scpi_cmd;
            }
    }


    this->current_generator_power = current_power;

    scpi_cmd = ":POW " + QString::number(current_power) + " dBm\n"; //set power
    generator_socket->write(scpi_cmd.toLocal8Bit());
    generator_socket->waitForBytesWritten();
//    qDebug() << "SCPI: " << scpi_cmd;
}

void Measurer::Calibration(SizeWaveguide size_waveguide)
{
    // Connect to generator
    // Установить частоту
    // Установить мощность (амплитуда)
    // Установить режим без модуляций.
    // Вкл. выход
    this->generator_address = "192.168.0.109";
    this->generator_port = 5025;

    this->generator_socket = new QTcpSocket();
    generator_socket->connectToHost(this->generator_address, this->generator_port);

    if (generator_socket->waitForConnected(1000))
            qDebug() << "Connected! " << QTime::currentTime().toString();

    QStringList scpi_cmd_generator_init;
    scpi_cmd_generator_init.append("*IDN?\n");
    scpi_cmd_generator_init.append(":DISP ON\n");
    scpi_cmd_generator_init.append(":DISPLAY: REMOTE ON\n");
    scpi_cmd_generator_init.append(":POWER: MODE FIXED\n");
    scpi_cmd_generator_init.append(":FREQUENCY: MODE FIXED\n");
    scpi_cmd_generator_init.append(":UNIT: POWER DBM\n");
//    scpi_cmd_generator_init.append(":POW -15 dBm\n");
//    scpi_cmd_generator_init.append(":FREQ 11.25 GHz\n");
//    scpi_cmd_generator_init.append(":OUTP ON\n");

    for (qint32 i = 0; i < scpi_cmd_generator_init.size(); i++)
    {
        generator_socket->write(scpi_cmd_generator_init.at(i).toLocal8Bit());
        generator_socket->waitForBytesWritten();
        qDebug() << "SCPI: " << scpi_cmd_generator_init.at(i);
    }

    QString scpi_cmd = ":FREQ " + QString::number(this->min_frequency) + " Hz\n"; // set min frequency
    generator_socket->write(scpi_cmd.toLocal8Bit());
    generator_socket->waitForBytesWritten();
    qDebug() << "SCPI: " << scpi_cmd;

    scpi_cmd = ":OUTP ON\n"; //output enable
    generator_socket->write(scpi_cmd.toLocal8Bit());
    generator_socket->waitForBytesWritten();
    qDebug() << "SCPI: " << scpi_cmd;

    // Connect to power meausrer NRP-T18

    this->is_reference_connect = false;
    ViStatus status = VI_SUCCESS;
    ViChar	 sensorName[256], sensorType[256], sensorSN[256];

    status = rsnrpz_init(this->ref_sResourceName, this->ref_hIDQuery, this->ref_hResetDevice, &this->ref_Session);

    if (status == VI_SUCCESS)
    {
       rsnrpz_chan_zero (this->ref_Session, CHANNEL_18T);

       QThread::currentThread()->usleep(100);

       rsnrpz_GetSensorInfo(this->ref_Session, CHANNEL_18T, sensorName, sensorType, sensorSN);
       rsnrpz_chan_mode(this->ref_Session, CHANNEL_18T, RSNRPZ_SENSOR_MODE_CONTAV);
       rsnrpz_trigger_setSource(this->ref_Session, CHANNEL_18T, RSNRPZ_TRIGGER_SOURCE_IMMEDIATE);
       rsnrpz_avg_configureAvgManual(this->ref_Session, CHANNEL_18T, 5);

       this->is_reference_connect = true;
    }

    rsnrpz_GetSensorInfo(this->ref_Session, CHANNEL_18T, sensorName, sensorType, sensorSN);
    qDebug() << "Ref SensorName: " << sensorName;
    qDebug() << "Ref SensorType: " << sensorType;
    qDebug() << "Ref SensorSN: "   << sensorSN;

    rsnrpz_GetSensorInfo(this->g_Session, CHANNEL_Z85, sensorName, sensorType, sensorSN);
    qDebug() << "Meas SensorName: " << sensorName;
    qDebug() << "Meas SensorType: " << sensorType;
    qDebug() << "Meas SensorSN: "   << sensorSN;

    qint32 progress_bar_step = 1;//qRound(((this->max_frequency - this->min_frequency) * 0.01) /1E6);
    qint32 progress_bar_state = 0;

    qDebug() << "Start...";

    this->SetPowerGenerator(8, this->min_frequency, POWER_SETUP);

    QVector<double> calibration_table;
    for (qint64 currect_frequency = this->min_frequency;
                currect_frequency <= this->max_frequency;
                currect_frequency += this->step_frequency)
    {

        scpi_cmd = ":FREQ " + QString::number(currect_frequency) + " Hz\n"; // set currect frequency
        generator_socket->write(scpi_cmd.toLocal8Bit());
        generator_socket->waitForBytesWritten();

        QThread::currentThread()->msleep(10);

        this->SetPowerGenerator(8, currect_frequency, POWER_CORRECTION);

//----------------------------------------------------------------------------------------------------------------------------------------------------------
        ViBoolean measComplete = VI_FALSE;
        ViReal64 result;
        qint32 timeout = 0;
        double reference_power;

        rsnrpz_chan_setCorrectionFrequency(this->ref_Session, CHANNEL_18T, currect_frequency);
        QThread::currentThread()->msleep(20);

//        ViInt32 err_code = 0;
//        ViChar _VI_FAR errorMessage[128];
//        while (err_code != 0)
//            rsnrpz_error_query (this->ref_Session, &err_code, errorMessage);

        rsnrpz_chans_initiate(this->ref_Session);

        do
        {
            rsnrpz_chan_isMeasurementComplete(this->ref_Session, CHANNEL_18T, &measComplete);
            QThread::currentThread()->msleep(100);
            timeout++;
        } while (!measComplete && timeout <= 30);


        qint32 timeout_18t = timeout;
        rsnrpz_meass_fetchMeasurement(this->ref_Session, CHANNEL_18T, &result);
    //        rsnrpz_meass_readMeasurement(this->ref_Session, 1, 30, &result);

        reference_power = 10 * log(fabs(result)) / log(10.0) + 30.0;

//----------------------------------------------------------------------------------------------------------------------------------------------------------
        double measurer_power;

        measComplete = VI_FALSE;
        timeout = 0;

        rsnrpz_chan_setCorrectionFrequency(this->g_Session, CHANNEL_Z85, currect_frequency);
        QThread::currentThread()->msleep(10);

//        while (err_code != 0)
//            rsnrpz_error_query (this->ref_Session, &err_code, errorMessage);

        rsnrpz_chans_initiate(this->g_Session);

        do
        {
            rsnrpz_chan_isMeasurementComplete(this->g_Session, CHANNEL_Z85, &measComplete);
            QThread::currentThread()->msleep(100);
            timeout++;
        } while (!measComplete && timeout <= 30);

        qint32 timeout_z85 = timeout;


        rsnrpz_meass_fetchMeasurement(this->g_Session, CHANNEL_Z85, &result);
    //        rsnrpz_meass_readMeasurement(this->ref_Session, 1, 30, &result);

        measurer_power = 10 * log(fabs(result)) / log(10.0) + 30.0;
//----------------------------------------------------------------------------------------------------------------------------------------------------------

        qDebug() << fixed << qSetRealNumberPrecision(5) << "FREQ: " << currect_frequency/1000000000.0
                 << "GHz\tPower 18T: " << reference_power << " dBm [" << timeout_18t << "]"
                 << " Power SMB100A: " << this->current_generator_power << " dBm";

//        calibration_table.append(reference_power - measurer_power);

        progress_bar_state += progress_bar_step;

        emit OnUpdateProgressBar(progress_bar_state);
    }



    if (size_waveguide == SIZE_35x15)
    {
        QString calibration_file_title = "CALIBRATION DATA 35x15 " + QTime::currentTime().toString();
        QFile calibration_file(QDir::currentPath() + "/calibration_file/CAL_DATA.cd");
        calibration_file.open(QFile::WriteOnly);
        QDataStream calibration_stream(&calibration_file);

        for (qint32 i = 0; i < calibration_table.size(); i++)
            calibration_stream << calibration_table.at(i);

        calibration_file.close();
    }
    else
        if (size_waveguide == SIZE_285x126)
    {
            QString calibration_file_title = "CALIBRATION DATA 28.5x12.6 " + QTime::currentTime().toString();
            QFile calibration_file(QDir::currentPath() + "/calibration_file/CAL_DATA.cd");
            calibration_file.open(QFile::WriteOnly);
            QDataStream calibration_stream(&calibration_file);

            for (qint32 i = 0; i < calibration_table.size(); i++)
                calibration_stream << calibration_table.at(i);

            calibration_file.close();
    }

    scpi_cmd = ":OUTP OFF\n";
    generator_socket->write(scpi_cmd.toLocal8Bit());
    generator_socket->waitForBytesWritten();
    qDebug() << "SCPI: " << scpi_cmd;

    generator_socket->close();
    rsnrpz_close(this->ref_Session);
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
