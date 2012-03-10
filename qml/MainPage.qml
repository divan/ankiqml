import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage
    DeckManager {
        id: ankiDecks
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: mainToolBar

        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: ankiDecks.loadDecks()
            anchors.right: (parent === undefined) ? undefined : parent.right
        }
    }

    onStatusChanged: {
        // restore toolbar after StudyWindow
        if (status == PageStatus.Active) {
            sharedToolBar.setTools(mainToolBar);
            sharedToolBar.visible = true;
        }
    }
}

