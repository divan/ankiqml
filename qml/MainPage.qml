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

    Rectangle {
        id: updateProgress
        width: parent.width * 0.8
        height: parent.height * 0.5
        anchors.centerIn: parent
        visible: false
        gradient: Gradient {
             GradientStop { position: 0.0; color: "white" }
             GradientStop { position: 0.66; color: "lightgray" }
             GradientStop { position: 1.0; color: "white" }
        }
        radius: 5
        border.width: 2
        border.color: "darkgray"
        property int value: 0
        Rectangle {
            id: progressBar
            width: parent.width * parent.value / 100
            height: parent.height * 0.8
            anchors.centerIn: parent
            color: "green"
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
        decksModel.reload();
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

    function toggleView(value) {
        updateProgress.visible = (value < 100);
        updateProgress.value = value;
        if (value == 100)
            ankiDecks.toggleView();
    }

    //Component.onCompleted: mainPage.updateDecks()
}
