import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.2
import io.qt.examples.backend 1.0

Page {
    id: root
    width: 600
    height: 400

    header: Label {
        text: qsTr(backend.userName)
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    StackView {
            id: stackView
            anchors.fill: parent
            initialItem: ProcesesList{}
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
