import QtQuick 2.13
import QtQuick.Window 2.13
//import QtDataVisualization 1.13
import QtQuick.Shapes 1.13
//https://doc.qt.io/qt-5/qml-qtquick-shapes-shapepath.html

Item {
    width: 400
    height: 300

    Shape {
        id: axes
        anchors.centerIn: parent

        //antialiasing: true
        //smooth: true

        ShapePath {
            strokeWidth: 2
            strokeColor: "coral"
            strokeStyle: ShapePath.SolidLine
            capStyle: ShapePath.RoundCap

            startX: 20
            startY: 20

            //pathElements: [PathLine { x: 180; y: 130 }, PathLine { x: 20; y: 130 }]
            PathLine { x: 180; y: 130 }
            PathLine { x: 20; y: 130 }
        }

    }

}


