import QtQuick 1.1
import com.nokia.meego 1.1

Page {
    id: studyPage
    tools: defaultTools
    property alias deckName: ankiStudy.deckName
    property alias mode: ankiStudy.mode
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
        ToolButton {
            id: textButton
            property int value: 0
            text: value + " " + qsTr("cards left")
        }
        ToolIcon {
            iconId: "icon-m-toolbar-edit"
            onClicked: {
                pageStack.push(Qt.createComponent("EditPage.qml"), { deckName: deckName, factId: Deck.getFactInfo("id") });
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
                onClicked: {
                    console.log("Delete Card");
                    Deck.deleteCurrentCard();
                    refreshCard();
                }
            }
        }
    }

    function refreshCard()
    {
        ankiStudy.showNextCard();
    }

    function updateStatsInfo()
    {
        textButton.value = Deck.getDeckInfo("revCount");
    }

    Component.onCompleted: {
        ankiStudy.startStudy(); 
        updateStatsInfo();
    }
}
