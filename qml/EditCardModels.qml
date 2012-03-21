import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: editCardModelsPage
    tools: defaultTools
    property string deckName: ""
    Rectangle {
        anchors.fill: parent
        color: "grey"
        PageHeader {
            id: header
            text: qsTr("Edit card models")
        }
        Column {
            id: cardModelsColumn
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: header.bottom
            width: parent.width * 0.8
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
        ToolIcon {
            iconId: "icon-m-toolbar-view-menu"
            onClicked: launchMenu()
        }
    }

    Component.onCompleted: {
        Deck.openDeck(deckName);
        var field;
        var fieldNames = Deck.CurrentCardModels();
        console.log("FieldNames: " + fieldNames.count());
        for (field in fieldNames)
        {
            var name = fieldNames[field];
            console.log(name + " " + field["name"]);
            var component = Qt.createComponent(Qt.resolvedUrl("EditCardModelItem.qml"));
//            var value = (isNew) ? "" : Deck.getFactValue(name);
            var field = component.createObject(fieldsColumn, {"name": name, 'active': "true" });
            if (field == null)
                console.log("Cannot create field: " + component.errorString());
        }
        Deck.closeDeck();
    }
}
