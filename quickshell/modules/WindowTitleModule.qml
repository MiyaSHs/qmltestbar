import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./"

BaseModule {
    id: windowTitle

    property string title: "No active window"
    property string subtitle: "Hyprland"

    implicitWidth: orientation === Qt.Vertical ? 160 : 320
    implicitHeight: orientation === Qt.Vertical ? 120 : 70

    contentItem: ColumnLayout {
        anchors.fill: parent
        spacing: 2

        Label {
            text: windowTitle.subtitle
            font.family: theme ? theme.fontFamily : "Sans"
            font.pixelSize: theme ? theme.fontPixelSize - 2 : 12
            color: theme ? theme.mutedText : "#555"
            horizontalAlignment: Text.AlignLeft
            Layout.fillWidth: true
            elide: Text.ElideRight
        }

        Label {
            text: windowTitle.title
            font.family: theme ? theme.fontFamily : "Sans"
            font.pixelSize: theme ? theme.fontPixelSize + 2 : 16
            font.bold: true
            color: theme ? theme.text : "#111"
            horizontalAlignment: Text.AlignLeft
            Layout.fillWidth: true
            wrapMode: Text.Wrap
            maximumLineCount: 2
            elide: Text.ElideRight
        }
    }
}
