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
        titleText: "Регистрация"
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 36
        spacing: 18
        Rectangle {
            radius: 12
            implicitWidth: content.childrenRect.width + 40
            implicitHeight: content.childrenRect.height + 30
            Layout.alignment: Qt.AlignHCenter
            color: "#1E2F5A"
            Column {
                id: content
                anchors.centerIn: parent
                spacing: 14
                Text {
                    text: "Логин"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: loginField
                    placeholderText: "Введите email"
                    color: "#F4F8FF"
                    placeholderTextColor: "#7F93B8"
                    width: 400
                    leftPadding: 10
                    topPadding: 10
                    bottomPadding: 10
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 12
                        color: "#162445"
                        border.width: 1
                        border.color: loginField.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Text {
                    text: "Пароль"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: passwordField
                    placeholderText: "Введите пароль"
                    color: "#F4F8FF"
                    placeholderTextColor: "#7F93B8"
                    width: 400
                    leftPadding: 10
                    topPadding: 10
                    bottomPadding: 10
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 12
                        color: "#162445"
                        border.width: 1
                        border.color: passwordField.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Text {
                    text: "Повтор пароля"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: passwordField2
                    placeholderText: "Повторите пароль"
                    color: "#F4F8FF"
                    placeholderTextColor: "#7F93B8"
                    width: 400
                    leftPadding: 10
                    topPadding: 10
                    bottomPadding: 10
                    font.pixelSize: 16

                    background: Rectangle {
                        radius: 12
                        color: "#162445"
                        border.width: 1
                        border.color: passwordField2.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Buttons {
                    buttonText: "Зарегистрироваться"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "У меня уже есть аккаунт"
                    font.pixelSize: 12
                    font.bold: true
                    color: mouseArea.containsMouse ? "#4C78D1" : "#9FB0D0"
                    MouseArea {
                           id: mouseArea
                           anchors.fill: parent
                           hoverEnabled: true
                           cursorShape: Qt.PointingHandCursor

                           onClicked: {
                               stackView.pop()
                           }
                       }
                }
            }
        }
    }
}
