import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property int orientation: Qt.Vertical
    property var theme
    property real padding: theme ? theme.padding : 8
    property real borderWidth: theme ? theme.borderWidth : 1
    property color borderColor: theme ? theme.surfaceBorder : "#333"
    property real radius: theme ? theme.radius : 10

    // Expose a default property so modules can provide arbitrary layouts/content.
    default property alias contentItem: contentHolder.data

    implicitWidth: contentHolder.implicitWidth + padding * 2
    implicitHeight: contentHolder.implicitHeight + padding * 2

    Rectangle {
        anchors.fill: parent
        radius: root.radius
        border.width: root.borderWidth
        border.color: root.borderColor
        color: "transparent"
        gradient: Gradient {
            GradientStop { position: 0; color: root.theme ? root.theme.surfaceStart : "#f0f0f0" }
            GradientStop { position: 1; color: root.theme ? root.theme.surfaceEnd : "#e0e0e0" }
        }
    }

    Item {
        id: contentHolder
        anchors.fill: parent
        anchors.margins: padding
    }
}
