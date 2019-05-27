import QtQuick 2.0
import QtCharts 2.0

ChartView {
    width: 400
    height: 330
    antialiasing: true
    legend.visible: false
    title: "A 1D line plot with error bars (v.1)"

    property int nMax: 50

    ValueAxis {
        id: commonAxisX
        titleText: "Some x label [m]"
        min: 0
        max: nMax
    }

    ValueAxis {
        id: commonAxisY
        titleText: "A fancy y label [kg]"
        min: 0
        max: 1
    }

    LineSeries {
        id: dataPoints
        useOpenGL: true
        axisX: commonAxisX
        axisY: commonAxisY
    }

    BoxPlotSeries {
        id: errorBars
        useOpenGL: true
        axisX: commonAxisX
        axisY: commonAxisY
    }

    Component.onCompleted: {
        for (let i = 0; i < nMax; i++) {
            let y = Math.random()
            let e = 0.1*Math.random()
            errorBars.append(i, [y-e, y, y, y, y+e])
            dataPoints.append(i, y)
        }
        //commonAxisX.applyNiceNumbers()
        //commonAxisY.applyNiceNumbers()
    }

}
