import QtQuick 2.0
import QtCharts 2.0

Item {
    width: 600
    height: 400

    ChartView {
        anchors.fill: parent
        legend.visible: false

        LineSeries {
            id: dataPoints
        }

        Component.onCompleted: {
            const startTime = Date.now()

            for (let i = 0, nMax = 2000; i < nMax; i++) {
                dataPoints.append(i/nMax, Math.random())
            }

            print("Duration:", Date.now() - startTime, "ms")
        }

    }

}

