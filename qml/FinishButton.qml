import Qt 4.7


Rectangle {
    id: finishButton
    width: 100
    height: 100
    anchors.top: parent.top
    anchors.right: parent.right
    opacity: 0.75
    color: "blue"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.state = "DeckManager"; 
            Deck.FinishDeck();
        }
    }
}

