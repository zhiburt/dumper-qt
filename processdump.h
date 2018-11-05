#ifndef PROCESSDUMP_H
#define PROCESSDUMP_H

#include <QObject>
#include <QString>

class ProcessDump : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString dump READ getDump WRITE setPid NOTIFY dumpChanged)


public:
    explicit ProcessDump(QObject *parent = nullptr);

    Q_INVOKABLE void get(const QString &pid);
    QString getDump();
    void setPid(const QString &pid);


signals:
    void dumpChanged();

private:
    QString dumpProcess;
};



#endif // PROCESSDUMP_H
