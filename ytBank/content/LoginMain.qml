

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
    color: Constants.basegroundColor


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



    MouseArea {

        id: content1
        width: parent.width
        height: parent.height
        scale: 1
        onClicked: focus = true

        StackView {
            id: stackViewLogin
            x: 500
            y: 80
            width: 450
            height: 450
            pushEnter: Transition {
                     PropertyAnimation {
                         property: "opacity"
                         from: 0
                         to:1
                         duration: 200
                     }
                 }
                 pushExit: Transition {
                     PropertyAnimation {
                         property: "opacity"
                         from: 1
                         to:0
                         duration: 200
                     }
                 }
                 popEnter: Transition {
                     PropertyAnimation {
                         property: "opacity"
                         from: 0
                         to:1
                         duration: 200
                     }
                 }
                 popExit: Transition {
                     PropertyAnimation {
                         property: "opacity"
                         from: 1
                         to:0
                         duration: 200
                     }
                 }


            initialItem:logLogin

            Component{id:logLogin;LogLogin{}}
            Component{id:logForgetPassword;LogPassForget{}}
         }


    }


      }

