import QtQuick 2.6
import QtQuick.Window 2.2

import "Chart.bundle.js" as Chart

Window {
    id:qmlwindow
    visible: true
    width: 400
    height: 400
    title: qsTr("Pie Chart")

    Canvas {
        id: canvas
        width: 400
        height: 400

        onPaint: {
            // Get drawing context
            var context = getContext("2d");

            var myChart = new Chart.Chart()

            /*
            var myChart = new Chart(context, {
              type: 'bar',
              data: {
                labels: ["M", "T", "W", "T", "F", "S", "S"],
                datasets: [{
                  label: 'apples',
                  backgroundColor: "rgba(153,255,51,1)",
                  data: [12, 19, 3, 17, 28, 24, 7],
                }, {
                  label: 'oranges',
                  backgroundColor: "rgba(255,153,0,1)",
                  data: [30, 29, 5, 5, 20, 3, 10],
                }]
              }
            });
            myChart.draw();
            */
        }
    }
}
