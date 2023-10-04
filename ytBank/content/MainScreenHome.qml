import QtQuick 2.15
import QtQuick.Controls 2.15
import ytBank

Item {
    width: Constants.width
    height: Constants.height
    MouseArea{
        z:0
        x:parent.x+sideInMainScreen.width
        width: parent.width-sideInMainScreen.width
        height:parent.height
        id: mouseArea

        //anchors.fill: parent
        //focus: true

        propagateComposedEvents: true
        //onClicked: focus = true
        onClicked: {
            console.log("we clicked ")
            focus= true;

            if (sideInMainScreen.state === "WideState") {
                    // SideBar üzerine tıklandı, ancak WideState durumunda değilse daraltın
                    console.log("Slider Üzerine tiklandı")
                    sideInMainScreen.state = "NarrowState"
                }
                    }

    }

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color:  Constants.color2


    }

    SideBar{
        z:2
        id:sideInMainScreen

        state:"WideState" //"NarrowState"

    }

    StackView{
        z: 1
        id: stackMain
        x:sideInMainScreen.sideBarNarrowWidth
        y:0
        width: parent.width - sideInMainScreen.sideBarNarrowWidth
        height: parent.height
        initialItem:mainWellcome
        focus: true

       Component{id:mainWellcome;MainWellcome{}}
    }



}
