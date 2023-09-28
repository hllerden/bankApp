import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank

Item {
    //id: logLogin
    anchors.fill: stackView1

    Rectangle {
        id: rect
        anchors.fill: parent
        width: stackView1.width
        height: stackView1.height

        color: "#116A7B"

        Label {
            id: label2
            x: 46
            y: 163

            text: qsTr("Costumer id :")
        }

        Label {
            id: label3
            x: 58
            y: 217
            text: qsTr("Password :")
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
            onClicked: focus = true

            Label {
                id: forgetPassLabel
                x: 284
                y: 262
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
                x: 148
                y: 209
                width: 241
                height: 32
                color: "#ffffff"
                radius: 12
            }
            Rectangle {
                id: idRectangel
                x: 148
                y: 156
                width: 240
                height: 32
                color: "#ffffff"
                radius: 12
            }

            TextInput {
                id: customeridTxt
                x: 171
                y: 160
                width: 195
                height: 25
                font.pixelSize: 16
                layer.wrapMode: ShaderEffectSource.ClampToEdge
                layer.enabled: true
                maximumLength: 32

            }

            TextInput {
                id: passwordTxt
                x: 164
                y: 213
                width: 193

                height: 25
                font.pixelSize: 16
                layer.enabled: true
                maximumLength: 32
                echoMode: TextInput.Password // Şifre modu
            }
            Button {
                id: button
                x: 293
                y: 294
                text: qsTr("Login")

                // @disable-check M223
                onClicked:
                {
                    //loginManager.login(customeridTxt.text,passwordTxt.text)
                    if(LoginManager.loginRequest(customeridTxt.text,passwordTxt.text)){
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

                    //stackView.clear()
                    /*if(logManager.login(customeridTxt.text,passwordTxt.text))
                    {
                        loginManager.push( "passForgetPage.qml")
                    }*/


                    //stackView.push( "passForgetPage.qml");

               }


            Image {
                id: image1
                x: passwordTxt.x + passwordTxt.width
                y: passwordTxt.y + 5

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
