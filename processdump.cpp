#include "processdump.h"

#include <iostream>

extern "C" char* getDumpCann(int pid, int addrrType, int scnTp);
extern "C" void getShortAddress(const char* line, unsigned long *x1, unsigned long *x2);

ProcessDump::ProcessDump(QObject *parent) :
    QObject(parent)
{

}



void  ProcessDump::get(const QString &pidStr){
    int i = pidStr.toInt();
    auto r = getDumpCann(i, 1, 1);
    std::cout << "I'VE DONE! WELL DONE!" << std::endl;
    if (r){
        dumpProcess = r;
    }else{
        dumpProcess = "You don't have permitions or something wrong happend :(";
    }

    emit dumpChanged();
}

QString ProcessDump::getDump(){
    return dumpProcess;
}

void ProcessDump::setPid(const QString &pid){
    dumpProcess = "2";

    emit dumpChanged();
}

