#include "processdump.h"

#include <iostream>
#include <algorithm>
#include <string>

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

//regular for find 1 byte in oct from dump
int ProcessDump::searchChaneOfBytes(const QString chane){
    std::string ch = getChane();
    if (ch.empty()){
        std::cout << "chane invalid" << std::endl;
        return -1;
    }


    int amauntBytesInChane = chane.count() / (16 + 7);
    unsigned int amauntSpaces = static_cast<unsigned int>(((16 + 7) * amauntBytesInChane));

    std::string sub = chane.toStdString();
    int count = 0;
    for(size_t i = ch.find (sub); i != std::string::npos; i = ch.find (sub, i + amauntSpaces))
    {
        ++count;
    }


    return count;
}

std::string ProcessDump::getChane(){
    std::regex reg("((?:(?:\\w|\\d){2}\\s)+(?!\\s)(?:\\w|\\d){2})");
    std::cmatch math;

    auto d = dumpProcess.split("\n");
    std::stringstream buf;
    std::string str = dumpProcess.toStdString().c_str();
    const char *c_str = NULL;
    for (int i = 0; i < d.length(); ++i){

        c_str = d[i].toLatin1().data();

        while (std::regex_search (c_str, math, reg)) {
                /*for(std::cmatch::iterator it = math.cbegin(); it != math.cend();  ++it, ij++){
                    buf << *it << " " << ij << "\n";
                }*/
                buf <<  math[1] << " ";
                c_str = math.suffix().first;
        }
    }

    return buf.rdbuf()->str();;
}

