import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage
    tools: mainToolBar
    DeckManager {
        id: ankiDecks
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: mainToolBar

        ToolIcon {
            iconId: "icon-m-toolbar-back";
            onClicked: pageStack.pop();
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: ankiDecks.loadDecks()
        }
    }
}

