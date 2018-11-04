#include "proc.h"

void Proc::SetProc(const QString& pid, const QString& name, const QString& state)
{
    this->pid = pid;
    this->name = name;
    this->state =  state;
}

Proc::Proc(const QString &pid, const QString &name, const QString &state) :  pid(pid), name(name), state(state)
{

}

void Proc::Dammy(QString s){

}

QString Proc::GetName() const{
    return name;
}

QString Proc::GetPid() const{
    return pid;
}

QString Proc::GetState() const{
    return state;
}

