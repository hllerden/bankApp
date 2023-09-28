

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank

Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#116a7b"

    // If enabled, prevents interaction with the text fields
   // property bool handwritingInputPanelActive: false

    Image {
        id: image
        x: 53
        y: 63
        width: 438
        height: 413
        anchors.verticalCenter: verticalCenter

        visible: true
        source: "logo/logo.png"
        clip: true
        anchors.verticalCenterOffset: -107
        fillMode: Image.PreserveAspectCrop
    }


        /*
        states: [
            State {
                name: "clicked"
            }
        ]*/





        StackView {
            id: stackView1
            x: 500
            y: 80
            width: 450
            height: 450



            initialItem:logLogin
        }
        Component
        {
            id:logLogin
            LogLogin
            {

            }
        }


      }

