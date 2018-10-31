import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 1024
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }

    header: ToolBar {
           RowLayout {
               anchors.fill: parent
               ToolButton {
                   text: qsTr("‹")
                   onClicked: stack.pop()
               }
               Label {
                   text: "Dumper"
                   elide: Label.ElideRight
                   horizontalAlignment: Qt.AlignHCenter
                   verticalAlignment: Qt.AlignVCenter
                   Layout.fillWidth: true

               }
               ToolButton {
                   text: qsTr("‹")
                   onClicked: menu.open()
               }

           }
       }
}
