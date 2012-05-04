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

    Text {
        id: emptyText
        text: qsTr("No decks at this moment")
        color: "black"
        anchors.centerIn: parent
        font.pointSize: 36
        visible: false
    }

    Component.onCompleted: {
        emptyText.visible = (decksModel.count() == 0);
    }
}
