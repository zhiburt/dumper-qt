#ifndef PROCESSDUMP_H
#define PROCESSDUMP_H

#include <QObject>
#include <QString>
#include <regex>

class ProcessDump : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString dump READ getDump WRITE setPid NOTIFY dumpChanged)


public:
    explicit ProcessDump(QObject *parent = nullptr);

    Q_INVOKABLE void get(const QString &pid, int settingsAddresses, int settingsContent);
    QString getDump();
    void setPid(const QString &pid);
    Q_INVOKABLE int searchChaneOfBytes(const QString chane);

signals:
    void dumpChanged();

protected:
    std::string getChane();

private:
    QString dumpProcess;
};



#endif // PROCESSDUMP_H
