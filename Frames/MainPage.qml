import QtQuick
import QtQuick.Controls.Basic
import "../Components"
import QtQuick.Layouts

Page {
    Background {
        anchors.fill: parent
        z: -1
    }
    Header {
        titleText: "График уравнения с модульной и степенной функцией"
    }

        property real a: 0
        property real b: 1
        property real c: 1
            RowLayout {
                anchors.fill: parent
                spacing: 20
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    leftMargin: 20
                    rightMargin: 20
                    topMargin: 150
                    bottomMargin: 20
                    // левая панель с ползунками
                }
                    Rectangle {
                        Layout.preferredWidth: 280
                        Layout.alignment: Qt.AlignTop
                        radius: 18
                        color: "#1E2F5A"
                        border.width: 1
                        border.color: "#2A3F73"

                        implicitHeight: sliderPanel.implicitHeight + 40

                        Column {
                            id: sliderPanel
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 22

                            Text {
                                text: "Параметры"
                                color: "#C7D8FF"
                                font.pixelSize: 24
                                font.bold: true
                            }

                            Column {
                                spacing: 10
                                Text {
                                    text: "Функция"
                                    color: "#C7D8FF"
                                    font.pixelSize: 18
                                    font.bold: true
                                }
                                Text {
                                    text: "f(x) = {\n" +
                                          "  |x + a|,        x < 0\n" +
                                          "  b·x² - 1,       0 ≤ x < 2\n" +
                                          "  c / (x - 2),    x > 2\n" +
                                          "}"
                                    color: "#F4F8FF"
                                    font.pixelSize: 15
                                    font.family: "Consolas"
                                }
                            }

                            Column {
                                spacing: 8

                                Text {
                                    text: "a = " + a.toFixed(2)
                                    color: "#9FB0D0"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Slider {
                                    id: sliderA
                                    width: 240
                                    from: -5
                                    to: 5
                                    value: 0

                                    onValueChanged: {
                                        a = value
                                        canvas.requestPaint()
                                    }

                                    background: Rectangle {
                                        x: sliderA.leftPadding
                                        y: sliderA.topPadding + sliderA.availableHeight / 2 - height / 2
                                        width: sliderA.availableWidth
                                        height: 8
                                        radius: 4
                                        color: "#162445"

                                        Rectangle {
                                            width: sliderA.visualPosition * parent.width
                                            height: parent.height
                                            radius: 4
                                            color: "#4C78D1"
                                        }
                                    }

                                    handle: Rectangle {
                                        x: sliderA.leftPadding + sliderA.visualPosition * (sliderA.availableWidth - width)
                                        y: sliderA.topPadding + sliderA.availableHeight / 2 - height / 2
                                        width: 20
                                        height: 20
                                        radius: 10
                                        color: sliderA.pressed ? "#EAF1FF" : "#C7D8FF"
                                        border.width: 2
                                        border.color: "#4C78D1"
                                    }
                                }
                            }

                            Column {
                                spacing: 8

                                Text {
                                    text: "b = " + b.toFixed(2)
                                    color: "#9FB0D0"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Slider {
                                    id: sliderB
                                    width: 240
                                    from: -3
                                    to: 3
                                    value: 1

                                    onValueChanged: {
                                        b = value
                                        canvas.requestPaint()
                                    }

                                    background: Rectangle {
                                        x: sliderB.leftPadding
                                        y: sliderB.topPadding + sliderB.availableHeight / 2 - height / 2
                                        width: sliderB.availableWidth
                                        height: 8
                                        radius: 4
                                        color: "#162445"

                                        Rectangle {
                                            width: sliderB.visualPosition * parent.width
                                            height: parent.height
                                            radius: 4
                                            color: "#4C78D1"
                                        }
                                    }

                                    handle: Rectangle {
                                        x: sliderB.leftPadding + sliderB.visualPosition * (sliderB.availableWidth - width)
                                        y: sliderB.topPadding + sliderB.availableHeight / 2 - height / 2
                                        width: 20
                                        height: 20
                                        radius: 10
                                        color: sliderB.pressed ? "#EAF1FF" : "#C7D8FF"
                                        border.width: 2
                                        border.color: "#4C78D1"
                                    }
                                }
                            }

                            Column {
                                spacing: 8

                                Text {
                                    text: "c = " + c.toFixed(2)
                                    color: "#9FB0D0"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Slider {
                                    id: sliderC
                                    width: 240
                                    from: -5
                                    to: 5
                                    value: 1

                                    onValueChanged: {
                                        c = value
                                        canvas.requestPaint()
                                    }

                                    background: Rectangle {
                                        x: sliderC.leftPadding
                                        y: sliderC.topPadding + sliderC.availableHeight / 2 - height / 2
                                        width: sliderC.availableWidth
                                        height: 8
                                        radius: 4
                                        color: "#162445"

                                        Rectangle {
                                            width: sliderC.visualPosition * parent.width
                                            height: parent.height
                                            radius: 4
                                            color: "#4C78D1"
                                        }
                                    }

                                    handle: Rectangle {
                                        x: sliderC.leftPadding + sliderC.visualPosition * (sliderC.availableWidth - width)
                                        y: sliderC.topPadding + sliderC.availableHeight / 2 - height / 2
                                        width: 20
                                        height: 20
                                        radius: 10
                                        color: sliderC.pressed ? "#EAF1FF" : "#C7D8FF"
                                        border.width: 2
                                        border.color: "#4C78D1"
                                    }
                                }
                            }
                        }
                    }

                // график
                Canvas {
                    id: canvas
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    property real xMin: -6
                    property real xMax: 8
                    property real yMin: -6
                    property real yMax: 8

                    function toScreenX(x) {
                        return (x - xMin) / (xMax - xMin) * width
                    }

                    function toScreenY(y) {
                        return height - (y - yMin) / (yMax - yMin) * height
                    }

                    function drawAxes(ctx) {
                        ctx.strokeStyle = "#9FB0D0"
                        ctx.lineWidth = 1

                        ctx.beginPath()
                        ctx.moveTo(0, toScreenY(0))
                        ctx.lineTo(width, toScreenY(0))
                        ctx.stroke()

                        ctx.beginPath()
                        ctx.moveTo(toScreenX(0), 0)
                        ctx.lineTo(toScreenX(0), height)
                        ctx.stroke()
                    }

                    function drawPart(ctx, func, startX, endX, step, color) {
                        let first = true
                        ctx.beginPath()
                        ctx.strokeStyle = color
                        ctx.lineWidth = 3

                        for (let x = startX; x <= endX; x += step) {
                            let y = func(x)
                            if (!isFinite(y))
                                continue

                            let sx = toScreenX(x)
                            let sy = toScreenY(y)

                            if (first) {
                                ctx.moveTo(sx, sy)
                                first = false
                            } else {
                                ctx.lineTo(sx, sy)
                            }
                        }

                        ctx.stroke()
                    }

                    onPaint: {
                        let ctx = getContext("2d")
                        ctx.reset()

                        ctx.fillStyle = "#10182d"
                        ctx.fillRect(0, 0, width, height)

                        drawAxes(ctx)

                        // x < 0
                        drawPart(ctx,
                            function(x) { return Math.abs(x + a) },
                            xMin, -0.01, 0.02, "#4C78D1"
                        )

                        // 0 <= x < 2
                        drawPart(ctx,
                            function(x) { return b * x * x - 1 },
                            0, 1.99, 0.02, "#7C9CFF"
                        )

                        // x > 2
                        drawPart(ctx,
                            function(x) { return c / (x - 2) },
                            2.05, xMax, 0.01, "#06B6D4"
                        )
                    }

                    Component.onCompleted: requestPaint()
                }
            }
}
