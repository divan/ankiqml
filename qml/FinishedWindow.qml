import Qt 4.7

Rectangle {
    id: finishedWindow
    color: "yellow"
    anchors.centerIn: parent
    width: parent.width * 0.8
    height: width / 2
    visible: false
    Text {
        id: finishedText
        text: "Deck is finished"
        font.pointSize: 26
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            finishedWindow.state = "";
        }
    }

    states: [
        State {
            name: "Show"
            PropertyChanges { target: finishedWindow; visible: true; }
            PropertyChanges { target: finishedText; text: Deck.DeckFinishedMsg(); }
        }
    ]
}
