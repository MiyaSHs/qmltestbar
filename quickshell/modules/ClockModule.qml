import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./"

BaseModule {
    id: clock

    property string timeFormat: "hh:mm"
    property string dateFormat: "ddd, MMM d"

    implicitWidth: orientation === Qt.Vertical ? 120 : 220
    implicitHeight: orientation === Qt.Vertical ? 120 : 64

    contentItem: ColumnLayout {
        anchors.fill: parent
        spacing: 4
        Layout.alignment: Qt.AlignCenter

        Label {
            id: timeLabel
            text: Qt.formatTime(new Date(), timeFormat)
            font.family: theme ? theme.fontFamily : "Sans"
            font.pixelSize: theme ? theme.fontPixelSize + 6 : 20
            color: theme ? theme.text : "#111"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        Label {
            id: dateLabel
            text: Qt.formatDate(new Date(), dateFormat)
            font.family: theme ? theme.fontFamily : "Sans"
            font.pixelSize: theme ? theme.fontPixelSize : 14
            color: theme ? theme.mutedText : "#333"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                timeLabel.text = Qt.formatTime(new Date(), timeFormat)
                dateLabel.text = Qt.formatDate(new Date(), dateFormat)
            }
        }
    }
}
