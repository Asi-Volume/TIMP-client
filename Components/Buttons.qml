import QtQuick
import QtQuick.Controls.Basic

    Button {
        property alias buttonText: buttonText.text
        anchors.horizontalCenter: parent.horizontalCenter
        id: buttonText
        text: "Войти"
        focusPolicy: Qt.NoFocus
        contentItem: Text {
                text: buttonText.text
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
        hoverEnabled: true

        background: Rectangle {
            implicitWidth: 0
            implicitHeight: 45
            radius: 20
            color: buttonText.down ? "#2F4E8E"
                          : buttonText.hovered ? "#4C78D1"
                          : "#3B5EA8"
            border.width: 1
                    border.color: buttonText.hovered ? "#6B92E8" : "#3B5EA8"
        }
    }
