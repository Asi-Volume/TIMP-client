import QtQuick
import project
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    property string email: ""
    Background {
        anchors.fill: parent
        z: -1
    }
    Header {
        titleText: "Отправлен код подтверждения на вашу почту"
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
                Rectangle {
                    id: errorh
                    radius: 12
                    width: parent.width
                    height: 40
                    Layout.alignment: Qt.AlignHCenter
                    color: "#3A1F2A"
                    border.width: 0.2
                    border.color: "#D95763"
                    visible: false
                    Row {
                        anchors.centerIn: parent
                        spacing: 10

                        Rectangle {
                            width: 24
                            height: 24
                            radius: width / 2
                            border.width: 1
                            border.color: "#FFD7DB"
                            color: "#3A1F2A"

                            Text {
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: -1
                                color: "#FFD7DB"
                                text: "!"
                                font.pixelSize: 16
                                font.bold: true
                            }
                        }
                        Text {
                            id: errorhText
                            font.pixelSize: 16
                            font.bold: true
                            color: "#FFD7DB"
                            text: "Вы ввели неверные данные!"
                        }
                    }
                }
                Text {
                    text: "Введите ваш код подтверждения"
                    color: "#C7D8FF"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: loginField
                    placeholderText: "например: 3501204123"
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
                    text: "Новый пароль"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: passwordField
                    placeholderText: "Введите новый пароль"
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
                    echoMode: TextInput.Password

                    background: Rectangle {
                        radius: 12
                        color: "#162445"
                        border.width: 1
                        border.color: passwordField2.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Buttons {
                    buttonText: "Продолжить"
                    onClicked: {
                        Backend.codemail(email, loginField.text, passwordField.text, passwordField2.text)
                    }
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Я помню пароль"
                    font.pixelSize: 12
                    font.bold: true
                    color: mouseArea.containsMouse ? "#4C78D1" : "#9FB0D0"
                    MouseArea {
                           id: mouseArea
                           anchors.fill: parent
                           hoverEnabled: true
                           cursorShape: Qt.PointingHandCursor

                           onClicked: {
                               stackView.pop(null)
                           }
                       }
                }
            }
        }
    }
    Connections {
        target: Backend
        function onErrorOccurred(message) {
            errorh.visible = true
            errorhText.text = message
        }
        function onRecoverPassword() {
            stackView.pop(null)
        }
    }
}
