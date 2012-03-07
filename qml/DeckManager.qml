import Qt 4.7

Rectangle {
    id: deckManager
    anchors.fill: parent
    ListView {
        anchors.fill: parent
        model: decksModel
        header: Component {
            Rectangle {
                height: 80
                width: parent.width
                color: "#444"
                Text {
                    text: qsTr("Decks")
                    anchors.centerIn: parent
                    font.pointSize: 32
                    color: "white"
                }
            }
        }
        delegate: Component { DeckListDelegate{} }
    }
}
