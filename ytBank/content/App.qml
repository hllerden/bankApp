// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Window
import ytBank
import QtQuick.VirtualKeyboard 6.2
import QtQuick.VirtualKeyboard.Settings
import QtQuick.Controls
import QtQuick.Layouts 1.3


Window {
    id: rootapp
    width: Constants.width
    height: Constants.height
    maximumWidth: Constants.width
    maximumHeight: Constants.height
    minimumWidth: Constants.width
    minimumHeight: Constants.height
    visible: true
    title: "YTB Bank     |     Yatır Bank Müşteri Özel İlgilenme Alanı"


    // global bool değişkeni yaz
    property bool stackviewWhichPageOpen: false


    Flickable {
        id: flickableLogin
        anchors.fill: parent
        anchors.bottomMargin: 0 // klavye açıldığında boyutu
        contentHeight: parent.height// * 0.9
        contentY: 0
        anchors.topMargin: 0

        contentWidth: parent.width
        interactive: false // ne zaman true olacağı
        flickableDirection: Flickable.VerticalFlick
        boundsBehavior: Flickable.StopAtBounds // StopAtBounds özelliğini etkinleştir

        property real scrollMarginVertical: 20

        ScrollBar.vertical: ScrollBar {}


        // add stackwiew
        StackView {
                id: stackView
                initialItem:  loginPage
                anchors.fill: parent

        }
        Component {
            id: loginPage
            LoginMain {
            }
        }



    }

  /*Component {
            id: passForgetPage
            Page
        }*/

    // add "passForgetPage.qml" page as contentItem.



    //----------- Auto created for keyboard----------------
    // @disable-check M301
    InputPanel {
        id: inputPanel
        z:0
        property bool showKeyboard :  active
      //  signal keyboardActiveChanged(bool isActive)

        y: showKeyboard ? parent.height - height : parent.height
        Behavior on y {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
        //anchors.leftMargin: Constants.width/10
        //anchors.rightMargin: Constants.width/10
        anchors.left: parent.left
        anchors.right: parent.right

        onShowKeyboardChanged:
        {
            // showKeyboard ? keyboardActiveChanged(true) : keyboardActiveChanged(false);
            if(showKeyboard)
            {   flickableLogin.anchors.bottomMargin=inputPanel.height; // klavye açıldığında boyutu

                var focusedItem = Qt.inputMethod.focusedItem;
               // var parentPosition = mapToItem(null, 0, 0);
               // console.log("InnerRect'in parent üzerindeki pozisyonu:", parentPosition.x, parentPosition.y);
                //flickableLogin.contentY = focusedItem.y - flickableLogin.height / 2 + focusedItem.height / 2;

                flickableLogin.interactive= true;
                //flickable fokuslanan itemi scroolunda ortalasın diye

                flickableLogin.contentY = (Constants.height-inputPanel.height)-125; // İstediğiniz miktarı ayarlayabilirsiniz
                console.log("Cons-input : ",(Constants.height-inputPanel.height));

                console.log("Klavye aktif.");

                console.log(showKeyboard);
            }
            else if(!showKeyboard)
            {
                flickableLogin.contentY = 0; // İçeriği en üst konuma alır
                flickableLogin.anchors.bottomMargin=0; // klavye açıldığında boyutu
                flickableLogin.interactive= false;
                console.log("Klavye pasif.");

                console.log(showKeyboard);
            }

            /*
            //  BU kod bir sinyal ve connect örneğidir
            showKeyboard ? keyboardActiveChanged(true) : keyboardActiveChanged(false);
            console.log(showKeyboard);
            */
        }
        // function keyboardActiveChanged() {
        //     console.log("Klavye aktif.");
        //     flickableLogin.interactive= true;
        //     flickableLogin.anchors.bottomMargin=inputPanel.height; // klavye açıldığında boyutu
        // }
         //-----------------------------------------------------
    }
    /*
    Connections
    {
       target: loginManager
       onloginResult:
       {
           console.log("Login başarılı mı bilmiyorum?");
           if (success) {
                       console.log("Login başarılı");
                       stackView.push("Screen02.ui.qml");
                   }
           else {
                       console.log("Login başarısız");
                       stackView.push("Screen01.ui.qml");
                   }
       }

    }
    */
}




//********* Input panel sinyalli örnek*****************************

//----------- Auto created for keyboard----------------
/*
InputPanel {
    id: inputPanel
    property bool showKeyboard :  active
    signal keyboardActiveChanged(bool isActive)

    y: showKeyboard ? parent.height - height : parent.height
    Behavior on y
    {
        NumberAnimation
        {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }
    // anchors.leftMargin: Constants.width/10
    // anchors.rightMargin: Constants.width/10
    anchors.left: parent.left
    anchors.right: parent.right

    onShowKeyboardChanged:
    {

        //  BU kod bir sinyal ve connect örneğidir
        showKeyboard ? keyboardActiveChanged(true) : keyboardActiveChanged(false);
        console.log(showKeyboard);

    }
}

function keyboardActiveChanged()
{
    console.log("Klavye aktif.");
    flickableLogin.interactive= true;
    flickableLogin.anchors.bottomMargin=inputPanel.height; // klavye açıldığında boyutu
}
//-----------------------------------------------------


*/



