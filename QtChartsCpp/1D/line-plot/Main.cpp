#include <QApplication>
#include <QRandomGenerator>
#include <QStandardItemModel>
#include <QQmlApplicationEngine>
#include <QQmlContext>

//https://stackoverflow.com/questions/48687705/how-to-use-the-vxymodelmapper-with-qstandarditemmodel

int main(int argc, char *argv[])
{
    // create application
    QApplication app(argc, argv);

    // load qml
    QQmlApplicationEngine engine("qrc:Main.qml");
    
    // create model for plot
    int nMax = 5000;
    QStandardItemModel dataModel(nMax+1, 2); // nMax+1 rows and 2 columns
    for (int row = 0; row < dataModel.rowCount(); ++row) {
        auto item1 = new QStandardItem();
        auto item2 = new QStandardItem();
        QStandardItem item3;
        item1->setData(row/qreal(nMax), Qt::DisplayRole);
        item2->setData(QRandomGenerator::global()->generateDouble(), Qt::DisplayRole);
        dataModel.setItem(row, 0, item1);
        dataModel.setItem(row, 1, item2);
    }

    // register model for access from qml and load main qml
    engine.rootContext()->setContextProperty("dataModel", &dataModel);

    // ensure that the QML was loaded by checking if a root object was created
    if (engine.rootObjects().isEmpty())
        return -1;

    // Qt Event loop
    return app.exec();
}
