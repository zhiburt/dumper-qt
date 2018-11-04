#include "backend.h"
#include "processes.h"
#include "proc.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");

    //qmlRegisterType<Processes>("io.qt.processes.proc", 1, 0, "Processes");
    //qmlRegisterType<Proc>("io.qt.processes.proc", 1, 0, "Proc");

    QQmlApplicationEngine engine;

    Processes processes;
    processes.Update();

    engine.rootContext()->setContextProperty(QStringLiteral("processes"),  &processes);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
