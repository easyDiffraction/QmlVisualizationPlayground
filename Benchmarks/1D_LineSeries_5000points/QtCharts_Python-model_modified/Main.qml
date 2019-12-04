import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 900
    height: 330

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
            min: 0
            max: 1
        }

        ValueAxis {
            id: axisY
            min: -0.2
            max: 1.2
        }

        /*
        LineSeries {
            id: dataPoints
            axisX: axisX
            axisY: axisY
            //useOpenGL: true // breaks animation
        }
        */

        AreaSeries {
            axisX: axisX
            axisY: axisY
            borderColor: "transparent"
            //borderWidth: 0.001
            //useOpenGL: true // breaks animation
            upperSeries: LineSeries {
                id: upperLineSeries
            }
            lowerSeries: LineSeries {
                id: lowerLineSeries
            }
        }

        Component.onCompleted: {
            //dataSource.init(dataPoints, nMax)
            dataSource.init(upperLineSeries, nMax)
            dataSource.init(lowerLineSeries, nMax)
        }
    }

    Button {
        anchors.top: chartView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        text: "Update chart data"

        onClicked: {
            //dataSource.update(dataPoints)
            dataSource.update(upperLineSeries)
            dataSource.update(lowerLineSeries)
        }
    }

}
