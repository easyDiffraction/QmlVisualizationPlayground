import QtQuick 2.13
import QtQuick.Window 2.13
import QtDataVisualization 1.13

Window {
    visible: true
    width: 1000
    height: 800

    property int xMax: 15
    property int yMax: 10

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

    Surface3D {
        anchors.fill: parent

        theme: Theme3D {
            type: Theme3D.ThemeQt

            ambientLightStrength: 1
            lightStrength: 0

            gridEnabled: true
            gridLineColor: "grey"

            labelBorderEnabled: false
            //labelBackgroundEnabled: false
            labelTextColor: "black"

            backgroundEnabled: false
            windowColor: "white"

            font.pointSize: 32
        }

        axisX: ValueAxis3D {
            title: "x coordinate"
            titleVisible: true
            labelFormat: "%i"
        }

        axisY: ValueAxis3D {
            title: "Counts"
            titleVisible: true
        }

        axisZ: ValueAxis3D {
            title: "y coordinate"
            titleVisible: true
            labelFormat: "%i"
        }

        scene.activeCamera.cameraPreset: Camera3D.CameraPresetIsometricLeftHigh

        Surface3DSeries {
            baseGradient: viridisGradient
            colorStyle: Theme3D.ColorStyleRangeGradient
            drawMode: Surface3DSeries.DrawSurface

            ItemModelSurfaceDataProxy {
                itemModel: ListModel { id: dataModel }
                columnRole: "x"
                rowRole: "y"
                yPosRole: "intensity"
            }
        }
    }

    Component.onCompleted: {
        for (let j = 0; j <= yMax; j++) {
            for (let i = 0; i <= xMax; i++) {
                dataModel.append({ x: i, y: j, intensity: Math.random() })
            }
        }
    }

}


