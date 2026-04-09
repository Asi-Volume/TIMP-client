import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import project

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: "Приложение для просмотра графика"
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage
        pushEnter: Transition {}
            pushExit: Transition {}
            popEnter: Transition {}
            popExit: Transition {}
            replaceEnter: Transition {}
            replaceExit: Transition {}
    }

    Rectangle {
        id: loginPage
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#070b16" }
            GradientStop { position: 0.35; color: "#0e1630" }
            GradientStop { position: 0.70; color: "#101a3a" }
            GradientStop { position: 1.0; color: "#050811" }
        }

        // фиолетовое пятно
        Rectangle {
            width: 520
            height: 520
            radius: width / 2
            color: "#7c3aed"
            opacity: 0.10
            x: -130
            y: -120
        }

        // голубое пятно
        Rectangle {
            width: 420
            height: 420
            radius: width / 2
            color: "#06b6d4"
            opacity: 0.11
            x: parent.width - width - 60
            y: 80
        }

        // синее нижнее пятно
        Rectangle {
            width: 360
            height: 360
            radius: width / 2
            color: "#2563eb"
            opacity: 0.08
            x: parent.width / 2 - 40
            y: parent.height - 220
        }

        // легкая затемняющая вуаль
        Rectangle {
            anchors.fill: parent
            color: "#030712"
            opacity: 0.18
        }


        Column {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 48
            spacing: 8

            Label {
                text: "Авторизация"
                font.letterSpacing: 2
                color: "#C7D8FF"
                font.pixelSize: 34
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
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
                        id: errors
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
                                id: errorsText
                                font.pixelSize: 16
                                font.bold: true
                                color: "#FFD7DB"
                                text: "Вы ввели неверные данные!"
                            }
                        }
                    }
                    Text {
                        text: "Логин"
                        color: "#9FB0D0"
                        font.pixelSize: 16
                        font.bold: true
                    }
                    TextField {
                        id: loginField
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
                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: loginButton
                        text: "Войти"
                        focusPolicy: Qt.NoFocus
                        contentItem: Text {
                                text: loginButton.text
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
                            color: loginButton.down ? "#2F4E8E"
                                          : loginButton.hovered ? "#4C78D1"
                                          : "#3B5EA8"
                            border.width: 1
                                    border.color: loginButton.hovered ? "#6B92E8" : "#3B5EA8"
                        }
                        onClicked: {
                            Backend.login(loginField.text, passwordField.text)
                        }
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "У вас еще нет аккаунта?"
                        font.pixelSize: 12
                        font.bold: true
                        color: mouseArea.containsMouse ? "#4C78D1" : "#9FB0D0"
                        MouseArea {
                               id: mouseArea
                               anchors.fill: parent
                               hoverEnabled: true
                               cursorShape: Qt.PointingHandCursor

                               onClicked: {
                                   errors.visible=false
                                   errorsText.text = ""
                                   stackView.push("Registration.qml")
                               }
                           }
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Забыли пароль?"
                        font.pixelSize: 12
                        font.bold: true
                        color: mouseArea1.containsMouse ? "#4C78D1" : "#9FB0D0"
                        MouseArea {
                               id: mouseArea1
                               anchors.fill: parent
                               hoverEnabled: true
                               cursorShape: Qt.PointingHandCursor

                               onClicked: {
                                   stackView.push("Forget.qml")
                               }
                           }
                    }
                }
            }
        }
    }
    Connections {
        target: Backend

        function onErrorOccurred(message) {
            errors.visible = true
            errorsText.text = message
        }

        function onLoginSucceeded() {
            errors.visible = false
            errorsText.text = ""
            stackView.push("MainPage.qml")
        }
        function onRegistration() {
            errors.visible = true
            errorsText.text = "Вы зарегистрировались!"
        }
        function onRecoverPassword() {
            errors.visible = true
            errorsText.text = "Вы изменили пароль!"
        }
    }
}
