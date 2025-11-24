import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./"

BaseModule {
    id: workspaces

    property var workspaceModel: [
        { "name": "1", "active": true },
        { "name": "2", "active": false },
        { "name": "3", "active": false },
        { "name": "4", "active": false },
        { "name": "5", "active": false }
    ]
    signal workspaceSelected(string name)

    implicitWidth: orientation === Qt.Vertical ? 44 : 240
    implicitHeight: orientation === Qt.Vertical ? 240 : 44

    contentItem: Loader {
        anchors.fill: parent
        sourceComponent: orientation === Qt.Vertical ? verticalLayout : horizontalLayout
    }

    Component {
        id: horizontalLayout
        RowLayout {
            anchors.fill: parent
            spacing: theme ? theme.moduleSpacing : 8

            Repeater {
                model: workspaceModel
                delegate: workspaceButton
            }
        }
    }

    Component {
        id: verticalLayout
        ColumnLayout {
            anchors.fill: parent
            spacing: theme ? theme.moduleSpacing : 8

            Repeater {
                model: workspaceModel
                delegate: workspaceButton
            }
        }
    }

    Component {
        id: workspaceButton
        Button {
            id: button
            text: modelData.name
            checkable: true
            checked: modelData.active
            font.family: theme ? theme.fontFamily : "Sans"
            font.pixelSize: theme ? theme.fontPixelSize : 14
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 32
                radius: theme ? theme.radius : 8
                color: button.checked ? (theme ? theme.accent : "#ffcc66") : "transparent"
                border.color: theme ? theme.surfaceBorder : "#3c4a63"
                gradient: Gradient {
                    GradientStop { position: 0; color: button.checked ? (theme ? theme.accent : "#ffcc66") : (theme ? theme.surfaceStart : "#f0f0f0") }
                    GradientStop { position: 1; color: button.checked ? (theme ? Qt.darker(theme.accent, 1.2) : "#dda94a") : (theme ? theme.surfaceEnd : "#e0e0e0") }
                }
            }
            contentItem: Text {
                text: button.text
                anchors.centerIn: parent
                color: button.checked ? "black" : (theme ? theme.text : "#111")
                font: button.font
            }
            onClicked: workspaceSelected(modelData.name)
        }
    }
}
