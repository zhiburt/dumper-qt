#ifndef PROCESSES_H
#define PROCESSES_H

#include <QObject>
#include <QAbstractListModel>

#include <proc.h>

#include <unistd.h>
#include <dirent.h>
#include <sys/types.h> // for opendir(), readdir(), closedir()
#include <sys/stat.h> // for stat()

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <regex>


class Processes : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ProcessesRoles {
            PidRole = Qt::UserRole + 1,
            NameRole,
            StateRole
        };

    Processes(QObject *parent = nullptr);
    Processes(const Processes& other);
    QList<Proc*> GetProcesses();
    void Update();

    Q_INVOKABLE void update();

    QHash<int, QByteArray> roleNames() const;

    void Dammy(QList<QObject*> s);

protected:
    void AddProcess(std::string pid, std::string name, std::string state);

private:
    QList<Proc*> proceses;

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;


signals:
    void processesChanged();
};


#endif // PROCESSES_H
