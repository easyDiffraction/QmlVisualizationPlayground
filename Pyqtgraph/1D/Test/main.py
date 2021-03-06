import os
import sys
from PySide2 import QtGui
from PySide2 import QtCore
from PySide2 import QtDeclarative
import numpy as np
import pyqtgraph as pg

class Graph (QtDeclarative.QDeclarativeItem):
    def __init__(self, parent = None):
        QtDeclarative.QDeclarativeItem.__init__(self, parent)

        #----------- self.setFlag(QtGui.QGraphicsItem.ItemHasNoContents, False )


        self.dataPlot = np.cos(np.linspace(0, 5 *np.pi , 1000))

        self.graph = pg.PlotItem()
        self.graph.plot( self.dataPlot, pen=(0,255,0))
        self.graph.showGrid(x=True, y=True)


        self.view = pg.GraphicsView()
        self.view.setCentralItem(self.graph)
        #-------------------------------------- self.setCentralWidget(self.view)

        mProxy = QtGui.QGraphicsProxyWidget(self)
        mProxy.setWidget(self.view)


if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)

    QtDeclarative.qmlRegisterType(Graph, 'myPyQtGraph', 1, 0, 'PyQtGraph')

    view = QtDeclarative.QDeclarativeView()
    view.setSource(QtCore.QUrl('main.qml'))
    view.setResizeMode(QtDeclarative.QDeclarativeView.SizeRootObjectToView)

    rootObject = view.rootObject()
    view.connect(view.engine() , QtCore.SIGNAL('quit()') ,app.instance( ) , QtCore.SLOT('quit()') )

    view.show()
    sys.exit(app.exec_())
