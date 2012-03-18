import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: editPage
    tools: defaultTools
    property alias deckName: ankiEdit.deckName
    property alias factId: ankiEdit.factId
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
            text: (factId) ? qsTr("Save") : qsTr("Add")
            onClicked: {
                ankiEdit.addFact();
            }
        }
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }
}
