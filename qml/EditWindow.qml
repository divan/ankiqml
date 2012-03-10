import Qt 4.7

Rectangle {
    id: editWindow
    anchors.fill: parent
    property string deckPath: ""
    color: "grey"
    PageHeader {
        id: header
        text: qsTr("Add new fact")
    }
    Column {
        id: fieldsColumn
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: header.bottom
        width: parent.width * 0.8
    }

    Component.onCompleted: {
        Deck.openDeck(deckPath);
        var field;
        var fieldNames = Deck.CurrentModelFields();
        for (field in fieldNames)
        {
            var name = fieldNames[field];
            var component = Qt.createComponent(Qt.resolvedUrl("EditWindowField.qml"));
            var field = component.createObject(fieldsColumn, {"name": name});
            if (field == null)
                console.log("Cannot create field: " + component.errorString());
        }
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
        Deck.openDeck(deckPath);
        Deck.startSession();
        Deck.AddFact(factMap);
        Deck.stopSession();
        Deck.closeDeck();
    }
}
