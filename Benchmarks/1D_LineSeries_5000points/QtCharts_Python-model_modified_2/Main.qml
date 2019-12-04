import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 900
    height: 700

    property int nMax: 3000

    ChartView {
        id: chartView

        height: parent.height - 50
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        legend.visible: false
        antialiasing: enabled

        animationDuration: 1000
        ////animationEasingCurve: Easing.OutInBack
        animationOptions: ChartView.SeriesAnimations

        ValueAxis {
            id: axisX
            min: 10
            max: 154
        }

        ValueAxis {
            id: axisY
            min: 0
            max: 1500
        }

        AreaSeries {
            axisX: axisX
            axisY: axisY
            borderColor: "coral"
            borderWidth: 1
            color: "coral"
            opacity: 0.5
            //useOpenGL: true // breaks animation
            upperSeries: LineSeries {
                id: upperLineSeries
            }
            lowerSeries: LineSeries {
                id: lowerLineSeries
            }
        }

        LineSeries {
            id: fitSeries
            axisX: axisX
            axisY: axisY
            color: "steelblue"
            //useOpenGL: true // breaks animation
        }

        Component.onCompleted: {
            //dataSource.init(dataPoints, nMax)
            dataSource.setUpperSeries(upperLineSeries)
            dataSource.setLowerSeries(lowerLineSeries)
            dataSource.setFitSeries(fitSeries)
        }
    }

    Button {
        anchors.top: chartView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        text: "Update chart data"

        onClicked: {
            dataSource.updateFitSeries(fitSeries)
        }
    }

}
