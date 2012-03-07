import Qt 4.7

Rectangle {
    id: deckManager
    anchors.fill: parent
    ListView {
        width: 600
        height: 400
        anchors.fill: parent
        model: decksModel
        header: Component {
            Rectangle {
                height: 90
                width: parent.width
                color: "gray"
                Text {
                    text: "Decks"
                    anchors.centerIn: parent
                    font.pointSize: 32
                }
            }
        }
        delegate: Component { DeckListDelegate{} }
    }
}
