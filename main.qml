import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.leftMargin: 64
        anchors.topMargin: 10
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            id: pageFirst
            settingsAddr: pageSecond.switchOneInfo
            settingsCont: pageSecond.switchTwoInfo
        }

        Page2Form {
            id: pageSecond
        }
    }


    Item { //base component
                    id: baseBar
                    width: but1.height // width as TabBar height before rotation
                    height: parent.height

                    TabBar {
                        id: tabBar
                        width: parent.height
                        height: but1.height
                        currentIndex: swipeView.currentIndex

                        transform: [
                            Rotation { origin.x: 0; origin.y: 0; angle: -90} // rotate around the upper left corner counterclockwise
                            ,Translate { y: baseBar.height; x: 0 } // move to the bottom of the base
                        ]

                        TabButton {
                            id: but1
                            text: qsTr("Processes")
                        }
                        TabButton {
                            text: qsTr("Settings")
                    } //TabBar
                } //Item
}

    header: MenuBar {
        id: mainMenuBar
        currentIndex: swipeView.currentIndex

        MenuBarItem{
            text: qsTr("File")
            menu: Menu{
                MenuItem{
                    text: qsTr("Open")
                }

                MenuItem{
                    text: qsTr("Save")
                }

                MenuItem{
                    text: qsTr("...")
                }


                MenuItem{
                    text: qsTr("...")
                }
            }
        }

        MenuBarItem{
            text: qsTr("Help")
        }


        MenuBarItem{
            text: qsTr("...")
        }
    }
}
