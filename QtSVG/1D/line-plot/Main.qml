import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Shapes 1.13

//https://doc.qt.io/qt-5/qml-qtquick-shapes-shapepath.html

Item {
    property real axesWidth: 800
    property real axesHeight: 500
    property real axesMargins: 20

    width: axes.width + 2*axesMargins
    height: axesHeight + 2*axesMargins

    function getFileContent (fileName) {
        const xhr = new XMLHttpRequest
        xhr.open("GET", fileName, false)
        xhr.send()
        return xhr.responseText
    }

    function getColumn (fileContent, columnIndex, skipLines = 0) {
        const rows = fileContent.split("\n")
        let out = []
        for (let i = skipLines; i < rows.length-1; i++) {
            out.push(rows[i].trim().split(/\s+/)[columnIndex])
        }
        return out
    }

    function getMin (array) {
        return Math.min(...array)
    }

    function getMax (array) {
        return Math.max(...array)
    }

    function myPath() {
        const fileContent = getFileContent("cecual.txt")
        const xArray = getColumn(fileContent, 0, 1)
        const yArray = getColumn(fileContent, 2, 1)
        const xMin = getMin(xArray)
        const xMax = getMax(xArray)
        const yMin = getMin(yArray)
        const yMax = getMax(yArray)

        //console.log(`X ${xArray[0]} ${yArray[0]}`)

        let xArrayTransformed = []
        let yArrayTransformed = []
        for (let i = 0; i < xArray.length; i++) {
            const x = (xArray[i] - xMin) / (xMax - xMin) * axesWidth
            const y = (yArray[i] - yMin) / (yMax - yMin) * axesHeight
            xArrayTransformed.push(x)
            yArrayTransformed.push(axesHeight - y)
        }

        const xFirst = xArrayTransformed[0]
        const yFirst = yArrayTransformed[0]
        let p = `M ${xFirst} ${yFirst}`

        for (let j = 0; j < xArrayTransformed.length; j++) {
            const x = xArrayTransformed[j]
            const y = yArrayTransformed[j]
            p += ` L ${x} ${y}`
        }

        //console.log(p)
        return p

    }

    Shape {
        id: axes

        width: axesWidth
        height: axesHeight
        anchors.centerIn: parent

        //antialiasing: true
        //smooth: true

        ShapePath {
            strokeWidth: 2
            strokeColor: "coral"
            strokeStyle: ShapePath.SolidLine
            capStyle: ShapePath.RoundCap

            PathSvg { path: myPath() }

            //startX: 20
            //startY: 20

            //pathElements: [PathLine { x: 180; y: 130 }, PathLine { x: 20; y: 130 }]
            //PathLine { x: 180; y: 130 }
            //PathLine { x: 20; y: 130 }
        }

    }

}
