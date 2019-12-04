import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.3

Window {
    visible: true
    width: 600
    height: 730

    property bool useOGL: true

    ColumnLayout {
        anchors.fill: parent

        ChartView { Layout.fillWidth: true; Layout.fillHeight: true; legend.visible: false
            antialiasing: true
            ValueAxis { id: axis; min: 0; max: 1 }
            LineSeries{ axisX: axis; axisY: axis; useOpenGL: useOGL; VXYModelMapper { model: proxy.model; xColumn: 0; yColumn: 1 } }
        }

        ChartView { Layout.fillWidth: true; Layout.fillHeight: true; legend.visible: false
            antialiasing: true
            ValueAxis { id: axis2; min: 0; max: 1 }
            LineSeries{ axisX: axis2; axisY: axis2; useOpenGL: useOGL; VXYModelMapper { model: proxy.model; xColumn: 0; yColumn: 2 } }
            LineSeries{ axisX: axis2; axisY: axis2; useOpenGL: useOGL; VXYModelMapper { model: proxy.model; xColumn: 0; yColumn: 3 } }
        }

        Button {
            property string txt: "setItem element by element: "
            text: txt
            onClicked: { const speed = proxy.randomizeViaSetItemElementByElement(); text = txt + speed }
        }

        Button {
            property string txt: "seItem element by element (with manual layoutChanged signal): "
            text: txt
            onClicked: { const speed = proxy.randomizeViaSetItemElementByElementWithManualLayoutChangedSignal(); text = txt + speed }
        }

        Button {
            property string txt: "setData element by element: "
            text: txt
            onClicked: { const speed = proxy.randomizeViaSetDataElementByElement(); text = txt + speed }
        }

        Button {
            property string txt: "setData element by element (with manual layoutChanged signal): "
            text: txt
            onClicked: { const speed = proxy.randomizeViaSetDataElementByElementWithManualLayoutChangedSignal(); text = txt + speed }
        }

        Button {
            property string txt: "appendRow: "
            text: txt
            onClicked: { const speed = proxy.randomizeViaAppendRowByRow(); text = txt + speed }
        }

        Button {
            property string txt: "appendColumn: "
            text: txt
            onClicked: { const speed = proxy.randomizeViaAppendColumnByColumn(); text = txt + speed }
        }

        Button {
            property string txt: "appendColumn (with manual layoutChanged signal): "
            text: txt
            onClicked: { const speed = proxy.randomizeViaAppendColumnByColumnWithManualLayoutChangedSignal(); text = txt + speed }
        }

    }


}
