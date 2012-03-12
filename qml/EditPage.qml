import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: editPage
    tools: defaultTools
    property alias deckPath: ankiEdit.deckPath
    EditWindow {
        id: ankiEdit
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
        ToolButton {
            id: addButton
            text: "Add"
            onClicked: {
                ankiEdit.addFact();
                deckPage.updateDeckInfo();
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
        }
    }
}
