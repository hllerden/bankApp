pragma Singleton
import QtQuick 6.2
import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1024
    readonly property int height: 600

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#c2c2c2"
    // readonly property color basegroundColor: "#123a7b"
    readonly property color basegroundColor: "#116a7b"
    readonly property color buttonColor: "#4E5BF2"

    readonly property color color1: "#68c2e7"
    readonly property color color2: "#ebe9ea"
    readonly property color color3: "#e2ae38"
    readonly property color color4: "#116a7b"
    readonly property color color5: "#634648"
    readonly property color color6: "#fcf8d9"
    readonly property color color7: "#e4ab7e"

    property StudioApplication application: StudioApplication {
        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
    }
}
