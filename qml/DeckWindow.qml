import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: deckWindow
    anchors.fill: parent
    color: "#777777"
    property string deckPath: ""

    Column {
        width: parent.width * 0.9
        anchors.centerIn: parent
        spacing: 5
        Text {
            id: nameText
            font.pointSize: 42
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            width: parent.width
        }

        Text {
            id: factsText
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
                    width: deckWindow.width * 0.6
                    font.pointSize: 28
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("StudyPage.qml"), { deckPath: deckPath });
                    }
                } 
            }
            Column {
                Button {
                    text: qsTr("Limit")
                    height: 100
                    width: deckWindow.width * 0.3
                    checkable: true
                } 
                Button {
                    text: qsTr("Cram")
                    height: 100
                    width: deckWindow.width * 0.3
                    checkable: true
                } 
            }
        }
    }

    function updateDeckInfo() {
        Deck.openDeck(deckPath);
        nameText.text = Deck.getDeckInfo("name");
        factsText.text = Deck.getDeckInfo("factCount") + " " + qsTr("facts");
        Deck.closeDeck();
    }

    Component.onCompleted: updateDeckInfo()
}
