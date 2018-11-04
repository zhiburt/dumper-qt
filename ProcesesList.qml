import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Window 2.3

Item {
    id: root

    ListView {
           id: listView
           anchors.fill: parent
           topMargin: 48
           leftMargin: 48
           bottomMargin: 48
           rightMargin: 48
           spacing: 20

           model: processes
           delegate: ItemDelegate {
               text: pid + name + state
               width: listView.width - listView.leftMargin - listView.rightMargin
               height: avatar.implicitHeight
               leftPadding: avatar.implicitWidth + 32

               onClicked: root.StackView.view.push("qrc:/ConversationPage.qml", { inConversationWith: model.modelData })
           }

           ItemDelegate {
               id: itemDelegate
               width:  parent.width
               height: 30

               Row {
                   id: row
                   anchors.horizontalCenter: parent.horizontalCenter
                   anchors.verticalCenter: parent.verticalCenter

                   spacing: listView.height / 3
                   anchors.fill: parent
                           Rectangle { id: rectangle; width: 100; height: itemDelegate.height; radius: 20.0
                               anchors.left: parent.left
                           anchors.leftMargin: 0
                               color: "#024c1c"
                               Text {
                                   text: qsTr("hello world")
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   anchors.verticalCenter: parent.verticalCenter
                               }
                           }

                           Rectangle { id: rectangle1; width: 100; height: itemDelegate.height; radius: 20.0
                               anchors.horizontalCenter: parent.horizontalCenter
                               Text {
                                   text: qsTr("hello world")
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   anchors.verticalCenter: parent.verticalCenter
                               }
                               color: "#42a51c" }
                           Rectangle { id: rectangle2; width: 100; height: itemDelegate.height; radius: 20.0
                               anchors.right: parent.right
                           anchors.rightMargin: 20
                               color: "white"
                               Text {
                                   text: qsTr("hello world")
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   anchors.verticalCenter: parent.verticalCenter
                               }
                           }
               }
           }
       }

}
