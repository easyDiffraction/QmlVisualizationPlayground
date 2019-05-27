import QtQuick 2.0
import QtCharts 2.0

ChartView {
    width: 400
    height: 330
    antialiasing: true
    legend.visible: false
    title: "A 1D line plot"

    property int nMax: 50

    LineSeries {
        id: dataPoints
        useOpenGL: true
        axisX: ValueAxis {
            titleText: "Some x label [m]"
            min: 0
            max: nMax
        }
        axisY: ValueAxis {
            id: commonAxisY
            titleText: "A fancy y label [kg]"
            min: 0
            max: 1
        }
    }

    Component.onCompleted: {
        for (let i = 0; i < nMax; i++) {
            dataPoints.append(i, Math.random())
        }
    }

}
