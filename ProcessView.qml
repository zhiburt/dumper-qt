import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.4

import io.qt.examples.processdump 1.0

Page {
    id: root

    property string inProcessPid

    property variant stringList: null


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

                ToolButton {
                    id: toolButton1
                    text: qsTr("search")
                }

                ToolButton {
                    id: toolButton
                    text: qsTr("something")
                }
            }
        }


    function updateText() {
        stringList = procDump.dump.split('\n')
        idContentListView.positionViewAtEnd()
    }

    ListView {
        id: idContentListView
        model: stringList
        anchors {
            fill: parent
            margins: Dimensions.x(15)
        }

        delegate: Text {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }

            text: qsTr(model.modelData)
            font.pixelSize: Dimensions.y(10)
            textFormat: Text.PlainText
            wrapMode: Text.Wrap

            font.capitalization: Font.Capitalize
            font.family: "Courier"
        }
        ScrollBar.vertical: ScrollBar {}
    }

    ProcessDump{
        id: procDump
    }

    Component.onCompleted: {
        procDump.get(inProcessPid)
        updateText()
    }
}
/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:480;anchors_width:640;anchors_x:0;anchors_y:0}
D{i:4;anchors_height:35;anchors_width:640;anchors_x:0;anchors_y:0}
}
 ##^##*/

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3;anchors_height:480;anchors_width:640;anchors_x:0;anchors_y:0}
D{i:4;anchors_height:35;anchors_width:640;anchors_x:0;anchors_y:0}
}
 ##^##*/
