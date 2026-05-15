import QtQuick
import QtQuick.Controls.Basic
import "../Components"
import QtQuick.Layouts
import project

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
                    text: "Почта"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: email
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
                        border.color: email.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Text {
                    text: "Логин"
                    color: "#9FB0D0"
                    font.pixelSize: 16
                    font.bold: true
                }
                TextField {
                    id: login
                    placeholderText: "Введите логин"
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
                        border.color: login.activeFocus ? "#5C84FF" : "#2A3F73"
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
                    echoMode: TextInput.Password

                    background: Rectangle {
                        radius: 12
                        color: "#162445"
                        border.width: 1
                        border.color: passwordField2.activeFocus ? "#5C84FF" : "#2A3F73"
                    }
                }
                Buttons {
                    buttonText: "Зарегистрироваться"
                    onClicked: {
                        Backend.registrations(email.text, login.text, passwordField.text, passwordField2.text)
                    }
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "У меня уже есть аккаунт"
                    font.pixelSize: 12
                    font.bold: true
                    color: mouseAreas.containsMouse ? "#4C78D1" : "#9FB0D0"
                    MouseArea {
                           id: mouseAreas
                           anchors.fill: parent
                           hoverEnabled: true
                           cursorShape: Qt.PointingHandCursor

                           onClicked: {
                               errors.visible = false
                               errorh.visible = false
                               errorhText.text = ""
                               errorsText.text = ""
                               stackView.pop()
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
        function onRegistration() {
            stackView.pop()
        }
    }
}
