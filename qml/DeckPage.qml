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
                decksUpdateTrigger();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync pressed");
                Deck.Sync();
                decksUpdateTrigger();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: {
                //launchMenu()
            }
        }
    }

    Component.onCompleted: {
        root.deckUpdated.connect(ankiDeck.updateDeckInfo);
    }

    onStatusChanged: {
        if (status == PageStatus.Activating)
            ankiDeck.updateDeckInfo();
    }
}
