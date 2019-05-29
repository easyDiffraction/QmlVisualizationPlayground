import numpy as np

content = """import QtQuick 2.0
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

            XYPoint { x: 0; y: 0 }
        }

    }

}
"""

s = ""
for x in range(5000):
    #y = np.random.rand()
    s += "XYPoint { x: " + str(x) + "; y: " + str(x) + " }\n\t\t\t"

content = content.replace("XYPoint { x: 0; y: 0 }", s)

with open("1D_line-plot_5000-points-with-XYPoint_int-data.qml", 'w') as f:
    f.write(content)
