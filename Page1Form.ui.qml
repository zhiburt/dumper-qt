import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import io.qt.examples.backend 1.0

Page {
    id: root
    width: 600
    height: 400

    header:    Label {
                text: qsTr(backend.userName)
                font.pixelSize: Qt.application.font.pixelSize * 2
                padding: 10
            }

    StackView {
        id: stackView
        anchors.leftMargin: 0
        anchors.topMargin: 20
        anchors.fill: parent
        initialItem: ProcesesList {
            id: listView
        }
    }

    BackEnd {
        id: backend
    }

    TextField {
        text: backend.userName
        placeholderText: qsTr("User name")
        anchors.centerIn: parent

        onTextChanged: backend.userName = text
    }
}
