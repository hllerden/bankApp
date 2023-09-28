import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank

Item {
    id: forgetPassPageBase
    anchors.fill: stackViewLogin
    //visible:true
    Rectangle {
        //visible:true

        id: forgetPassPage1
        anchors.fill: parent
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: "#116A7B"

        Label {
            id: label4
            x: 46
            y: 89
            text: qsTr("Yatır Bank Şifremi Unuttum")
            font.pixelSize: 30
            layer.enabled: false
        }
        Rectangle {
        id: __multi__selection__

        TextField {
        id: textFieldforgetCostumer
        x: 75
        y: 153
        width: 310
        height: 41
        scale: 1
        selectionColor: "#232323"
        background: Rectangle {
        radius: 5
        border.color: "#707070"
        border.width: 1
        Image {
        id: imageTextField
        x: parent.x+9
        width: 20
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Image.AlignLeft
        source: "logo/user_textField.svg"
        }
        }
        placeholderText: qsTr("Costumer id")
        onTextChanged: { text = text.replace(/\s/g, "");}
        leftPadding: imageTextField.width+15
        }

        ButtonStyle1 {
        id: button
        x: 75
        y: 297
        width: 310
        height: 52
        text: qsTr("Continue")
        contentItemTextColor: "#ffffff"
        backgroundDefaultColor: "#e2ae38"
        onClicked: {
            //loginManager.login(customeridTxt.text,passwordTxt.text)
            if(LoginManager.loginRequest(textFieldCostumer.text,textFieldPassword.text)){
                //stackView.push(passwordForget)
            }
        }
        buttonDropShadow: false
        anchors.horizontalCenterOffset: 0
        Connections {
            target: LoginManager
            onLoginResult: {
                console.log("Login result1:", success);
                if(success){
                    //stackView.push("passwordForgetPage.qml")
                }
            }
        }
        }

        TextField {
            id: textFieldforgetEmail
            x: 75
            y: 214
            width: 310
            height: 41
            scale: 1
            selectionColor: "#232323"
            background: Rectangle {
                radius: 5
                border.color: "#707070"
                border.width: 1
                Image {
                    id: imageTextField1
                    x: parent.x+9
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Image.AlignLeft
                    source: "logo/email_textField.svg"
                }
            }
            placeholderText: qsTr("Email")
            leftPadding: imageTextField1.width+15
        }
        }

    }


}
