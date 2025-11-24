import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Control {
    id: root

    property int orientation: Qt.Vertical
    property var theme
    property real padding: theme ? theme.padding : 8
    property real borderWidth: theme ? theme.borderWidth : 1
    property color borderColor: theme ? theme.surfaceBorder : "#333"

    leftPadding: padding
    rightPadding: padding
    topPadding: padding
    bottomPadding: padding

    radius: theme ? theme.radius : 10

    background: Rectangle {
        radius: root.radius
        border.width: root.borderWidth
        border.color: root.borderColor
        color: "transparent"
        gradient: Gradient {
            GradientStop { position: 0; color: root.theme ? root.theme.surfaceStart : "#f0f0f0" }
            GradientStop { position: 1; color: root.theme ? root.theme.surfaceEnd : "#e0e0e0" }
        }
    }

    // Provide a default content item so modules can override with their own layout.
    contentItem: Item {
        anchors.fill: parent
    }
}
