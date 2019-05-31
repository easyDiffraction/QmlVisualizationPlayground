import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 400
    height: 330

    ChartView {
        anchors.fill: parent
        legend.visible: false

        LineSeries{
            id: dataPoints
            //useOpenGL: true
        }

        VXYModelMapper {
            model: dataModel // QStandardItemModel in C++ (or PySide2)
            series: dataPoints
            firstRow: 0
            xColumn: 0
            yColumn: 1
        }
    }
}
