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
/*
Page {
id: passwordForgetPage
width: Constants.width
height: Constants.height
*/
Rectangle {
    width:Constants.width
    height:Constants.height
    color: "#116A7B"

    Button {
        id: button
        x: 404
        y: 96
        width: 471
        height: 215
        text: qsTr("BACK")

        onClicked:
        {
            stackView.clear()
            stackView.push( "Screen01.ui.qml")

        }
    }

    TextInput {
        id: passwordTxt
        x: 543
        y: 313
        width: 193
        height: 25
        font.pixelSize: 16
        echoMode: TextInput.Password
        maximumLength: 32
        layer.enabled: true
    }

}






// }
