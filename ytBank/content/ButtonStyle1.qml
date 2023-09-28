import QtQuick 6.2


import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Button {
    id:rootbut
    // lets create simple Button
    //
    property color backgroundDefaultColor: "#4E5BF2"
    property color backgroundPressedColor: Qt.darker(backgroundDefaultColor,1.2)
    property color contentItemTextColor : "white"
    property bool  buttonDropShadow : false
    text: qsTr("Button")
/*
    // add some syle
    contentItem: Text {
        text: rootbut.text
        font: rootbut.font
        opacity: enabled ? 1.0 : 0.3
        color: "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
*/
    contentItem : Text {
        text:rootbut.text
        color:rootbut.contentItemTextColor
        font.pixelSize: 18
        font.family:"Arial"
        font.weight: Font.Thin
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide:Text.ElideRight
    }

    // background style of button
    background: Rectangle {
        id:recbut
        implicitWidth: 87
        implicitHeight: 37
        color:rootbut.down ? rootbut.backgroundPressedColor : rootbut.backgroundDefaultColor
        radius: 4
        layer.enabled: buttonDropShadow
        layer.effect: DropShadow {
            transparentBorder: true // this is important
            color: rootbut.down ? rootbut.backgroundPressedColor: rootbut.backgroundDefaultColor
            samples:20
        }
    }
}
