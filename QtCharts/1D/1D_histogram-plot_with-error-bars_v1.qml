import QtQuick 2.0
import QtCharts 2.0

ChartView {
    width: 500
    height: 330
    antialiasing: true
    legend.visible: false
    title: "A 1D histogram plot with error bars (v.1)"

    property int nMax: 30

    ValueAxis {
        id: commonAxisX
        titleText: "Some x label [m]"
        min: -0.5
        max: nMax-0.5
    }

    ValueAxis {
        id: commonAxisY
        titleText: "A fancy y label [kg]"
        min: 0
        max: 1
    }

    AreaSeries {
        axisX: commonAxisX
        axisY: commonAxisY
        borderWidth: 0.01
        upperSeries: LineSeries { id: bars }
    }

    LineSeries {
        id: errors
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
        let array = []
        for (let i = 0; i < nMax; i++) {
            let y = Math.random()
            let e = 0.1*Math.random()
            bars.append(i-0.5, 0)
            bars.append(i-0.5, y)
            bars.append(i+0.5, y)
            bars.append(i+0.5, 0)
            errorBars.append(i, [y-e, y, y, y, y+e])
        }
    }
}

