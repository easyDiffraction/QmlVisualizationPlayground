import QtQuick 2.0
import QtDataVisualization 1.3

Scatter3D {
    property real a: 4.25678
    property real b: a
    property real c: 10.63388

    // Visuallization settings
    theme: Theme3D {
        type: Theme3D.ThemePrimaryColors
        gridEnabled: false
    }
    shadowQuality: AbstractGraph3D.ShadowQualityNone

    // Camera view settings
    orthoProjection: false
    scene.activeCamera.xRotation: 60.0
    scene.activeCamera.yRotation: 20.0

    // Axes settings
    axisX: ValueAxis3D { labelFormat: "" }
    axisY: ValueAxis3D { labelFormat: "" }
    axisZ: ValueAxis3D { labelFormat: "" }

    // Unit cell box as many sphere scatters attached together
    Scatter3DSeries {
        mesh: Abstract3DSeries.MeshSphere
        itemSize: 0.03
        colorStyle: Theme3D.ColorStyleUniform
        baseColor: "grey"
        ItemModelScatterDataProxy {
            itemModel: ListModel { id: cellBox }
            xPosRole: "x"
            yPosRole: "y"
            zPosRole: "z"
        }
    }

    // Atom as sphere scatters
    Scatter3DSeries {
        mesh: Abstract3DSeries.MeshSphere
        itemSize: 0.65
        colorStyle: Theme3D.ColorStyleUniform
        baseColor: "steelblue"
        ItemModelScatterDataProxy {
            itemModel: ListModel { id: atomPositions }
            xPosRole: "x"
            yPosRole: "y"
            zPosRole: "z"
        }
    }

    // Add data to the models created above
    Component.onCompleted: {
        const n = 1000
        for (let i = 0; i <= n; i++) {
            cellBox.append({ x: i/n*a, y: 0.0*b, z: 0.0*c })
            cellBox.append({ x: i/n*a, y: 1.0*b, z: 0.0*c })
            cellBox.append({ x: i/n*a, y: 0.0*b, z: 1.0*c })
            cellBox.append({ x: i/n*a, y: 1.0*b, z: 1.0*c })
            cellBox.append({ x: 0.0*a, y: i/n*b, z: 0.0*c })
            cellBox.append({ x: 1.0*a, y: i/n*b, z: 0.0*c })
            cellBox.append({ x: 0.0*a, y: i/n*b, z: 1.0*c })
            cellBox.append({ x: 1.0*a, y: i/n*b, z: 1.0*c })
            cellBox.append({ x: 0.0*a, y: 0.0*b, z: i/n*c })
            cellBox.append({ x: 1.0*a, y: 0.0*b, z: i/n*c })
            cellBox.append({ x: 0.0*a, y: 1.0*b, z: i/n*c })
            cellBox.append({ x: 1.0*a, y: 1.0*b, z: i/n*c })
        }
        atomPositions.append({ x: 0.0*a, y: 0.0*b, z: 0.0*c })
        atomPositions.append({ x: 1.0*a, y: 0.0*b, z: 0.0*c })
        atomPositions.append({ x: 0.0*a, y: 1.0*b, z: 0.0*c })
        atomPositions.append({ x: 1.0*a, y: 1.0*b, z: 0.0*c })
        atomPositions.append({ x: 0.5*a, y: 0.5*b, z: 0.5*c })
        atomPositions.append({ x: 0.0*a, y: 0.0*b, z: 1.0*c })
        atomPositions.append({ x: 1.0*a, y: 0.0*b, z: 1.0*c })
        atomPositions.append({ x: 0.0*a, y: 1.0*b, z: 1.0*c })
        atomPositions.append({ x: 1.0*a, y: 1.0*b, z: 1.0*c })
    }

}







