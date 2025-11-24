import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "./themes"

Window {
    id: root

    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.Tool
    title: "Quickshell Bar"

    property int orientation: Qt.Vertical
    property string themeName: "winxp"

    readonly property bool vertical: orientation === Qt.Vertical

    width: vertical ? (themeLoader.theme ? themeLoader.theme.barThickness + (themeLoader.theme.padding * 2) : 72) : Screen.primaryOrientation === Qt.PortraitOrientation ? Screen.width : Screen.width
    height: vertical ? Screen.height : (themeLoader.theme ? themeLoader.theme.barThickness + (themeLoader.theme.padding * 2) : 72)
    x: 0
    y: 0

    ThemeLoader {
        id: themeLoader
        themeName: root.themeName
    }

    Bar {
        anchors.fill: parent
        orientation: root.orientation
        theme: themeLoader.theme
    }
}
