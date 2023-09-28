

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



Page {
id: page
width: Constants.width
height: Constants.height
Rectangle {
    width: Constants.width
    height: Constants.height
    color: "#116A7B"

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

        MouseArea {
            id: content
            width: Constants.width
            height: Constants.width

            onClicked: focus = true


            Image {
                id: image1

                width: 19
                height: 18
                source: "logo/eye_close.svg"
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    anchors.fill: parent
                    // MouseArea, Image'i kaplasın

                    // @disable-check M223
                    onPressed: {
                        image1.source = "logo/eye_opened.svg"
                        passwordTxt.echoMode = TextInput.Normal
                    }
                    // @disable-check M223
                    onReleased: {
                        image1.source = "logo/eye_close.svg"
                        passwordTxt.echoMode = TextInput.Password // Şifre modu
                    }
                }
            }
        }

}

}






