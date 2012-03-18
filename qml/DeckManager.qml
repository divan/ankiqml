import QtQuick 1.1

Rectangle {
    id: deckManager
    anchors.fill: parent
    ListView {
        id: decksList
        anchors.fill: parent
        model: decksModel
        header: PageHeader { text: qsTr("Decks") }
        cacheBuffer: 800 
        delegate: Component { DeckListDelegate{} }
    }
}
