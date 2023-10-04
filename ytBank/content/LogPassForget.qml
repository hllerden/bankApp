import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.VirtualKeyboard
import ytBank



Item {
    id: forgetPassPageBase
    anchors.fill: stackViewLogin
    visible:true

    property var userInfo: null
    property bool flagPassCheckRule1: false // Şifre geçerliliğini göstermek için bir bayrak1 6-32
    property bool flagPassCheckRule2: false // Şifre geçerliliğini göstermek için bir bayrak2 Büyük Küçük Farkı
    property bool flagPassCheckRule3: false // Şifre geçerliliğini göstermek için bir bayrak3 iki şifre uyumlu
    property int modePasswordForgetForDB: 0

    Rectangle {
        visible:true

        id: forgetPassPage1
        anchors.fill: parentduration
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: Constants.basegroundColor

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
            Keys.onTabPressed: {
                textFieldforgetEmail.focus=true

            }
            Keys.onEnterPressed: {
                textFieldforgetEmail.focus=true

            }
            Keys.onReturnPressed:
            {
                textFieldforgetEmail.focus=true

            }
        }

        ButtonStyle1 {
            id: forgetPassPage1Button
            x: 75
            y: 297
            width: 310
            height: 52
            text: qsTr("Continue")
            contentItemTextColor: "#ffffff"
            backgroundDefaultColor: "#e2ae38"
            onClicked: {
                modePasswordForgetForDB=0;
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
                    // console.log("Login result1:", success);
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

            Keys.onTabPressed:{ //textFieldPassword.forceActiveFocus()
                forgetPassPage1Button.focus=true

            }
            Keys.onEnterPressed: {
                forgetPassPage1Button.forceActiveFocus()
                forgetPassPage1Button.clicked();
            }
            Keys.onReturnPressed: {
                forgetPassPage1Button.forceActiveFocus()
                forgetPassPage1Button.clicked();
            }
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

        color: Constants.basegroundColor
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
            id: forgetPassPage2Button
            x: 75
            y: 297
            width: 310
            height: 52
            text: qsTr("Continue")
            contentItemTextColor: "#ffffff"
            backgroundDefaultColor: "#e2ae38"
            onClicked: {
               if(textFieldPassForgetSecAns.text==userInfo[1].sec_ans){
                    // console.log("Güvenlik Sorusu Doğru");
                    forgetPassPage2.visible=false;
                   forgetPassPage3.visible=true;
                }
                else{

                    // console.log("Güvenlik Sorusu Yanlış.");
                   // console.log("doğrusu: >"+userInfo[1].sec_ans+"<girdiğin: >"+textFieldPassForgetSecAns.text+"<");

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
            Keys.onTabPressed:{ //textFieldPassword.forceActiveFocus()
                forgetPassPage2Button.focus=true

            }
            Keys.onEnterPressed: {
                forgetPassPage2Button.forceActiveFocus()
                forgetPassPage2Button.clicked();
            }
            Keys.onReturnPressed: {
                forgetPassPage2Button.forceActiveFocus()
                forgetPassPage2Button.clicked();
            }
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
        anchors.fill: parent
        width: stackViewLogin.width
        height: stackViewLogin.height

        color: Constants.basegroundColor
        Image {
        id: backImage3
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
            id: label35
            x: 158
            y: 25
            text: qsTr("Yatır Bank")
            font.pixelSize: 30
            layer.enabled: false
        }
        Rectangle {
        id: __multi__selection1__

        TextField {
            id: newPasswordForget
            x: 75
            y: 128
            width: 310
            height: 41
            scale: 1
            selectionColor: "#232323"
            background: Rectangle {
            radius: 5
            border.color: "#707070"
            border.width: 1
            Image {
                id: imageTextField2
                x: parent.x+9
                width: 20
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Image.AlignLeft
                source: "logo/password_textField.svg"
                }
            }
            placeholderText: qsTr("New Password")
            onTextChanged: { checkPassword(text);text = text.replace(/\s/g, "");}
            leftPadding: imageTextField.width+15
            Keys.onTabPressed: {
                textFieldforgetEmail.focus=true

            }
            Keys.onEnterPressed: {
                textFieldforgetEmail.focus=true

            }
            Keys.onReturnPressed:
            {
                textFieldforgetEmail.focus=true

            }

        }


        ButtonStyle1 {
            id: forgetPassPage3Button
            x: 75
            y: 297
            width: 310
            height: 52
            text: qsTr("Continue")
            contentItemTextColor: "#ffffff"
            backgroundDefaultColor: "#e2ae38"
            onClicked: {
                modePasswordForgetForDB=1;
                //loginManager.login(customeridTxt.text,passwordTxt.text)
                if(flagPassCheckRule1&flagPassCheckRule2&flagPassCheckRule3)
                {
                   LoginManager.loginPassForget2(userInfo[1].username,userInfo[1].email,newPasswordConfirmForget.text);
                }







            }
            buttonDropShadow: false
            anchors.horizontalCenterOffset: 0
            Connections {
                target: LoginManager
                onLoginResult: {
                    // console.log("Login result1:", success);
                    if(success){
                        //stackView.push("passwordForgetPage.qml")
                    }
                }
            }
        }

        TextField {
            id: newPasswordConfirmForget
            x: 75
            y: 226
            width: 310
            height: 41
            scale: 1
            selectionColor: "#232323"
            background: Rectangle {
                radius: 5
                border.color: "#707070"
                border.width: 1
                Image {
                    id: imageTextField3
                    x: parent.x+9
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Image.AlignLeft
                    source: "logo/password_textField.svg"
                }
            }
            placeholderText: qsTr("New Password Confirm")
            leftPadding: imageTextField1.width+15
            onTextChanged: confirmPasswords(newPasswordForget.text,text)

            Keys.onTabPressed:{ //textFieldPassword.forceActiveFocus()
                forgetPassPage1Button.focus=true

            }
            Keys.onEnterPressed: {
                forgetPassPage1Button.forceActiveFocus()
                forgetPassPage1Button.clicked();
            }
            Keys.onReturnPressed: {
                forgetPassPage1Button.forceActiveFocus()
                forgetPassPage1Button.clicked();
            }
        }
        }

        Label{
            id:labelPassCheckRule1
            x: 82
            y: 178
            width: 268
            height: 17
            font.pixelSize: 10
            text:"Between 6 and 32 characters long"
            leftPadding: imagePassCheckRule1.width+15

            Image {
                id: imagePassCheckRule1


                width: 10
                height: 10
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Image.AlignLeft
                source: flagPassCheckRule1 ? "logo/checkMarkBlack.svg":"logo/denailMarkBlack.svg"
                anchors.verticalCenterOffset: -1
            }

        }
        Label{
            id:labelPassCheckRule2
            x: 82
            y: 193
            width: 268
            height: 17
            font.pixelSize: 10
            text:"Use a mix of letters, numbers or symbols"
            leftPadding: imagePassCheckRule1.width+15

            Image {
                id: imagePassCheckRule2


                width: 10
                height: 10
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Image.AlignLeft
                source: flagPassCheckRule2 ? "logo/checkMarkBlack.svg":"logo/denailMarkBlack.svg"
                anchors.verticalCenterOffset: -1
            }

        }
        Label{
            id:labelPassCheckRule3
            x: 82
            y: 273
            width: 268
            height: 17
            font.pixelSize: 10
            text:"Password fields must match"
            leftPadding: imagePassCheckRule1.width+15

            Image {
                id: imagePassCheckRule3


                width: 10
                height: 10
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Image.AlignLeft
                source: flagPassCheckRule3 ? "logo/checkMarkBlack.svg":"logo/denailMarkBlack.svg"
                anchors.verticalCenterOffset: -1
            }

        }

        Label {
            id: label45
            x: 74
            y: 75
            width: 75
            height: 18
            text: "Identification successful, \nplease enter a new password"
            font.pixelSize: 15
            layer.enabled: false

        }





    }
    Rectangle {
        id:forgetPassPage4
        visible:false
        anchors.fill: parent
        width: stackViewLogin.width
        height: stackViewLogin.height

        color:Constants.basegroundColor

        Image {
        id: backImage4
        x: 150


        width: 150
        height: 150
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Image.AlignLeft
        source: "logo/confirmGreen.svg"
        anchors.verticalCenterOffset: -64

        }
        Label {
            id: label91
            x: 114
            y: 254
            text: qsTr("Password change Success!!")
            font.pixelSize: 18

            layer.enabled: false
        }
        Label {
            id: label34
            x: 158
            y: 25
            text: qsTr("Yatır Bank")
            font.pixelSize: 30
            layer.enabled: false
        }
        ButtonStyle1 {
            id: forgetPassPage4Button
            x: 75
            y: 297
            width: 310
            height: 52
            text: qsTr("Continue")
            contentItemTextColor: "#ffffff"
            backgroundDefaultColor: "#e2ae38"
            onClicked: {
                forgetPassPage4.visible=false;
                forgetPassPage1.visible=true;
                stackViewLogin.pop(null);

                listOpenPages();

            }
            buttonDropShadow: false
            anchors.horizontalCenterOffset: 0
            Connections {
                target: LoginManager
                onLoginResult: {
                    // console.log("Login result1:", success);
                    if(success){
                        //stackView.push("passwordForgetPage.qml")
                    }
                }
            }
        }

    }

    function confirmPasswords(password1,password2)
    {

        flagPassCheckRule3 = (password1==password2)
        return flagPassCheckRule3
    }

    function checkPassword(password) {
           // Şifre kontrol koşulları
           flagPassCheckRule1 = password.length >= 6 && password.length <= 32 ? 1 : 0
           // console.log("6-32 arasında mı: "+flagPassCheckRule1)
           if(flagPassCheckRule1)
           {
               var regex1 = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,32}$/

               flagPassCheckRule2 = regex1.test(password) ? 1 : 0
               // console.log("regex1 testi: "+flagPassCheckRule2)
           }
           else
           {
               flagPassCheckRule2 = 0
           }

       }
    function passwordForgetDataGeldi(result,mode) {
        // inputParam değişkenini kullanabilirsiniz
        if(mode==0)
        {
        var succes = result[0];
         // console.log("Succes: " + succes);
        if(succes){
            var username  = result[1].username;
            var password  = result[1].password;
            var email  = result[1].email;
            var firstname  = result[1].firstname;
            var lastname  = result[1].lastname;
            var age  = result[1].age;
            var sec_ques  = result[1].sec_ques;
            var sec_ans  = result[1].sec_ans;

            // console.log("userName: " + username);
            // console.log("password: " + password);
            // console.log("email: " + email);
            // console.log("firstname: " + firstname);
            // console.log("lastname: " + lastname);
            // console.log("age: " + age);
            // console.log("sec_ques: " + sec_ques);
            // console.log("sec_ans: " + sec_ans);

            // 2. sayfaya geçiliyor
            forgetPassPage1.visible=false;
            forgetPassPage2.visible=true;
            labelPassForgetname.text="Hello Dear "+firstname+" "+lastname+" \nhere is your security question set by you.";
            labelPassForgetSeq.text="Seq Ques : "+sec_ques+"...";

        }
        else{
            var errorMessage  = result[1];
            // console.log("errorMessage: " + errorMessage);
            labelErrorPassForget1.text=errorMessage;
            labelErrorPassForget1.visible=true;
        }
        //// console.log("Input Parametre: " + result);
        }
        else if(mode==1)
        {
            // mode 1 şifre başarıyla değişti demektir
            var succes = result[0];


            if(succes)
            {
               // // console.log("Password Change Succes control 1 : " + succes);
                forgetPassPage3.visible=false;
                forgetPassPage4.visible=true;
            }
            else
            {
              // // console.log("Password Change Succes: " + succes + "Error Message: ",result[1]);
            }

        }
    }

    function listOpenPages() {
        if(stackviewWhichPageOpen){
        for (var i = 0; i < stackViewLogin.depth; i++) {
            var page = stackViewLogin.get(i);
            if (page) {
               // // console.log("Açık Sayfa:", page);
            }
        }

        }
    }

    Connections{
        target: LoginManager
        onPasswordForgetResponse: {
            userInfo=response;
            passwordForgetDataGeldi(response,modePasswordForgetForDB);
        }
    }

}


