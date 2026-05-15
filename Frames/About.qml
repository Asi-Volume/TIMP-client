import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    id: functionInfoPage
    anchors.fill: parent

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#070b16" }
            GradientStop { position: 0.35; color: "#0e1630" }
            GradientStop { position: 0.70; color: "#101a3a" }
            GradientStop { position: 1.0; color: "#050811" }
        }

        Rectangle {
            width: 520; height: 520; radius: width / 2
            color: "#7c3aed"; opacity: 0.10
            x: -130; y: -120
        }

        Rectangle {
            width: 420; height: 420; radius: width / 2
            color: "#06b6d4"; opacity: 0.11
            x: parent.width - width - 60; y: 80
        }

        Rectangle {
            width: 360; height: 360; radius: width / 2
            color: "#2563eb"; opacity: 0.08
            x: parent.width / 2 - 40; y: parent.height - 220
        }

        Rectangle {
            anchors.fill: parent
            color: "#030712"; opacity: 0.18
        }
    }

    Label {
        id: titleText
        text: "Анализ Функции"
        font.letterSpacing: 2
        color: "#C7D8FF"
        font.pixelSize: 34
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 48
    }

    Rectangle {
        anchors.top: titleText.bottom
        anchors.bottom: closeButton.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 36
        anchors.topMargin: 24
        anchors.bottomMargin: 24
        radius: 12
        color: "#1E2F5A"
        border.width: 1
        border.color: "#2A3F73"

        ScrollView {
            anchors.fill: parent
            anchors.margins: 24
            clip: true

            ColumnLayout {
                width: parent.width - 48
                spacing: 20

                Rectangle {
                                    Layout.fillWidth: true
                                    height: 160
                                    color: "#162445"
                                    radius: 8
                                    border.width: 1
                                    border.color: "#3B5EA8"

                                    Column {
                                        anchors.centerIn: parent
                                        spacing: 6

                                        Text {
                                            text: "f(x) = {"
                                            color: "#6B92E8"
                                            font.family: "Courier New"
                                            font.pixelSize: 20
                                            font.bold: true
                                        }


                                        GridLayout {
                                            anchors.left: parent.left
                                            anchors.leftMargin: 36
                                            columns: 2
                                            columnSpacing: 40
                                            rowSpacing: 8


                                            Text { text: "|x + a|,"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }
                                            Text { text: "x < 0"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }

                                            Text { text: "b·x² - 1,"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }
                                            Text { text: "0 ≤ x < 2"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }

                                            Text { text: "c / (x - 2),"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }
                                            Text { text: "x > 2"; color: "#6B92E8"; font.family: "Courier New"; font.pixelSize: 20; font.bold: true }
                                        }

                                        Text {
                                            text: "}"
                                            color: "#6B92E8"
                                            font.family: "Courier New"
                                            font.pixelSize: 20
                                            font.bold: true
                                        }
                                    }
                                }

                Text {
                    Layout.fillWidth: true
                    text: "Что это за функция?"
                    color: "#C7D8FF"
                    font.pixelSize: 22
                    font.bold: true
                }

                Text {
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                    lineHeight: 1.4
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    text: "Это кусочно-заданная функция. Её график состоит из трёх разных частей, каждая из которых существует только на своём отрезке оси X:\n\n" +
                          "• Интервал x < 0: График функции модуля |x + a|. Визуально представляет собой V-образную «галочку».\n\n" +
                          "• Интервал 0 ≤ x < 2: График параболы b·x² - 1. Классическая кривая, сдвинутая вниз по оси Y.\n\n" +
                          "• Интервал x > 2: График гиперболы c / (x - 2). Имеет вертикальную асимптоту (разрыв) в точке x = 2.\n\n" +
                          "Внимание: В самой точке x = 2 функция не определена (там находится пустота/разрыв), так как строгие неравенства не включают двойку."
                }
            }
        }
    }

    Button {
        id: closeButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 48
        text: "Перейти к графику"
        focusPolicy: Qt.NoFocus
        hoverEnabled: true

        contentItem: Text {
            text: closeButton.text
            color: "#F4F8FF"
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            topPadding: 2
            leftPadding: 25
            rightPadding: 25
            bottomPadding: 2
        }

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 45
            radius: 20
            color: closeButton.down ? "#2F4E8E" : closeButton.hovered ? "#4C78D1" : "#3B5EA8"
            border.width: 1
            border.color: closeButton.hovered ? "#6B92E8" : "#3B5EA8"
        }

        onClicked: {
            stackView.push('MainPage.qml')
        }
    }
}
