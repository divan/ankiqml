import Qt 4.7

Rectangle {
    id: personalDecksWindow
    anchors.fill: parent
    ListView {
        id: personalDecksList
        anchors.fill: parent
        model: personalDecksModel
        header: PageHeader { text: qsTr("Personal Decks") }
        cacheBuffer: 10 
        delegate: Component { PersonalDeckDelegate{} }
    }

    function updateDeckList() {
        Deck.getPersonalDecks();
    }

    Component.onCompleted: {
        updateDeckList();
    }
}
