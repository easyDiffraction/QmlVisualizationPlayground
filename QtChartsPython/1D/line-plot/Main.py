import os
import sys
import random
from PySide2.QtCore import QUrl, Qt
from PySide2.QtGui import QStandardItem, QStandardItemModel
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

if __name__ == '__main__':
    # create application
    app = QApplication(sys.argv)

    # load qml
    engine = QQmlApplicationEngine(QUrl.fromLocalFile(os.path.join(os.path.dirname(sys.argv[0]), "Main.qml")))

    # create model for plot
    nMax = 200
    lineModel = QStandardItemModel(nMax+1, 2) # nMax+1 rows and 2 columns
    for row in range(lineModel.rowCount()):
        item1 = QStandardItem()
        item1.setData(row/nMax, Qt.DisplayRole)
        item2 = QStandardItem()
        item2.setData(random.random(), Qt.DisplayRole)
        lineModel.setItem(row, 0, item1)
        lineModel.setItem(row, 1, item2)

    # register model for access from qml
    engine.rootContext().setContextProperty("lineModel", lineModel);

    # ensure that the QML was loaded by checking if a root object was created
    if not engine.rootObjects():
        sys.exit(-1)

    # close the program after the Qt Event loop is over
    sys.exit(app.exec_())
