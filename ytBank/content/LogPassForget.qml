import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank

Item {
    id: forgetPassPageBase
    anchors.fill: stackViewLogin
    visible:true
    Rectangle {
        visible:true

        id: forgetPassPage1
        anchors.fill: parent
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: "#116A7B"

        Image {
        id: backImage
        x: 8

        width: 29
        height: 27
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Image.AlignLeft
        source: "logo/back_textField.svg"
        anchors.verticalCenterOffset: -203
        MouseArea{
            anchors.fill: parent
            anchors.rightMargin: -10
            anchors.leftMargin: -8
            anchors.topMargin: -8
            anchors.bottomMargin: -10
            onClicked: {

                stackViewLogin.pop(null);
                listOpenPages();}
        }
        }

        Label {
            id: label4
            x: 158
            y: 25
            text: qsTr("Yatır Bank")
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

        Label {
            id: label5
            x: 74
            y: 75
            font.pixelSize: 15
            layer.enabled: false
            text: qsTr("Verify Indetity")

        }

        Label {
            id: label6
            x: 74
            y: 99
            font.pixelSize: 12


            layer.enabled: false
            text:qsTr("We will ask you the answer to the security question \n registered in our system so that we can identify you.")
        }

    }
    Rectangle {
        id: forgetPassPage2
        visible:false
        anchors.fill: parent
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: "#116A7B"
        Image {
        id: backImage2
        x: 8

        width: 29
        height: 27
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Image.AlignLeft
        source: "logo/back_textField.svg"
        anchors.verticalCenterOffset: -203
        MouseArea{
            anchors.fill: parent
            anchors.rightMargin: -10
            anchors.leftMargin: -8
            anchors.topMargin: -8
            anchors.bottomMargin: -10
            onClicked: {

                stackViewLogin.pop(null);
                listOpenPages();}
        }
        }



        Label {
            id: label24
            x: 158
            y: 25
            text: qsTr("Yatır Bank")
            font.pixelSize: 30
            layer.enabled: false
        }

        ButtonStyle1 {
            id: button2
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
            id: textFieldPassForgetSecAns
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
                    visible:false
                    id: imageTextField21
                    x: parent.x+9
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Image.AlignLeft
                    source: "logo/email_textField.svg"
                }
            }
            placeholderText: qsTr("Security Question Answer")
            leftPadding: imageTextField1.width+15
        }


        Label {
            id: label25
            x: 74
            y: 75
            font.pixelSize: 15
            layer.enabled: false
            text: qsTr("Verify Indetity - security question")

        }

        Label {
            id: label26
            visible:false
            x: 74
            y: 107
            font.pixelSize: 12
            layer.enabled: false
            text:qsTr("Type the continuation of the security question\n you previously determined.")
        }

        Label {
            id: labelPassForgetname
            x: 74
            y: 104
            font.pixelSize: 15
            layer.enabled: false
            text: qsTr("Hello Mr Admin, \nhere is your security question set by you.")

        }
        Label {
            id: labelPassForgetSeq
            x: 74
            y: 170
            font.pixelSize: 15
            layer.enabled: false
            text: qsTr("Seq Ques : Baldız daldan sallanır ....")

        }
    }



    function listOpenPages() {
        if(stackviewWhichPageOpen){
        for (var i = 0; i < stackViewLogin.depth; i++) {
            var page = stackViewLogin.get(i);
            if (page) {
                console.log("Açık Sayfa:", page);
            }
        }

        }
    }
}


