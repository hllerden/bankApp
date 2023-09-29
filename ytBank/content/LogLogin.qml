import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank
//import "."
import QtQuick.Studio.Components 1.0
Item {
    id: item1
    //id: logLogin
    anchors.fill: stackViewLogin
    property bool isActiveCheckBox: false
    Rectangle {
        id: rect
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        scale: 1
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: "#116A7B"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Label{

            id:loginFailedLabel
            visible:false
            x: 102
            y: 117
            color:"#ff0000"
            text: qsTr("Password or customer id is wrong!")
            font.pointSize: 12
            font.weight: Font.Bold
        }

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
                y: 263
                text: qsTr("Forget Password")
                // anchors.top: button.bottom
                anchors.topMargin: 36
                font.pointSize: 12
                color: "#0008FF"

                MouseArea {
                    anchors.fill: parent
                    anchors.leftMargin: -20
                    anchors.topMargin: -6
                    anchors.rightMargin: -17
                    anchors.bottomMargin: -6
                    // @disable-check M223
                    onPressed: {
                        forgetPassLabel.color = "#d1ebe9"
                    }
                    // @disable-check M223
                    onReleased: {
                        forgetPassLabel.color = "#0008FF"
                        stackViewLogin.push(logForgetPassword);
                        listOpenPages();
                    }
                }
            }

            TextField {

                id: textFieldCostumer
                x: 75
                y: 153
                width: 310
                height: 41
                //anchors.left: textFieldPassword.left
                //anchors.right: textFieldPassword.right
                anchors.horizontalCenter: textFieldPassword.horizontalCenter
                selectionColor: "#232323"
                scale: 1
                leftPadding: imageTextField.width+15
                //placeholderText: qsTr("Costumer id")
                placeholderText: textFieldCostumer.activeFocus ? "" : "Costumer id" // Odaklandığında boş bırak

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
                Keys.onTabPressed:{ //textFieldPassword.forceActiveFocus()
                    textFieldPassword.focus=true
                    console.log("Tab tuşuna basıldı - Alan 1");
                }
                Keys.onEnterPressed: {
                    textFieldPassword.forceActiveFocus()
                    console.log("Enter tuşuna basıldı - Alan 1");

                }
                Keys.onReturnPressed: {
                    textFieldPassword.forceActiveFocus()
                    console.log("Return tuşuna basıldı - Alan 1");
                }

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
                placeholderText: textFieldPassword.activeFocus ? "" : "Password" // Odaklandığında boş bırak
                //placeholderText: qsTr("Password")

                // Varsayılan stilin bir kopyasını kaydedin




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
                onTextChanged: { text = text.replace(/\s/g, "");} // Boşluk karakterlerini kaldır

                MouseArea {
                    z:12
                    anchors.fill: textFieldPassword
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
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
                Keys.onTabPressed:{ //textFieldPassword.forceActiveFocus()
                    buttonlogin.focus=true
                    console.log("Tab tuşuna basıldı - Alan 1");

                }
                Keys.onEnterPressed: {
                    buttonlogin.forceActiveFocus()
                    console.log("Enter tuşuna basıldı - Alan 1");
                    buttonlogin.clicked();
                }
                Keys.onReturnPressed: {
                    buttonlogin.forceActiveFocus()
                    console.log("Return tuşuna basıldı - Alan 1");
                    buttonlogin.clicked();
                }
            }

            ButtonStyle1 {
                id: buttonlogin
                x: 75
                y: 297
                width: 310
                height: 52
                backgroundDefaultColor: "#e2ae38"
                contentItemTextColor:"#ffffff"
                text: qsTr("Login")
                anchors.horizontalCenterOffset: 0
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
                            loginFailedLabel.visible=false
                        }
                        else{
                        console.log("Login başarısız Label görünür hale getirildi.");
                        loginFailedLabel.visible=true

                        }
                    }
                }

            }

        }

        GroupItem {
            x: 114
            y: 410

            Label {
                id: labelSignUpLogin
                x: 0
                y: 0
                text: qsTr("Yeni müşteri misin ?")
                //anchors.right: label4.right
                font.pixelSize: 14
            }

            Label {
                text: qsTr("Hemen Üye Ol ?")

                id:labelSignUpLoginClickable
                x: 127
                y: 0
                color: "#0008FF"

                MouseArea {
                    anchors.fill: parent
                    anchors.leftMargin: -5
                    anchors.topMargin: -5
                    anchors.rightMargin: -9
                    anchors.bottomMargin: -7
                    // @disable-check M223
                    onPressed: {
                        labelSignUpLoginClickable.color = "#d1ebe9"
                    }
                    // @disable-check M223
                    onReleased: {
                        labelSignUpLoginClickable.color = "#0008FF"

                    }
                }
            }
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


