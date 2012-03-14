import QtQuick 1.1
import com.nokia.meego 1.1

Page {
    id: studyPage
    property alias deckPath: ankiStudy.deckPath
    StudyWindow {
        id: ankiStudy
        anchors.centerIn: parent
    }

    ToolBarLayout {
        id: defaultTools 

        ToolIcon {
            iconId: "icon-m-toolbar-back";
            onClicked: {
                ankiStudy.endStudy();
                pageStack.pop();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-edit"
            onClicked: {
                pageStack.push(Qt.createComponent("EditPage.qml"), { deckPath: deckPath, factId: Deck.getFactInfo("id") });
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: studyMenu.open()
        }
    }
    
    Menu {
        id: studyMenu
        content: MenuLayout {
            MenuItem {
                text: qsTr("Undo")
                onClicked: console.log("Undo")
            }
            MenuItem {
                text: qsTr("Delete Card")
                onClicked: console.log("Delete Card")
            }
        }
    }

    function onFactUpdated()
    {
        ankiStudy.showNextCard();
    }

    Component.onCompleted: { ankiStudy.startStudy(); }

    onStatusChanged: {
        // restore toolbar after StudyWindow
        if (status == PageStatus.Active) {
            sharedToolBar.setTools(defaultTools);
            sharedToolBar.visible = true;
        }
    }
}
