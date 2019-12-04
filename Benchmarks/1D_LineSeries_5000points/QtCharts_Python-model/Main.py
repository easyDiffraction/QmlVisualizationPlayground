import os
import sys
import random
from datetime import datetime
from PySide2.QtCore import QUrl, Qt
from PySide2.QtGui import QStandardItem, QStandardItemModel
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

if __name__ == '__main__':
    # get time for benchmarking
    timeNow = datetime.now()

    # create application
    app = QApplication(sys.argv)

    # load qml
    engine = QQmlApplicationEngine(QUrl.fromLocalFile(os.path.join(os.path.dirname(sys.argv[0]), "Main.qml")))

    # create model for plot
    print("1:", datetime.now() - timeNow)
    nMax = 5000
    dataModel = QStandardItemModel(nMax+1, 2) # nMax+1 rows and 2 columns
    dataModel.blockSignals(True)
    for row in range(dataModel.rowCount()):
        item1 = QStandardItem()
        item2 = QStandardItem()
        item1.setData(row/nMax, Qt.DisplayRole)
        item2.setData(random.random(), Qt.DisplayRole)
        dataModel.setItem(row, 0, item1)
        dataModel.setItem(row, 1, item2)
    dataModel.blockSignals(False)
    dataModel.layoutChanged.emit()
    print("2:", datetime.now() - timeNow)

    # register model for access from qml
    engine.rootContext().setContextProperty("dataModel", dataModel);

    # benchmarking
    print("Performance:", datetime.now() - timeNow)

    # ensure that the QML was loaded by checking if a root object was created
    if not engine.rootObjects():
        sys.exit(-1)

    # close the program after the Qt Event loop is over
    sys.exit(app.exec_())
