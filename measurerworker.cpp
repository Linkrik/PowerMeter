#include "measurerworker.h"

MeasurerWorker::MeasurerWorker(Measurer measurer)
{
    this->measurer = &measurer;
}

MeasurerWorker::~MeasurerWorker()
{
    if (measurer != NULL)
        delete measurer;
}

void MeasurerWorker::process()
{
    this->measurer->GetPower();
    emit finished();
}
