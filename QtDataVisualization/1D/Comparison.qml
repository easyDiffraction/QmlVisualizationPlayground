import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtDataVisualization 1.13

Window {
    visible: true
    width: 1400
    height: 600

    property int xMax: 1
    property int yMax: 20

    property bool is3D: false
    property bool isOrthoProjection: is3D ? false : true // ortho or perspective view
    property int cameraPreset: is3D ? Camera3D.CameraPresetLeftBelow : Camera3D.CameraPresetLeftBelow

    property int fontPointSize: 80

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

    GridLayout {
        anchors.fill: parent
        anchors.margins: 0
        rowSpacing: 0
        columnSpacing: 0
        columns: 3


        /////////
        // Titles
        /////////

        /*
        Repeater {
            model: ["Bars3D", "Surface3D", "Scatter3D"]
            Text { Layout.fillWidth: true; height: 20; text: modelData }
        }
        */

        ///////
        // Bars
        ///////

        Bars3D {
            ///visible: false
            //anchors.topMargin: -140
            Layout.fillWidth: true
            Layout.fillHeight: true

            barSpacingRelative: true
            barSpacing: Qt.size(0.0, 0.0)

            theme: Theme3D {
                type: Theme3D.ThemeQt

                ambientLightStrength: 1
                lightStrength: 0

                font.pointSize: fontPointSize

                labelBorderEnabled: false
                //labelBackgroundEnabled: false
                labelTextColor: "black"

                backgroundEnabled: false
                windowColor: "white"
            }

            columnAxis: CategoryAxis3D {
                title: "x coordinate"
                titleVisible: true
                //labels: [""]
            }

            rowAxis: CategoryAxis3D {
                title: "y coordinate"
                titleVisible: true
                //labels: ["", "1", "", "", "", 5]
            }

            valueAxis: ValueAxis3D {
                title: "Counts"
                titleVisible: true
            }

            orthoProjection: isOrthoProjection
            scene.activeCamera.cameraPreset: cameraPreset

            Bar3DSeries {
                ///colorStyle: Theme3D.ColorStyleUniform
                ///baseColor: "coral"
                colorStyle: Theme3D.ColorStyleRangeGradient
                baseGradient: viridisGradient

                ItemModelBarDataProxy {
                    itemModel: ListModel { id: barDataModel }
                    columnRole: "x"
                    rowRole: "y"
                    valueRole: "intensity"
                }
            }
        }

        //////////
        // Surface
        //////////

        Surface3D {
            ///visible: false
            //anchors.topMargin: -140
            Layout.fillWidth: true
            Layout.fillHeight: true

            theme: Theme3D {
                type: Theme3D.ThemeQt

                ambientLightStrength: 1
                lightStrength: 0

                gridEnabled: true
                gridLineColor: "grey"

                font.pointSize: fontPointSize

                labelBorderEnabled: false
                //labelBackgroundEnabled: false
                labelTextColor: "black"

                backgroundEnabled: false
                windowColor: "white"
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

            orthoProjection: isOrthoProjection
            scene.activeCamera.cameraPreset: cameraPreset

            Surface3DSeries {
                ///colorStyle: Theme3D.ColorStyleUniform
                ///baseColor: "coral"
                colorStyle: Theme3D.ColorStyleRangeGradient
                baseGradient: viridisGradient
                drawMode: Surface3DSeries.DrawWireframe
                ///drawMode: Surface3DSeries.DrawSurfaceAndWireframe
                ///drawMode: Surface3DSeries.DrawSurface

                ItemModelSurfaceDataProxy {
                    itemModel: ListModel { id: surfaceDataModel }
                    columnRole: "x"
                    rowRole: "y"
                    yPosRole: "intensity"
                }
            }
        }

        //////////
        // Scatter
        //////////

        Scatter3D {
            ///visible: false
            //anchors.topMargin: -140
            Layout.fillWidth: true
            Layout.fillHeight: true

            theme: Theme3D {
                type: Theme3D.ThemeQt

                ambientLightStrength: 1
                lightStrength: 0

                gridEnabled: true
                gridLineColor: "grey"

                font.pointSize: fontPointSize

                labelBorderEnabled: false
                //labelBackgroundEnabled: false
                labelTextColor: "black"

                backgroundEnabled: false
                windowColor: "white"
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

            orthoProjection: isOrthoProjection
            scene.activeCamera.cameraPreset: cameraPreset

            Scatter3DSeries {
                ///colorStyle: Theme3D.ColorStyleUniform
                ///baseColor: "coral"
                colorStyle: Theme3D.ColorStyleRangeGradient
                baseGradient: viridisGradient

                itemSize: 6 / Math.max(xMax, yMax)
                mesh: Abstract3DSeries.MeshCube

                ItemModelScatterDataProxy {
                    itemModel: ListModel { id: scatterDataModel }
                    xPosRole: "x"
                    yPosRole: "intensity"
                    zPosRole: "y"
                }
            }
        }



    }





    ///////////
    // Add data
    ///////////
    Component.onCompleted: {
        for (let j = 0; j <= yMax; j++) {
            for (let i = 0; i <= 2; i++) {
                const z = Math.sin(j)
                surfaceDataModel.append({ x: i, y: j, intensity: z })
                barDataModel.append({ x: i, y: j, intensity: z })
                scatterDataModel.append({ x: i, y: j, intensity: z })
            }
        }
    }

}




