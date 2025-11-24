import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./"

BaseModule {
    id: actions

    property var actionsModel: [
        { icon: "⏻", label: "Power" },
        { icon: "⚙", label: "Settings" },
        { icon: "🎵", label: "Media" }
    ]

    signal actionTriggered(string label)

    implicitWidth: orientation === Qt.Vertical ? 120 : 240
    implicitHeight: orientation === Qt.Vertical ? 160 : 52

    contentItem: Loader {
        anchors.fill: parent
        sourceComponent: orientation === Qt.Vertical ? verticalLayout : horizontalLayout
    }

    Component {
        id: verticalLayout
        ColumnLayout {
            spacing: theme ? theme.moduleSpacing : 8
            anchors.fill: parent
            Layout.fillWidth: true

            Repeater {
                model: actionsModel
                delegate: Button {
                    id: actionButton
                    text: modelData.icon + "  " + modelData.label
                    font.family: theme ? theme.fontFamily : "Sans"
                    font.pixelSize: theme ? theme.fontPixelSize : 14
                    onClicked: actions.actionTriggered(modelData.label)
                    background: Rectangle {
                        radius: theme ? theme.radius : 8
                        color: "transparent"
                        border.color: theme ? theme.surfaceBorder : "#3c4a63"
                        gradient: Gradient {
                            GradientStop { position: 0; color: theme ? theme.surfaceStart : "#f0f0f0" }
                            GradientStop { position: 1; color: theme ? theme.surfaceEnd : "#e0e0e0" }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: horizontalLayout
        RowLayout {
            spacing: theme ? theme.moduleSpacing : 8
            anchors.fill: parent
            Layout.fillHeight: true

            Repeater {
                model: actionsModel
                delegate: Button {
                    id: actionButton
                    text: modelData.icon
                    font.family: theme ? theme.fontFamily : "Sans"
                    font.pixelSize: theme ? theme.fontPixelSize + 2 : 16
                    ToolTip.visible: hovered
                    ToolTip.text: modelData.label
                    onClicked: actions.actionTriggered(modelData.label)
                    background: Rectangle {
                        radius: theme ? theme.radius : 8
                        color: "transparent"
                        border.color: theme ? theme.surfaceBorder : "#3c4a63"
                        gradient: Gradient {
                            GradientStop { position: 0; color: theme ? theme.surfaceStart : "#f0f0f0" }
                            GradientStop { position: 1; color: theme ? theme.surfaceEnd : "#e0e0e0" }
                        }
                    }
                }
            }
        }
    }
}
