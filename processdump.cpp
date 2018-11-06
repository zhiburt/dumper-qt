#include "processdump.h"

#include <iostream>

extern "C" char* getDumpCann(int pid, int addrrType, int scnTp);
extern "C" void getShortAddress(const char* line, unsigned long *x1, unsigned long *x2);

ProcessDump::ProcessDump(QObject *parent) :
    QObject(parent)
{

}



void  ProcessDump::get(const QString &pidStr,  int settingsAddresses, int settingsContent){
    dumpProcess = "";
    emit dumpChanged();

    int i = pidStr.toInt();
    auto r = getDumpCann(i, settingsAddresses, settingsContent);
    std::cout << "I'VE DONE! WELL DONE!" << std::endl;

    if (r){
        dumpProcess = r;
    }else{
        dumpProcess = "You don't have permitions or something wrong happend :(";
        std::cout << "pid: " << i << std::endl;
        std::cout << "HELLO WORLD" << std::endl;
        std::cout << r << std::endl;

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

