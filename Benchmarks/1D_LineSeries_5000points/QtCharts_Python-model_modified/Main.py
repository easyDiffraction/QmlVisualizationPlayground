import os
import sys
import random
from datetime import datetime
from PySide2.QtCore import QUrl, QPointF, Qt, QObject, Signal, Slot
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication
from PySide2.QtCharts import QtCharts

#https://stackoverflow.com/questions/55257134/how-can-i-change-all-the-points-in-an-xyseries-in-qml-or-pyside2

class DataSource(QObject):
    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._serie = None

    def generateData(self, row_count):
        self._serie = []
        for row in range(row_count):
            x = row / row_count
            y = random.random()
            self._serie.append(QPointF(x, y))

    @Slot(QtCharts.QXYSeries, int)
    def init(self, serie, row_count):
        self.generateData(row_count)
        serie.replace(self._serie)

    @Slot(QtCharts.QXYSeries)
    def update(self, serie):
        row_count = serie.count()
        self.generateData(row_count)
        serie.replace(self._serie)

if __name__ == '__main__':
    # get time for benchmarking
    timeNow = datetime.now()

    # create application
    app = QApplication(sys.argv)

    # create engine
    engine = QQmlApplicationEngine()

    # create data source object
    dataSource = DataSource()

    # register model for access from qml
    engine.rootContext().setContextProperty("dataSource", dataSource)

    # load qml
    engine.load(QUrl.fromLocalFile(os.path.join(os.path.dirname(sys.argv[0]), "Main.qml")))

    # benchmarking
    print("Performance:", datetime.now() - timeNow)

    # ensure that the QML was loaded by checking if a root object was created
    if not engine.rootObjects():
        sys.exit(-1)

    # close the program after the Qt Event loop is over
    sys.exit(app.exec_())
