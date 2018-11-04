#ifndef PROC_H
#define PROC_H

#include <QObject>

class Proc
{
    //Q_OBJECT
    //Q_PROPERTY(QString pid READ GetPid WRITE Dammy NOTIFY dammy_1)
    //Q_PROPERTY(QString name READ GetName WRITE Dammy NOTIFY dammy_2)
    //Q_PROPERTY(QString state READ GetState WRITE Dammy NOTIFY dammy_3)

public:
    //explicit Proc(QObject *parent = nullptr);
    Proc(const QString &pid, const QString &name, const QString &state);
    void SetProc(const QString &pid, const QString &name, const QString &state);
    QString GetPid() const;
    QString GetName() const;
    QString GetState() const;

    void Dammy(QString s);


//signals:
  //  void dammy_1();
    //void dammy_2();
    //void dammy_3();

private:
    QString pid;
    QString name;
    QString state;

};

#endif // PROC_H
