import QtQuick 1.1
import com.nokia.meego 1.1

Dialog {
    id: addNewDialog
    title: Item {
        height: addNewDialog.platformStyle.titleBarHeight
        Text {
            font.pointSize: 22
            font.bold: true
            color: "white"
            text: qsTr("New Deck")
        }
    }
    content: Item {
        id: deckContent
        height: childrenRect.height
        Column {
            Text {
                text: qsTr("Enter Deck name:")
                color: "white"
                font.pointSize: 18
            }
            TextField {
                id: deckNameField
            }
        }
    }
    buttons: ButtonRow {
        width: parent.width * 0.8
        platformStyle: ButtonStyle { }
        anchors.horizontalCenter: parent.horizontalCenter
        Button {text: qsTr("Add"); onClicked: addNewDialog.accept()}
        Button {text: qsTr("Cancel"); onClicked: addNewDialog.reject()}
    }

    function getName() {
        return deckNameField.text;
    }
}
