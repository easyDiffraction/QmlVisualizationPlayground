import os
import sys
import random
from datetime import datetime
import logging
logging.basicConfig(format="%(asctime)-15s [%(levelname)s] %(filename)s %(funcName)s [%(lineno)d]: %(message)s", level=logging.INFO)

from PySide2.QtCore import QUrl, Qt, QObject, Signal, Slot, Property
from PySide2.QtGui import QStandardItem, QStandardItemModel
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

class Proxy(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._max_row_count = 300
        self._max_column_count = 4
        self._model = QStandardItemModel(self._max_row_count, self._max_column_count)
        for colum_index in range(self._max_column_count):
            for row_index in range(self._max_row_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                self._model.setItem(row_index, colum_index, item)

    @Slot(result=str)
    def randomizeViaSetItemElementByElement(self):
        start_time = datetime.now()
        for colum_index in range(self._max_column_count):
            for row_index in range(self._max_row_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                self._model.setItem(row_index, colum_index, item)
        end_time = datetime.now()
        return str(end_time - start_time)

    @Slot(result=str)
    def randomizeViaSetItemElementByElementWithManualLayoutChangedSignal(self):
        start_time = datetime.now()
        self._model.blockSignals(True)
        for colum_index in range(self._max_column_count):
            for row_index in range(self._max_row_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                self._model.setItem(row_index, colum_index, item)
        self._model.blockSignals(False)
        self._model.layoutChanged.emit()
        end_time = datetime.now()
        return str(end_time - start_time)


    @Slot(result=str)
    def randomizeViaSetDataElementByElementWithManualLayoutChangedSignal(self):
        start_time = datetime.now()
        self._model.blockSignals(True)
        for colum_index in range(self._max_column_count):
            for row_index in range(self._max_row_count):
                index = self._model.index(row_index, colum_index)
                self._model.setData(index, random.random(), Qt.DisplayRole)
        self._model.blockSignals(False)
        self._model.layoutChanged.emit()
        end_time = datetime.now()
        return str(end_time - start_time)

    @Slot(result=str)
    def randomizeViaSetDataElementByElement(self):
        start_time = datetime.now()
        for colum_index in range(self._max_column_count):
            for row_index in range(self._max_row_count):
                index = self._model.index(row_index, colum_index)
                self._model.setData(index, random.random(), Qt.DisplayRole)
        end_time = datetime.now()
        return str(end_time - start_time)

    @Slot(result=str)
    def randomizeViaAppendRowByRow(self):
        start_time = datetime.now()
        self._model.setRowCount(0)
        for row_index in range(self._max_row_count):
            row = []
            for colum_index in range(self._max_column_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                row.append(item)
            self._model.appendRow(row)
        end_time = datetime.now()
        return str(end_time - start_time)

    @Slot(result=str)
    def randomizeViaAppendColumnByColumn(self):
        start_time = datetime.now()
        self._model.setColumnCount(0)
        #self._model.clear() # slow!
        for colum_index in range(self._max_column_count):
            column = []
            for row_index in range(self._max_row_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                column.append(item)
            self._model.appendColumn(column)
        end_time = datetime.now()
        return str(end_time - start_time)

    @Slot(result=str)
    def randomizeViaAppendColumnByColumnWithManualLayoutChangedSignal(self):
        start_time = datetime.now()
        self._model.blockSignals(True)
        self._model.setColumnCount(0)
        for colum_index in range(self._max_column_count):
            column = []
            for row_index in range(self._max_row_count):
                item = QStandardItem()
                item.setData(random.random(), Qt.DisplayRole)
                column.append(item)
            self._model.appendColumn(column)
        self._model.blockSignals(False)
        self._model.layoutChanged.emit()
        end_time = datetime.now()
        return str(end_time - start_time)

    model = Property('QVariant', lambda self: self._model)

if __name__ == '__main__':
    app = QApplication(sys.argv)

    proxy = Proxy()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("proxy", proxy);
    engine.load(QUrl.fromLocalFile(os.path.join(os.path.dirname(sys.argv[0]), "Main.qml")))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
