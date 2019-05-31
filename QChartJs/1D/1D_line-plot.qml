import QtQuick 2.0

import "QChart.js" as Charts
import "QChartData.js" as ChartsData

Rectangle {
    width: 650
    height: 500

    Item {
        anchors.fill: parent
        anchors.margins: 50

        Chart {
            id: chart_line
            anchors.fill: parent
            chartType: Charts.ChartType.LINE
            chartAnimated: false

            //chartData: ChartsData.ChartLineData

            Component.onCompleted: {
                let l = []
                let d = []
                const nMax = 30
                for (let i = 0; i < nMax; i++) {
                    l.push(i)
                    d.push(Math.random())
                }

                chartData = {
                    labels: l,
                    datasets: [{
                            strokeColor: "coral",
                            data: d
                        }]
                }

                chartOptions = {
                    scaleShowGridLines: false,
                    bezierCurve: false,
                    pointDot: false,
                    datasetStrokeWidth: 1,
                    datasetFill: false
                }
            }


        }

    }

}
