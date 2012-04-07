import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: settingsPage
    tools: defaultTools
    PageHeader {
        id: header
        text: qsTr("Settings")
    }
    Column {
        spacing: 5
        anchors.top: header.bottom
        height: parent.height
        width: parent.width * 0.9
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: ankiwebLabel
            text: qsTr("AnkiWeb Sync")
            font.pointSize: 24
            font.bold: true
        }
        Text {
            id: userLabel
            text: qsTr("Username")
            font.pointSize: 24
        }
        TextField {
            id: userTextEdit
            placeholderText: qsTr("AnkiWeb username")
            width: parent.width
        }
        Text {
            id: passLabel
            text: qsTr("Password")
            font.pointSize: 24
        }
        TextField {
            id: passTextEdit
            echoMode: TextInput.Password
            validator: RegExpValidator { regExp: /^[\x00-\x7F]*$/ }
            placeholderText: qsTr("AnkiWeb password")
            width: parent.width
        }
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
            text: qsTr("Save")
            onClicked: save()
        }
        ToolIcon {
            iconId: "icon-m-toolbar-trim";
            id: emptyBtn
        }
    }

    function save() {
        Settings.SetValue("Sync/Username", userTextEdit.text);
        Settings.SetValue("Sync/Password", passTextEdit.text);
        pageStack.pop();
    }

    Component.onCompleted: {
        userTextEdit.text = Settings.GetValue("Sync/Username");
        passTextEdit.text = Settings.GetValue("Sync/Password");
    }
}
