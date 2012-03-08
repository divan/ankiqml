import QtQuick 1.1
import com.nokia.meego 1.1

Page {
    id: deckPage
    tools: defaultTools
    property alias deckPath: ankiDeck.deckPath
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
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync pressed");
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-edit";
            onClicked: {
                console.log("Edit pressed");
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }
}
