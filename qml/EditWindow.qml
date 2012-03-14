import Qt 4.7

Rectangle {
    id: editWindow
    anchors.fill: parent
    property string deckPath: ""
    property string factId: ""
    property bool isNew: factId == ""
    color: "grey"
    PageHeader {
        id: header
        text: (factId) ? qsTr("Edit fact") : qsTr("Add new fact")
    }
    Column {
        id: fieldsColumn
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom
        width: parent.width * 0.8
    }

    Component.onCompleted: {
        if (isNew)
            Deck.openDeck(deckPath);
        var field;
        var fieldNames = Deck.CurrentModelFields();
        for (field in fieldNames)
        {
            var name = fieldNames[field];
            var component = Qt.createComponent(Qt.resolvedUrl("EditWindowField.qml"));
            var value = (isNew) ? "" : Deck.getFactValue(name);
            var field = component.createObject(fieldsColumn, {"name": name, 'value': value });
            if (field == null)
                console.log("Cannot create field: " + component.errorString());
        }
        if (isNew)
            Deck.closeDeck();
    }

    function addFact()
    {
        var child;
        var factMap = {};
        for (var i = 0; i < fieldsColumn.children.length; ++i)
        {
            var name = fieldsColumn.children[i].children[0].children[0].text;
            var value = fieldsColumn.children[i].children[0].children[1].text;
            factMap[name] = value;
        }
        if (isNew)
        {
            Deck.openDeck(deckPath);
            Deck.startSession();
            if (validateFields(factMap))
                Deck.AddFact(factMap);
            Deck.stopSession();
            Deck.closeDeck();
        }
        else
        {
            if (Deck.EditFact(factMap))
            {
                studyPage.onFactUpdated();
                pageStack.pop();
            }
        }
    }

    function validateFields(map)
    {
        var res = true;
        for (var i in map)
        {
            var str = map[i];
            res = (str && str.length > 0);
        }
        if (res == false)
            console.log("Fields are not valid");
        return res;
    }
}
