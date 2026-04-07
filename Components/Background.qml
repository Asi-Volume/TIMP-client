import QtQuick

Rectangle {
    anchors.fill: parent

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#070b16" }
        GradientStop { position: 0.35; color: "#0e1630" }
        GradientStop { position: 0.70; color: "#101a3a" }
        GradientStop { position: 1.0; color: "#050811" }
    }

    Rectangle {
        width: 520
        height: 520
        radius: width / 2
        color: "#7c3aed"
        opacity: 0.10
        x: -130
        y: -120
    }

    Rectangle {
        width: 420
        height: 420
        radius: width / 2
        color: "#06b6d4"
        opacity: 0.11
        x: parent.width - width - 60
        y: 80
    }

    Rectangle {
        width: 360
        height: 360
        radius: width / 2
        color: "#2563eb"
        opacity: 0.08
        x: parent.width / 2 - 40
        y: parent.height - 220
    }

    Rectangle {
        anchors.fill: parent
        color: "#030712"
        opacity: 0.18
    }
}
