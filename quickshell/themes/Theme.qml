import QtQuick 2.15

QtObject {
    id: theme

    // Sizing
    property real barThickness: 52
    property real padding: 8
    property real moduleSpacing: 8
    property real radius: 10
    property real borderWidth: 1

    // Colors
    property color backgroundStart: "#3e7ad8"
    property color backgroundEnd: "#1b4d9d"
    property color border: "#0f2e5f"
    property color surfaceStart: "#f0f6ff"
    property color surfaceEnd: "#d5e1ff"
    property color surfaceBorder: "#2c4f8f"
    property color accent: "#f6b94f"
    property color text: "#0d234f"
    property color mutedText: "#2e4278"

    // Typography
    property string fontFamily: "Segoe UI"
    property int fontPixelSize: 14
}
