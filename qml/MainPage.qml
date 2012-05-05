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
            onClicked: addNewDeck()
        }
        ToolIcon {
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync decks pressed");
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: mainMenu.open()
            anchors.right: (parent === undefined) ? undefined : parent.right
        }
    }

    Menu {
        id: mainMenu
        content: MenuLayout {
            MenuItem {
                text: qsTr("Sync Personal Decks")
                onClicked:syncPersonalDecks()
            }
            MenuItem {
                text: qsTr("Update decks info")
                onClicked: updateDecks()
            }
            MenuItem {
                text: qsTr("Settings")
                onClicked: openSettings()
            }
        }
    }

    function updateDecks()
    {
        decksModel.populate();
    }

    function syncPersonalDecks() {
        pageStack.push(Qt.createComponent("PersonalDecksPage.qml"));
    }
    
    function openSettings() {
        pageStack.push(Qt.createComponent("SettingsPage.qml"));
    }

    function addNewDeck() {
        addNewDialog.open();
    }
    
    Component.onCompleted: mainPage.updateDecks()
}
