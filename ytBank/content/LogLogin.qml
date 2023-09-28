import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank
//import "."
Item {
    id: item1
    //id: logLogin
    anchors.fill: stackView1
    property bool isActiveCheckBox: false
    Rectangle {
        id: rect
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        scale: 1
        width: stackView1.width
        height: stackView1.height

        color: "#116A7B"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom


        Label {
            id: label4
            x: 64
            y: 28
            text: qsTr("Yatır Banka Hoş Geldiniz")
            font.pixelSize: 30
            layer.enabled: false
        }

        Label {
            id: label5
            x: 72
            y: 62
            text: qsTr("Siz yatırın Biz Batıralım")
            font.pixelSize: 14
        }


        MouseArea {

            id: content
            width: parent.width
            height: parent.height
            scale: 1
            onClicked: focus = true

            Label {
                id: forgetPassLabel
                x: 266
                y: 360
                text: qsTr("Forget Password")
                anchors.top: button.bottom
                anchors.topMargin: 6
                font.pointSize: 12
                color: "#0008FF"

                MouseArea {
                    anchors.fill: parent
                    anchors.leftMargin: -3
                    anchors.topMargin: -5
                    anchors.rightMargin: -9
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

            TextField {

                id: textFieldCostumer
                x: 75
                y: 153
                width: 310
                height: 41
                anchors.left: textFieldPassword.left
                anchors.right: textFieldPassword.right
                anchors.horizontalCenter: textFieldPassword.horizontalCenter
                selectionColor: "#232323"
                scale: 1
                leftPadding: imageTextField.width+15
                placeholderText: qsTr("Costumer id")
                background:
                    Rectangle {
                            radius: 5
                            border.color: "#707070"
                            border.width: 1

                    Image {
                        source:"logo/user_textField.svg"
                        id: imageTextField

                        x:parent.x+9
                        //y:parent.y+10
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter // Y ekseninde ortala

                        horizontalAlignment: Image.AlignLeft


                    }
                }
                onTextChanged: { text = text.replace(/\s/g, "");} // Boşluk karakterlerini kaldır
            }

            TextField {
                id: textFieldPassword
                z:10
                x: 75
                y: 214
                width: 310
                height: 41
                layer.enabled: false
                echoMode: TextInput.Password
                inputMethodHints: Qt.ImhNoPredictiveText // space engeller
                implicitWidth:100
                selectionColor: "#242424"
                leftPadding: imageTextField1.width+15
                //rightPadding: imageTextFieldPassVisib.width+25
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
                        source: "logo/password_textField.svg"
                    }

                   // Bu kısım olmadı bunun yerine check box ekledim
                    Image {
                        z:11
                        id: imageTextFieldPassVisib
                        x: parent.x+parent.width-29
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                        horizontalAlignment: Image.AlignLeft
                        source: "logo/eye_close.svg"



                   }

                }

                scale: 1
                placeholderText: qsTr("Password")
                onTextChanged: { text = text.replace(/\s/g, "");} // Boşluk karakterlerini kaldır

                /*MouseArea{
                    x: 0
                    y: 0
                    width: 276
                    height: 41

                }*/


            }
            MouseArea {
                z:8
                anchors.fill: textFieldPassword
                anchors.rightMargin: -8
                anchors.bottomMargin: -10
                anchors.leftMargin: 273
                anchors.topMargin: 0
                // MouseArea, Image'i kaplasın

                // @disable-check M223
                onPressed: {
                    imageTextFieldPassVisib.source = "logo/eye_opened.svg"
                    textFieldPassword.echoMode = TextInput.Normal
                }
                // @disable-check M223
                onReleased: {
                    imageTextFieldPassVisib.source = "logo/eye_close.svg"
                    textFieldPassword.echoMode = TextInput.Password // Şifre modu
                }
            }
            ButtonStyle1 {
                id: button
                x: 75
                y: 267
                width: 310
                height: 52
                backgroundDefaultColor: "#e2ae38"
                contentItemTextColor:"#ffffff"
                text: qsTr("Login")
                anchors.horizontalCenter: textFieldPassword.horizontalCenter
                buttonDropShadow:false
                // @disable-check M223
                onClicked:
                {
                    //loginManager.login(customeridTxt.text,passwordTxt.text)
                    if(LoginManager.loginRequest(textFieldCostumer.text,textFieldPassword.text)){
                     //stackView.push(passwordForget)
                    }
                }
                Connections {
                    target: LoginManager
                    onLoginResult:{
                        console.log("Login result1:", success);
                        if(success){
                            //stackView.push("passwordForgetPage.qml")
                        }
                    }
                }

               }


            CheckBox {
                id: checkBox
                x: 57
                y: 383
                width: 168
                height: 32
                text: qsTr("Show Password")
                font.pointSize: 10
                font.styleName: "Italic"
                spacing: 8
                checked: isActiveCheckBox;
                onCheckedChanged:
                {
                    isActiveCheckBox = checked // CheckBox durumu bool değişkenine atandı
                    textFieldPassword.echoMode = isActiveCheckBox ? TextInput.Normal : TextInput.Password;
                }
            }
        }

        Label {
            id: label6
            x: 234
            y: 394
            text: qsTr("Yeni Üye Kaydı Yapalım ?")
            anchors.right: label4.right
            font.pixelSize: 14
            anchors.rightMargin: 0
        }




    }


}
