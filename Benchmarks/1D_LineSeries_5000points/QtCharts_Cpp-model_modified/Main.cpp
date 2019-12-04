#include <QApplication>
#include <QDebug>
#include <QRandomGenerator>
#include <QStandardItemModel>
#include <QTime>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "datasource.h"

int main(int argc, char *argv[])
{
    // create application
    QApplication app(argc, argv);

    // create qml engine
    QQmlApplicationEngine engine;
    engine.load("qrc:Main.qml");

    // get time for benchmarking
    QTime time;
    time.start();

    // create data source object
    DataSource dataSource;

    // register model for access from qml and load main qml
    engine.rootContext()->setContextProperty("dataSource", &dataSource);

    // benchmarking
    qDebug() << "Performance:" << time.elapsed() << "ms";

    // ensure that the QML was loaded by checking if a root object was created
    if (engine.rootObjects().isEmpty())
        return -1;

    // Qt Event loop
    return app.exec();
}
