import QtQuick 1.1
import com.nokia.meego 1.1
import com.nokia.extras 1.1

Rectangle {
    id: deckWindow
    anchors.fill: parent
    property string deckName: ""
    Image {
        fillMode: Image.Tile
        source: "../images/wood.jpg"
    }

    Rectangle {
        x: 30
        y: 40
        height: deckWindow.height * 0.9
        width: deckWindow.width * 0.9
        color: "white"
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 7
    }
    Rectangle {
        x: 26
        y: 36
        height: deckWindow.height * 0.9
        width: deckWindow.width * 0.9
        color: "white"
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 7
    }
    Rectangle {
        x: 23
        y: 33
        height: deckWindow.height * 0.9
        width: deckWindow.width * 0.9
        color: "white"
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 7
    }
    Rectangle {
        x: 20
        y: 30
        height: deckWindow.height * 0.9
        width: deckWindow.width * 0.9
        color: "white"
        border.color: "black"
        border.width: 1
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 7
        Rectangle {
            height: deckWindow.height * 0.85
            width: deckWindow.width * 0.85
            color: "transparent"
            border.color: "gray"
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 7
        }
        Text {
            id: nameText
            width: parent.width * 0.9
            font.bold: true
            font.pointSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 5
            wrapMode: Text.Wrap
            y: 20
        }

        Text {
            id: factsText
            width: parent.width
            font.pointSize: 24
            font.bold: true
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 60
            anchors.top: nameText.bottom
        }
        Button {
            id: cramButton
            text: qsTr("Cram")
            height: 100
            width: (screen.currentOrientation == Screen.Portrait) ? parent.width * 0.9 : 250
            checkable: true
            anchors.left: parent.left
            anchors.bottom: startButton.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 30
        }

        Button {
            id: startButton
            text: ""
            height: 150
            width: (screen.currentOrientation == Screen.Portrait) ? parent.width * 0.9 : 150
            font.pointSize: 32
            font.bold: true
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 30
            anchors.horizontalCenter: parent.horizontalCenter
            iconSource: "../images/start.png"
            onClicked: {
                var mode = "normal"; // "cram", "learnMore", "reviewEarly"
                if (cramButton.checked)
                    mode = "cram";
                pageStack.push(Qt.resolvedUrl("StudyPage.qml"), { deckName: deckName, mode: mode });
            }
        }
    }

    function updateDeckInfo() {
        Deck.openDeck(deckName);
        nameText.text = Deck.getDeckInfo("name");
        factsText.text = Deck.getDeckInfo("factCount") + " " + qsTr("facts");
        Deck.closeDeck();
    }

    Component.onCompleted: updateDeckInfo()
}
