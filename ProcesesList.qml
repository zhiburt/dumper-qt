import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.4

Item {
    id: root

    ToolBar{
        id: toolBar
        y: 0
        width: 70
        height: 43
        position: ToolBar.Header
        anchors.right: parent.right
        anchors.rightMargin: 49
        wheelEnabled: false
        contentWidth: 70
        enabled: true
        contentHeight: 34
        ToolButton{
            width: 68
            height: 43
            text: qsTr("update")
            anchors.right: parent.right
            anchors.rightMargin: 2

            onClicked: listView.model.update()
        }
    }

    Item{
        anchors.topMargin: 49
        anchors.fill: parent
        Item {
            height: 25
            anchors.right: parent.right
            anchors.rightMargin: 48
            anchors.left: parent.left
            anchors.leftMargin: 48
            z: 1

            RowLayout {
                id: layout
                anchors.fill: parent

                spacing: 6
                Rectangle {
                    color: 'azure'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 50
                    Layout.preferredWidth: 100
                    Layout.maximumWidth: 300
                    Layout.minimumHeight: 15
                    Layout.preferredHeight: parent.height
                    Text {
                        anchors.centerIn: parent
                        text: "pid"
                        font.pointSize: 12
                        font.weight: Font.Bold
                        renderType: Text.NativeRendering
                    }
                }
                Rectangle {
                    color: 'plum'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.minimumHeight: 15
                    Layout.preferredHeight: parent.height
                    Text {
                        anchors.centerIn: parent
                        text: "name"
                        font.pointSize: 12
                        font.weight: Font.Bold
                    }
                }

                Rectangle {
                    color: 'brown'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: 200
                    Layout.minimumHeight: 15
                    Layout.preferredHeight: parent.height
                    Text {
                        anchors.centerIn: parent
                        text: "state"
                        font.pointSize: 12
                        font.weight: Font.Bold
                    }
                }
            }
        }


        ListView {
            id: listView
            anchors.topMargin: 8
            z: -1
            anchors.fill: parent

            topMargin: 40
            leftMargin: 48
            bottomMargin: 5
            rightMargin: 48

            spacing: 5

            model: processes
            delegate: ItemDelegate {
                width: listView.width - listView.leftMargin - listView.rightMargin

                height: 30

                onClicked: root.StackView.view.push("qrc:/ProcessView.qml", { inProcessPid: pid })

                RowLayout {
                    id: procLayout
                    anchors.fill: parent
                    spacing: 6
                    z:-1

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 100
                        Layout.maximumWidth: 300
                        Layout.minimumHeight: 15
                        Layout.preferredHeight: parent.height
                        Text {
                            anchors.centerIn: parent
                            text: qsTr(pid)

                            font.pointSize: 10
                            font.weight: Font.Medium
                        }
                    }
                    Rectangle {
                        color: "#E0EEE8"
                        Layout.fillWidth: true
                        Layout.minimumWidth: 100
                        Layout.preferredWidth: 200
                        Layout.minimumHeight: 15
                        Layout.preferredHeight: parent.height
                        Text {
                            anchors.centerIn: parent
                            text: qsTr(name)

                            font.pointSize: 10
                            font.weight: Font.Medium
                        }
                    }

                    Rectangle {
                        color: '#F0F5E2'
                        Layout.fillWidth: true
                        Layout.minimumWidth: 100
                        Layout.preferredWidth: 200
                        Layout.minimumHeight: 15
                        Layout.preferredHeight: parent.height
                        Text {
                            anchors.centerIn: parent
                            text: qsTr(stateProc)

                            font.pointSize: 10
                            font.weight: Font.Medium
                        }
                    }
                }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_width:70}
}
 ##^##*/
