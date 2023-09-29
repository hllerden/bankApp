import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank



Item {
    id: forgetPassPageBase
    anchors.fill: stackViewLogin
    visible:true

    property var userInfo: null

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
                if(LoginManager.loginPassForget(textFieldforgetCostumer.text,textFieldforgetEmail.text)){
                    //stackView.push(passwordForget)
                }
                LoginManager.loginPassForget2(textFieldforgetCostumer.text,textFieldforgetEmail.text);







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

        Label {

            id:labelErrorPassForget1
            visible:false
            x: 74
            y: 265
            font.pixelSize: 15
            layer.enabled: false
            text: qsTr("Verify Indetity")
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
               if(textFieldPassForgetSecAns.text==userInfo[1].sec_ans){
                    console.log("Güvenlik Sorusu Doğru");
                }
                else{

                    console.log("Güvenlik Sorusu Yanlış.");
                   console.log("doğrusu: >"+userInfo[1].sec_ans+"<girdiğin: >"+textFieldPassForgetSecAns.text+"<");
                }
            }
            buttonDropShadow: false
            anchors.horizontalCenterOffset: 0

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
    Rectangle {
        id: forgetPassPage3
        visible:false

    }

    function passwordForgetDataGeldi(result,mode) {
        // inputParam değişkenini kullanabilirsiniz
        if(mode==0)
        {
        var succes = result[0];
         console.log("Succes: " + succes);
        if(succes){
            var username  = result[1].username;
            var password  = result[1].password;
            var email  = result[1].email;
            var firstname  = result[1].firstname;
            var lastname  = result[1].lastname;
            var age  = result[1].age;
            var sec_ques  = result[1].sec_ques;
            var sec_ans  = result[1].sec_ans;

            console.log("userName: " + username);
            console.log("password: " + password);
            console.log("email: " + email);
            console.log("firstname: " + firstname);
            console.log("lastname: " + lastname);
            console.log("age: " + age);
            console.log("sec_ques: " + sec_ques);
            console.log("sec_ans: " + sec_ans);

            // 2. sayfaya geçiliyor
            forgetPassPage1.visible=false;
            forgetPassPage2.visible=true;
            labelPassForgetname.text="Hello Dear "+firstname+" "+lastname+" \nhere is your security question set by you.";
            labelPassForgetSeq.text="Seq Ques : "+sec_ques+"...";

        }
        else{
            var errorMessage  = result[1];
            console.log("errorMessage: " + errorMessage);
            labelErrorPassForget1.text=errorMessage;
            labelErrorPassForget1.visible=true;
        }
        console.log("Input Parametre: " + result);
        }
        else if(mode==1)
        {

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

    Connections{
        target: LoginManager
        onPasswordForgetResponse:{
            userInfo=response;
            passwordForgetDataGeldi(response,0);
        }
    }

}


