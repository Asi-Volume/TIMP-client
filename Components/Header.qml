import QtQuick
import QtQuick.Controls.Basic

Column {
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 48
    spacing: 8
    property alias titleText: titleLabel.text

    Label {
        id: titleLabel
        font.letterSpacing: 2
        text: "Регистрация"
        color: "#C7D8FF"
        font.pixelSize: 34
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
