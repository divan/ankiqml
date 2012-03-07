import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: editWindow
    anchors.fill: parent
    property string deckPath: ""

    Column {
        width: parent.width * 0.9
        anchors.centerIn: parent
        Text {
            id: nameText
            font.pointSize: 24
            font.bold: true
        }

        Row {
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                Button {
                    text: qsTr("Start Reviewing")
                    height:  200
                    width: editWindow.width * 0.6
                } 
            }
            Column {
                Button {
                    text: qsTr("Limit")
                    height: 100
                    width: editWindow.width * 0.3
                } 
                Button {
                    text: qsTr("Cram")
                    height: 100
                    width: editWindow.width * 0.3
                } 
            }
        }
        Row {
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: qsTr("Statistics")
                height: 90
                width: editWindow.width * 0.4
            } 
            Button {
                text: qsTr("Card Browser")
                height: 90
                width: editWindow.width * 0.4
            } 
        }
    }

    Component.onCompleted: {
        Deck.openDeck(deckPath);
//        nameText.text = Deck.
        Deck.closeDeck();
    }
}
