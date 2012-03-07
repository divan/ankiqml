import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: root

    initialPage: mainPage

    MainPage {id: mainPage}

    ToolBar {
        id: sharedToolBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    PageStack {
        id: pageStack
        anchors {
             left: parent.left
             right: parent.right
             top: parent.top
             bottom: sharedToolBar.top
        }

        toolBar: sharedToolBar
    }

    showStatusBar: false
}
