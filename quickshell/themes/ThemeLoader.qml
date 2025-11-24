import QtQuick 2.15
import "./"

Loader {
    id: loader

    property string themeName: "winxp"
    readonly property QtObject theme: item

    function componentForName(name) {
        switch (name.toLowerCase()) {
        case "winxp":
            return winxpComponent
        case "modern":
            return modernComponent
        default:
            return winxpComponent
        }
    }

    sourceComponent: componentForName(themeName)

    Component { id: winxpComponent; WinXPTheme {} }
    Component { id: modernComponent; ModernTheme {} }
}
