import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./"
import "../utils/SystemStats.js" as Stats

BaseModule {
    id: stats

    property real cpuUsage: 0
    property var cpuSnapshot: null
    property real memoryPercent: 0

    implicitWidth: orientation === Qt.Vertical ? 160 : 260
    implicitHeight: orientation === Qt.Vertical ? 120 : 64

    contentItem: ColumnLayout {
        anchors.fill: parent
        spacing: 6

        RowLayout {
            spacing: 6
            Layout.fillWidth: true
            Label {
                text: "CPU"
                font.family: theme ? theme.fontFamily : "Sans"
                font.pixelSize: theme ? theme.fontPixelSize : 14
                color: theme ? theme.mutedText : "#555"
            }
            ProgressBar {
                Layout.fillWidth: true
                from: 0; to: 100
                value: stats.cpuUsage
                contentItem: Rectangle {
                    anchors.fill: parent
                    radius: theme ? theme.radius : 6
                    color: "transparent"
                    border.color: theme ? theme.surfaceBorder : "#444"
                    gradient: Gradient {
                        GradientStop { position: 0; color: theme ? theme.surfaceStart : "#f0f0f0" }
                        GradientStop { position: 1; color: theme ? theme.surfaceEnd : "#e0e0e0" }
                    }
                }
                background: Rectangle { color: "transparent" }
            }
            Label {
                text: Math.round(stats.cpuUsage) + "%"
                font.family: theme ? theme.fontFamily : "Sans"
                font.pixelSize: theme ? theme.fontPixelSize : 14
                color: theme ? theme.text : "#111"
            }
        }

        RowLayout {
            spacing: 6
            Layout.fillWidth: true
            Label {
                text: "MEM"
                font.family: theme ? theme.fontFamily : "Sans"
                font.pixelSize: theme ? theme.fontPixelSize : 14
                color: theme ? theme.mutedText : "#555"
            }
            ProgressBar {
                Layout.fillWidth: true
                from: 0; to: 100
                value: stats.memoryPercent
                contentItem: Rectangle {
                    anchors.fill: parent
                    radius: theme ? theme.radius : 6
                    color: "transparent"
                    border.color: theme ? theme.surfaceBorder : "#444"
                    gradient: Gradient {
                        GradientStop { position: 0; color: theme ? theme.surfaceStart : "#f0f0f0" }
                        GradientStop { position: 1; color: theme ? theme.surfaceEnd : "#e0e0e0" }
                    }
                }
                background: Rectangle { color: "transparent" }
            }
            Label {
                text: Math.round(stats.memoryPercent) + "%"
                font.family: theme ? theme.fontFamily : "Sans"
                font.pixelSize: theme ? theme.fontPixelSize : 14
                color: theme ? theme.text : "#111"
            }
        }

        Timer {
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                var cpu = Stats.readCpuUsage(stats.cpuSnapshot)
                stats.cpuUsage = cpu.usage
                stats.cpuSnapshot = cpu.snapshot
                var mem = Stats.readMemoryUsage()
                stats.memoryPercent = mem.percent || 0
            }
        }
    }
}
