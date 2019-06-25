import QtQuick 2.0

import "."
import "QMLChartData.js" as ChartsData
import "QChartJsTypes.js" as ChartTypes

Rectangle {
    width: 650
    height: 500

    Item {
        anchors.fill: parent
        anchors.margins: 50

        QChartJs {
            id: chart_line
            anchors.fill: parent
            chartType: ChartTypes.QChartJSTypes.LINE
            //chartData: ChartsData.ChartLineData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;


            //chartData: ChartsData.ChartLineData

            /*
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
            */


        }

    }

}
