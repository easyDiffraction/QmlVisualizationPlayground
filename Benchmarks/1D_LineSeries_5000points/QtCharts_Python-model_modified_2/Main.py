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
        self._upperSeries = []
        self._lowerSeries = []
        self._fitSeries = []
        self._initSeries()

    def _initSeries(self):
        path = os.path.join(sys.path[0], 'data.txt')
        with open(path, "r") as f:
            content = f.readlines()
        for line in content:
            chars = line.split()
            numbers = [float(n) for n in chars]
            x = numbers[0]
            y = numbers[1]
            sy = 3*numbers[2]
            self._upperSeries.append(QPointF(x, y + sy))
            self._lowerSeries.append(QPointF(x, y - sy))
            self._fitSeries.append(QPointF(x, y))

    @Slot(QtCharts.QXYSeries)
    def setUpperSeries(self, series):
        series.replace(self._upperSeries)

    @Slot(QtCharts.QXYSeries)
    def setLowerSeries(self, series):
        series.replace(self._lowerSeries)

    @Slot(QtCharts.QXYSeries)
    def setFitSeries(self, series):
        series.replace(self._fitSeries)

    @Slot(QtCharts.QXYSeries)
    def updateFitSeries(self, series):
        s = []
        shift = (random.random() - 0.5) * 5
        for point in self._fitSeries:
            x = point.x() + shift
            y = point.y() + (random.random() - 0.5) * 50
            s.append(QPointF(x, y))
        series.replace(s)

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
