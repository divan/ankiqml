import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: personalDeckPage
    tools: defaultTools

    PersonalDecksWindow {
        id: personalDecksWindow
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
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }
}
