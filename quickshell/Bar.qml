import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "modules"

Rectangle {
    id: bar

    property int orientation: Qt.Vertical
    property var theme

    color: "transparent"
    radius: theme ? theme.radius : 12
    border.width: theme ? theme.borderWidth : 1
    border.color: theme ? theme.border : "#0b3a78"

    gradient: Gradient {
        GradientStop { position: 0; color: theme ? theme.backgroundStart : "#4f94e3" }
        GradientStop { position: 1; color: theme ? theme.backgroundEnd : "#2f6bc2" }
    }

    width: orientation === Qt.Vertical ? (theme ? theme.barThickness : 60) : parent ? parent.width : 900
    height: orientation === Qt.Vertical ? (parent ? parent.height : 900) : (theme ? theme.barThickness : 60)

    anchors {
        left: orientation === Qt.Vertical ? parent.left : undefined
        top: parent.top
        bottom: orientation === Qt.Vertical ? parent.bottom : undefined
        right: orientation === Qt.Horizontal ? parent.right : undefined
    }

    Item {
        id: content
        anchors.fill: parent
        anchors.margins: theme ? theme.padding : 8

        Loader {
            id: layoutLoader
            anchors.fill: parent
            sourceComponent: orientation === Qt.Vertical ? verticalLayout : horizontalLayout
        }
    }

    Component {
        id: verticalLayout
        ColumnLayout {
            spacing: theme ? theme.moduleSpacing : 8
            anchors.fill: parent

            WorkspaceModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillWidth: true
                onWorkspaceSelected: console.log("Switch workspace", name)
            }

            WindowTitleModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillWidth: true
            }

            ClockModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillWidth: true
            }

            SystemStatsModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillWidth: true
            }

            Item { Layout.fillHeight: true }

            QuickActionsModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillWidth: true
                onActionTriggered: console.log("Action", label)
            }
        }
    }

    Component {
        id: horizontalLayout
        RowLayout {
            spacing: theme ? theme.moduleSpacing : 8
            anchors.fill: parent

            WorkspaceModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillHeight: true
            }

            WindowTitleModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            ClockModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillHeight: true
            }

            SystemStatsModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillHeight: true
            }

            Item { Layout.fillWidth: true }

            QuickActionsModule {
                theme: bar.theme
                orientation: bar.orientation
                Layout.fillHeight: true
            }
        }
    }
}
