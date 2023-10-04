import QtQuick 6.2
import QtQuick.Controls 2.15
import ytBank 1.0
Item {
    Rectangle {
        anchors.fill: parent
        color: Constans.colorBackground

        Label {
            x:0
            y:0
            text:loginedUserInfo
            font.pixelSize: 45
        }
        TextField {
            id: textField
            x: 352
            y: 55
            placeholderText: qsTr("   ")
            onFocusChanged: {
                if (focus) {
                    // TextField odaklandığında burası çalışır
                    console.log("TextField focused");
                } else {
                    // TextField odaktan çıkıldığında burası çalışır
                    console.log("TextField unfocused");
                }
            }
        }
    }
}
