import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 900
    height: 330

    property int nMax: 20

    ChartView {
        id: chartView

        height: parent.height - 50
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        legend.visible: false
        //antialiasing: enabled

        animationDuration: 1000
        //animationEasingCurve: Easing.OutInBack
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

        LineSeries {
            id: dataPoints
            axisX: axisX
            axisY: axisY
            //useOpenGL: true // breaks animation
        }

        Component.onCompleted: {
            dataSource.update(dataPoints, nMax);
        }
    }

    Button {
        anchors.top: chartView.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        text: "Update chart data"

        onClicked: {
            dataSource.update(dataPoints);
        }
    }

}
