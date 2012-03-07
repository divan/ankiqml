import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: editWindow
    anchors.fill: parent
    color: "#777777"
    property string deckPath: ""

    Column {
        width: parent.width * 0.9
        anchors.centerIn: parent
        spacing: 5
        Text {
            id: nameText
            text: "Spanish Names"
            font.pointSize: 42
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: name1Text
            text: "34 cards available"
            font.pointSize: 24
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row {
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            Column {
                Button {
                    text: qsTr("Start Reviewing")
                    height: 200
                    width: editWindow.width * 0.6
                    font.pointSize: 28
                    onClicked: { pageStack.push(Qt.resolvedUrl("StudyPage.qml"), { deckPath: deckPath });
 }
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
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: qsTr("Statistics")
                height: 90
                width: editWindow.width * 0.44
            } 
            Button {
                text: qsTr("Card Browser")
                height: 90
                width: editWindow.width * 0.44
            } 
        }
    }

    Component.onCompleted: {
        Deck.openDeck(deckPath);
//        nameText.text = Deck.
        Deck.closeDeck();
    }
}
