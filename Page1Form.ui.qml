import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import io.qt.examples.backend 1.0

Page {
    id: root
    width: 600
    height: 400

    property int settingsAddr: 1
    property int settingsCont: 1

    header:    Label {
        text: qsTr("Processes")
        font.pixelSize: Qt.application.font.pixelSize * 2
            }

    StackView {
        id: stackView
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        initialItem: ProcesesList {
            id: listView
            settingsAddresses: settingsAddr
            settingsContent: settingsCont
        }
    }

    /*BackEnd {
        id: backend
    }

    TextField {
        text: backend.userName
        placeholderText: qsTr("User name")
        anchors.centerIn: parent

        onTextChanged: backend.userName = text
    }
    */
}
