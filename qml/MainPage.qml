import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage
    tools: mainToolBar
    DeckManager {
        id: ankiDecks
        anchors.centerIn: parent
    }
    AddNewDialog {
        id: addNewDialog
        onAccepted: {
            var name = addNewDialog.getName();
            if (Deck.addDeck(name))
            {
                pageStack.push(Qt.createComponent("DeckPage.qml"), { deckName: name });
                updateDecks();
            }
        }
    }

    ToolBarLayout {
        id: mainToolBar

        ToolIcon {
            iconId: "icon-m-toolbar-add";
            onClicked: {
                addNewDialog.open();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync decks pressed");
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: {
                updateDecks();
            }
            anchors.right: (parent === undefined) ? undefined : parent.right
        }
    }

    function updateDecks()
    {
        decksModel.populate();
    }
    
    Component.onCompleted: mainPage.updateDecks()
}
