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
            iconId: "icon-m-toolbar-add";
            onClicked: {
                pageStack.push(Qt.resolvedUrl("EditPage.qml"), { deckPath: deckPath });
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-refresh";
            onClicked: {
                console.log("Sync pressed");
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }

    onStatusChanged: {
        // restore toolbar after StudyWindow
        if (status == PageStatus.Active) {
            sharedToolBar.setTools(defaultTools);
            sharedToolBar.visible = true;
            ankiDeck.updateDeckInfo();
        }
    }
}
