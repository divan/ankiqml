import QtQuick 1.1
import com.nokia.meego 1.1

Page {
    id: deckPage
    tools: defaultTools
    property alias deckName: ankiDeck.deckName

    DeckWindow {
        id: ankiDeck
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: defaultTools 

        ToolIcon {
            iconId: "icon-m-toolbar-back";
            onClicked: {
                pageStack.pop();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-add";
            onClicked: {
                pageStack.push(Qt.createComponent("EditPage.qml"), { deckName: deckName });
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync pressed");
                Deck.Sync();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: {
                //launchMenu()
                pageStack.push(Qt.createComponent("EditCardModels.qml"), { deckName: deckName });
            }
        }
    }

    // just wrapper to be accessible from
    // other pages
    function updateDeckInfo() {
        ankiDeck.updateDeckInfo();
    }
}
