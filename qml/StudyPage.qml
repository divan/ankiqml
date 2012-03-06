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
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }

    Component.onCompleted: { ankiStudy.startStudy(); }
}
