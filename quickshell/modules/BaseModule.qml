import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root

    property alias contentItem: contentItem
    property int orientation: Qt.Vertical
    property var theme
    property real padding: theme ? theme.padding : 8

    radius: theme ? theme.radius : 10
    border.width: theme ? theme.borderWidth : 1
    border.color: theme ? theme.surfaceBorder : "#333"

    color: "transparent"
    layer.enabled: true
    layer.smooth: true

    gradient: Gradient {
        GradientStop { position: 0; color: theme ? theme.surfaceStart : "#f0f0f0" }
        GradientStop { position: 1; color: theme ? theme.surfaceEnd : "#e0e0e0" }
    }

    Item {
        id: contentItem
        anchors.fill: parent
        anchors.margins: padding
    }
}
