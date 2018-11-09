import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.4

import io.qt.examples.processdump 1.0

Page {
    id: root

    property string inProcessPid
    property ProcessDump dump: null


    header: ToolBar {
        id: toolBar
        ToolButton {
            text: qsTr("Back")
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pointSize: 9
            anchors.verticalCenter: parent.verticalCenter
            onClicked: root.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: inProcessPid
            font.pixelSize: 20
            anchors.centerIn: parent
        }

        RowLayout {
                id: rowLayout
                anchors.bottomMargin: 0
                anchors.right: parent.right
        }
    }

    Pane {
        id: pane
        anchors.top: parent.top
        anchors.topMargin: 24
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        Layout.fillWidth: true

        RowLayout {
            width: parent.width

            TextArea {
                id: messageField
                Layout.fillWidth: true
                placeholderText: qsTr("Compose chane of bytes (in hex)")
                wrapMode: TextArea.Wrap
            }

            Button {
                id: sendButton
                text: qsTr("search")
                enabled: messageField.length > 0

                onClicked: label.text = dump.searchChaneOfBytes(messageField.text)
            }
        }
    }

    Label {
        id: label
        y: 88
        text: qsTr("Total match")
        anchors.right: parent.right
        anchors.rightMargin: 544
        anchors.left: parent.left
        anchors.leftMargin: 13
    }
}
/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:480;anchors_width:640;anchors_x:0;anchors_y:0}
D{i:4;anchors_height:35;anchors_width:640;anchors_x:0;anchors_y:0}
}
 ##^##*/

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
