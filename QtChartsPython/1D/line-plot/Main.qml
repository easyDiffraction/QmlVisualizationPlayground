import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 400
    height: 300

    ChartView {
        anchors.fill: parent
        antialiasing: true
        legend.visible: false

        LineSeries{
            id: line
        }

        VXYModelMapper {
            model: lineModel // QStandardItemModel in C++ (or PySide2)
            series: line
            firstRow: 0
            xColumn: 0
            yColumn: 1
        }
    }
}
