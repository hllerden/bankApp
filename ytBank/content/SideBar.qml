import QtQuick 2.15
import QtQuick.Controls 2.15
import ytBank 1.0

Item {
    id:sideBar
    width: 60
    //parent.width/15 //  parent.width
    height: 600
    // parent.height
    //property width expandedWidth: 150
    property int sideBarNarrowWidth: 60
    property int sideBarWideWidth: 150
    state : "NarrowState"

            states: [
                // This is available in all editors.

                State {
                    name: "NarrowState"
                    PropertyChanges {
                        target: sideBar


                        width:sideBarNarrowWidth
                    }
                },
                State {
                    name: "WideState"
                    PropertyChanges {
                        target: sideBar

                        width:sideBarWideWidth

                    }
                }
            ]
            // Side menu'nun durumu değiştiğinde animasyonlu geçiş
                    transitions: Transition {
                        NumberAnimation {
                            properties: "width"
                            duration: 250 // Animasyon süresi
                            easing.type: Easing.InOutQuad // Animasyon eğrisi
                        }
                    }

    Rectangle{

        visible:true
        id: rectsideBar
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        //radius: 2
        border.color: "#5d5d5d"
        border.width:1


        gradient: Gradient {
            orientation: Gradient.Horizontal
            /*
            GradientStop {
                position: 0
                color: "#09203f"
            }


            GradientStop {
                position: 1
                color: "#537895"
            }
            */
            GradientStop {
                position: 0.0
                //color:Qt.darker(Constants.color1,1.3)
                color:Qt.darker(Constants.color4,1.3)
            }


            GradientStop {
                position: 1
                color: Constants.color4
            }
        }




        Column {
            id: columnSideBar

            width: parent.width
            height: 600
            spacing: 20
            topPadding: 15
            leftPadding: 8

            SideBarButton{
                x:0
                y:0
            //    width: 43
            //    height: 43
                id:logoMenuSide
                buttonImageSource:"logo/side/menu_white_ebe9ea.svg";
               // anchors.horizontalCenter: parent.horizontalCenter // Dikey hizalama
                buttonExpanded:(sideBar.state === "NarrowState") ? false:true
                buttonLabelTextWhenExpand:"Menu"
                animasyonDurumu: (sideBar.state === "NarrowState") ? "NarrowState":"WideState"
                MouseArea{
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    onClicked: {
                        //console.log(sideBar.state)
                        if (sideBar.state === "NarrowState") {
                            console.log("WideState")
                            sideBar.state = "WideState";
                        } else {
                            console.log("NarrowState")
                            sideBar.state = "NarrowState";
                        }
                    }
                }
            }
            SideBarButton{
                y:51
                id:logoHomeSide
                x: 0
                buttonImageSource:"logo/side/home_white_ebe9ea.svg";
                //anchors.horizontalCenter: parent.horizontalCenter // Dikey hizalama
                buttonExpanded:(sideBar.state === "NarrowState") ? false:true
                buttonLabelTextWhenExpand:"Home"


            }
            SideBarButton{
                y:100
                id:logoPersonSide
                buttonImageSource:"logo/side/person_white_ebe9ea.svg";
                //anchors.horizontalCenter: parent.horizontalCenter // Dikey hizalama
                buttonExpanded:(sideBar.state === "NarrowState") ? false:true
                buttonLabelTextWhenExpand:"Person"

            }
            }
    }
}





