#ifndef MEASURERWORKER_H
#define MEASURERWORKER_H

#include <QObject>

#include "measurer.h"

class MeasurerWorker : public QObject
{
    Q_OBJECT
public:
    MeasurerWorker(Measurer measurer);
    ~MeasurerWorker();

public slots:
    void process();

signals:
    void finished();

private:
    Measurer *measurer;

};

#endif // MEASURERWORKER_H
