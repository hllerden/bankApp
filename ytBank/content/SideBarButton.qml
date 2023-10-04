import QtQuick 6.2


import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Item {
    property alias buttonImageSource: imageButton.source
    property alias buttonLabelTextWhenExpand:label.text
    property alias animasyonDurumu:rectangleBack.state
    property alias imageLabelWidth:label.width
    property bool buttonExpanded :false
    property int recCerceveGenislet : 2

    id:rootSidebarButton
    x:0
    y:0
    width:buttonExpanded ? 132 : imageButton.width+label.width+2
    height: imageButton.height
    Rectangle{
        id:rectangleBack
        height:parent.height+(4+(recCerceveGenislet*2))
        x:-(2+recCerceveGenislet)
        y:-(2+recCerceveGenislet)
        //width:parent.width
        color: "#1f1f1f"
        radius: 10
        opacity: 0.5
        /*  // animasyon istiyorsan state olacak
        transitions: Transition {
            NumberAnimation {
                properties: "parent.width"
                duration: 250 // Animasyon süresi
                easing.type: Easing.InOutQuad // Animasyon eğrisi

            }
        }
        */

        state : buttonExpanded ? "WideState": "NarrowState"

                states: [
                    // This is available in all editors.

                    State {
                        name: "NarrowState"
                        PropertyChanges {
                            target: rectangleBack


                            width:imageButton.width+(4+recCerceveGenislet*2)
                        }
                    },
                    State {
                        name: "WideState"
                        PropertyChanges {
                            target: rectangleBack

                            width:132+(4+recCerceveGenislet*2)

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

    }

    Image {
        id: imageButton
        width:40
        height:40
        source: "logo/side/home_white_ebe9ea.svg"

        Label {
            visible:buttonExpanded
            id: label
            text: qsTr("Menu")
            font.pixelSize: 25
            color: "#ebe9ea"
            width: buttonExpanded ? implicitWidth : 0 // buttonExpanded true olduğunda implicitWidth kadar geniş, aksi takdirde 0 genişlikte

            x: imageButton.x + imageButton.width + 5
            y: imageButton.y + (imageButton.height - height) / 2 // Yüksekliği ortalamak için
            /*Behavior on visible {
                            NumberAnimation {
                                duration: 275 // 0.5 saniyede yavaşça kaybolması için
                                easing.type: Easing.InOutQuad // Animasyon eğrisi

                            }
                        }*/
          /*  transitions: Transition {
                NumberAnimation {
                    properties: "width"
                    duration: 250 // Animasyon süresi
                    easing.type: Easing.InOutQuad // Animasyon eğrisi
                }
            }*/
        }
        //mipmap: true



    }




}
