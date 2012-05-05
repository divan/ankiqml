import QtQuick 1.1
import com.nokia.meego 1.1
import com.nokia.extras 1.1

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
        visible: !emptyMsg.visible
    }

    Column {
        id: emptyMsg
        anchors.centerIn: parent
        visible: false
        spacing: 15
        width: parent.width
        Text {
            id: emptyText
            text: qsTr("No decks at this moment")
            color: "black"
            font.pointSize: 36
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
        Button {
            id: personalBtn
            text: qsTr("Get Personal Deck")
            width: parent.width * 0.75
            height: 64
            onClicked: mainPage.syncPersonalDecks()
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Button {
            id: sharedBtn
            text: qsTr("Get Shared Deck")
            width: parent.width * 0.75
            height: 64
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: false
        }
        Button {
            id: addBtn
            text: qsTr("Add New Deck")
            width: parent.width * 0.75
            height: 64
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: mainPage.addNewDeck()
        }
    }

    Component.onCompleted: {
        emptyMsg.visible = (decksModel.count() == 0);
    }
}
