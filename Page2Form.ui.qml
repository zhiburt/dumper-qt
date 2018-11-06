import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root
    width: 600
    height: 400
    background: black

    property int  switchOneInfo: (switch1.checked) ? 0 : 1
    property int  switchTwoInfo: (switch2.checked) ? 0 : 1


    header: Label {
        text: qsTr("settings")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    GroupBox {
        id: groupBox
        y: 6
        height: 236
        anchors.right: parent.right
        anchors.rightMargin: 336
        anchors.left: parent.left
        anchors.leftMargin: 38
        title: qsTr("main settings")

        Column {
            id: column
            x: 144
            y: -84
            width: 133
            height: 142
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Switch {
                id: switch1
                text: qsTr("real addresess")
            }

            Switch {
                id: switch2
                text: "short"
            }

            Switch {
                id: switch3
                text: qsTr("something")
            }
            spacing: 20
            z: 1
        }
    }

    GroupBox {
        id: groupBox1
        y: 6
        height: 236
        anchors.left: groupBox.right
        anchors.leftMargin: 68
        anchors.right: parent.right
        anchors.rightMargin: 40
        title: qsTr("next update settings ")

        Slider {
            id: slider
            x: 6
            y: 16
            value: 0.5
        }

        Dial {
            id: dial
            x: 60
            y: 82
            width: 93
            height: 97
        }

        Label {
            id: label
            x: 6
            y: 0
            text: qsTr("something")
        }

        Label {
            id: label1
            x: 6
            y: 59
            text: qsTr("something else")
        }
    }
}


/*##^## Designer {
    D{i:8;anchors_width:226;anchors_x:17;anchors_y:6}D{i:10;anchors_width:226;anchors_x:321}
}
 ##^##*/
