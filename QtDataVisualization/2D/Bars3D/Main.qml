import QtQuick 2.13
import QtQuick.Window 2.13
import QtDataVisualization 1.13

Window {
    visible: true
    width: 1000
    height: 700

    property int nMax: 100
    property int mMax: 50

    ColorGradient {
        id: viridisGradient
        ColorGradientStop { position: 0.00; color: "#440154" }
        ColorGradientStop { position: 0.05; color: "#481567" }
        ColorGradientStop { position: 0.10; color: "#482677" }
        ColorGradientStop { position: 0.15; color: "#453781" }
        ColorGradientStop { position: 0.20; color: "#404788" }
        ColorGradientStop { position: 0.25; color: "#39568C" }
        ColorGradientStop { position: 0.30; color: "#33638D" }
        ColorGradientStop { position: 0.35; color: "#2D708E" }
        ColorGradientStop { position: 0.40; color: "#287D8E" }
        ColorGradientStop { position: 0.45; color: "#238A8D" }
        ColorGradientStop { position: 0.50; color: "#1F968B" }
        ColorGradientStop { position: 0.55; color: "#20A387" }
        ColorGradientStop { position: 0.60; color: "#29AF7F" }
        ColorGradientStop { position: 0.65; color: "#3CBB75" }
        ColorGradientStop { position: 0.70; color: "#55C667" }
        ColorGradientStop { position: 0.75; color: "#73D055" }
        ColorGradientStop { position: 0.80; color: "#95D840" }
        ColorGradientStop { position: 0.85; color: "#B8DE29" }
        ColorGradientStop { position: 0.90; color: "#DCE319" }
        ColorGradientStop { position: 1.00; color: "#FDE725" }
    }

    Bars3D {
        anchors.fill: parent
        //height: parent.height
        //width: parent.width * 3 / 4

        barSpacingRelative: true
        barSpacing: Qt.size(0.0, 0.0)

        theme: Theme3D {
            type: Theme3D.ThemeQt

            ambientLightStrength: 1
            lightStrength: 0

            labelBorderEnabled: false
            labelBackgroundEnabled: false
            labelTextColor: "black"

            backgroundEnabled: false
            windowColor: "white"
        }

        columnAxis: CategoryAxis3D {
            title: "x coordinate"
            titleVisible: true
            labels: [""]
        }

        rowAxis: CategoryAxis3D {
            title: "y coordinate"
            titleVisible: true
            labels: [""]
        }

        valueAxis: ValueAxis3D {
            title: "Counts"
            titleVisible: true
        }

        orthoProjection: true
        scene.activeCamera.cameraPreset: Camera3D.CameraPresetDirectlyAbove

        Bar3DSeries {
            baseGradient: viridisGradient
            colorStyle: Theme3D.ColorStyleRangeGradient

            ItemModelBarDataProxy {
                itemModel: ListModel { id: dataModel }
                columnRole: "x"
                rowRole: "y"
                valueRole: "intensity"
            }
        }
    }

    Component.onCompleted: {
        for (let i = 0; i <= nMax; i++) {
            for (let j = 0; j <= mMax; j++) {
                dataModel.append({ x: i, y: j, intensity: Math.random() })
            }
        }
    }

    /*
    Rectangle {
        id: legend
        //anchors.margins: 20
        //anchors.bottom: parent.bottom
        //anchors.top: buttonLayout.bottom
        //anchors.right: parent.right

        height: parent.height / 2
        width: parent.width * 1 / 4

        border.color: "black"
        border.width: 1
        //width: 50
        rotation: 180
        gradient: Gradient {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.2; color: "red" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 0.8; color: "yellow" }
            GradientStop { position: 1.0; color: "white" }
        }
    }
    */

}


