

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
    color: "#116A7B"

    // If enabled, prevents interaction with the text fields
   // property bool handwritingInputPanelActive: false



        Label {
            id: label2
            x: 587
            y: 224

            text: qsTr("Costumer id :")
        }

        Label {
            id: label3
            x: 599
            y: 285
            text: qsTr("Password :")
        }

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

        Label {
            id: label4
            x: 574
            y: 89
            text: qsTr("Kopya Kalpler")
            font.pixelSize: 30
            layer.enabled: false
        }

        Label {
            id: label5
            x: 585
            y: 125
            text: qsTr("Siz yatırın Biz Batıralım")
            font.pixelSize: 14
        }


        /*
        states: [
            State {
                name: "clicked"
            }
        ]*/

        MouseArea {
            id: content
            width: Constants.width
            height: Constants.width

            //onClicked: focus = true

            Label {
                id: forgetPassLabel
                x: 831
                y: 322
                text: qsTr("Şifremi unuttum")
                color: "#0008FF"

                MouseArea {
                    anchors.fill: parent
                    anchors.leftMargin: -6
                    anchors.topMargin: -5
                    anchors.rightMargin: -6
                    anchors.bottomMargin: -7
                    // @disable-check M223
                    onPressed: {
                        forgetPassLabel.color = "#d1ebe9"
                    }
                    // @disable-check M223
                    onReleased: {
                        forgetPassLabel.color = "#0008FF"
                    }
                }
            }

            Rectangle {
                id: passRectangel
                x: 682
                y: 277
                width: 241
                height: 32
                color: "#ffffff"
                radius: 12
            }
            Rectangle {
                id: idRectangel
                x: 682
                y: 218
                width: 240
                height: 32
                color: "#ffffff"
                radius: 12
            }
            TextInput {
                id: customeridTxt
                x: 705
                y: 221
                width: 195
                height: 25
                font.pixelSize: 16
                layer.wrapMode: ShaderEffectSource.ClampToEdge
                layer.enabled: true
                maximumLength: 32

            }

            TextInput {
                id: passwordTxt
                x: 692
                y: 281
                width: 193

                height: 25
                font.pixelSize: 16
                layer.enabled: true
                maximumLength: 32
                echoMode: TextInput.Password // Şifre modu
            }
            Button {
                id: button
                x: 831
                y: 358
                text: qsTr("Login")

                // @disable-check M223
                onClicked: {
                    //stackView.clear()

                   // stackView.push( "passForgetPage.qml")
                    stackView.push( "Screen01.ui.qml")

                }
            }


        }

}
