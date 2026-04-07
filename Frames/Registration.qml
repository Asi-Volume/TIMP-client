import QtQuick
import QtQuick.Controls.Basic

Page {
    Background {
        anchors.fill: parent
        z: -1
    }
    Column {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 48
        spacing: 8

        Label {
            text: "Регистрация"
            color: "#C7D8FF"
            font.pixelSize: 34
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
