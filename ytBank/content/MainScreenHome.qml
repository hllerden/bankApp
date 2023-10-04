import QtQuick 2.15
import QtQuick.Controls 2.15
import ytBank

Page {
    width: Constants.width
    height: Constants.height
    MouseArea{

        anchors.fill: parent
        focus: true

        //propagateComposedEvents: true

    }
    Rectangle {
        anchors.fill: parent
        color:  Constants.color2
    }

    SideBar{
        z:2
        id:sideInMainScreen

       // state: NarrowState
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
