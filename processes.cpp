#include "processes.h"
#include <QtDebug>

Processes::Processes(QObject *parent) : QAbstractListModel(parent)
{

}

QList<Proc*> Processes::GetProcesses(){
     return this->proceses;
}

QHash<int, QByteArray> Processes::roleNames() const {
    QHash<int, QByteArray> roles;

    roles[ProcessesRoles::PidRole] = "pid";
    roles[ProcessesRoles::NameRole] = "name";
    roles[ProcessesRoles::StateRole] = "state";
    return roles;
}

void Processes::Dammy(QList<QObject*> s){

}

void Processes::AddProcess(std::string pid, std::string name, std::string state){
    Proc *proc = new Proc(QString::fromStdString(pid), QString::fromStdString(name), QString::fromStdString(state));
    proceses.append(proc);
}

int Processes::rowCount(const QModelIndex &parent) const
{
    return proceses.count();
}

QVariant Processes::data(const QModelIndex &index, int role) const
{
    if (!hasIndex(index.row(), index.column(), index.parent()))
               return {};

           const Proc *item = proceses.at(index.row());

           if (role == ProcessesRoles::NameRole) return QVariant::fromValue(item->GetName());
           if (role == ProcessesRoles::PidRole) return QVariant::fromValue(item->GetPid());
           if (role == ProcessesRoles::StateRole) return QVariant::fromValue(item->GetState());

    return {};
}

//STRANGE CODE
#define PROC_DIRECTORY "/proc/"

int IsNumeric(const char* ccharptr_CharacterList)
{
    for ( ; *ccharptr_CharacterList; ccharptr_CharacterList++)
        if (*ccharptr_CharacterList < '0' || *ccharptr_CharacterList > '9')
            return 0; // false
    return 1; // true
}

std::string getProcessName(const std::string& fileContent){
    //[\\:\\(\\.\\+\\w\\d\\)/_-]
    std::regex regular("Name:[\\s\\t]*(.+)\\n");
    std::cmatch math;
    if (std::regex_search (fileContent.c_str(), math, regular)) {
        return math[1];
    }
    return "invalid name";
}

std::string getProcessState(const std::string& fileContent){
    //State:	S (sleeping)
    std::regex regular("State:[\\s\\t]*\\b([\\w]+)\\b.*(\\(.+\\))");
    std::cmatch math;
    while (std::regex_search (fileContent.c_str(), math, regular)) {
        return math[1].str() + " " + math[2].str();
    }
    std::cout << fileContent << std::endl;

    return "invalid state";
}


void Processes::Update(){
    struct dirent* dirEntity = NULL ;
    DIR* dir_proc = NULL ;

    dir_proc = opendir(PROC_DIRECTORY) ;
    if (dir_proc == NULL)
    {
        std::cout << "Couldn't open the directory" << std::endl;
    }

    while ((dirEntity = readdir(dir_proc)) != 0) {
        if (dirEntity->d_type == DT_DIR) {
            if (IsNumeric(dirEntity->d_name)) {
                std::string path = std::string(PROC_DIRECTORY) + dirEntity->d_name + "/status";

                std::ifstream cmdLineFile(path.c_str());
                std::stringstream fileContent;
                std::string statusLine;

                if (cmdLineFile.is_open()) {
                    while (std::getline(cmdLineFile, statusLine)){
                        fileContent << statusLine << std::endl;
                    }
                }

                std::string nameProcess = getProcessName(fileContent.str());
                std::string statusProcess = getProcessState(fileContent.str());


                AddProcess(dirEntity->d_name, nameProcess, statusProcess);

                fileContent.clear();
                cmdLineFile.close();
            }
        }
    }
    closedir(dir_proc);
}
