import QtQuick 2.0
import QtCharts 2.0

Item {
    width: 400
    height: 330

    property var timeNow: Date.now()

    Item {
        Component.onCompleted: {
            console.log("Performance:", Date.now() - timeNow, "ms")
        }
    }

    ChartView {
        anchors.fill: parent
        legend.visible: false

        LineSeries {
            id: dataPoints
            //useOpenGL: true
        }

        Component.onCompleted: {
            const nMax = 5000
            for (let i = 0; i < nMax; i++) {
                dataPoints.append(i/nMax, Math.random())
            }
        }

    }

}

