import Qt 4.7

Rectangle {
    height: 90
    width: parent.width
    border.width: 1
    border.color: "green"
    Item {
        anchors.fill: parent
        anchors.margins: 10
        Column {
            Text {
                text: deckName
                font.pointSize: 24
                font.bold: true
            }
            Text {
                text: deckPath
                font.pointSize: 20
            }
        }
        MouseArea {
           anchors.fill: parent
           onClicked: {
               pageStack.push(Qt.resolvedUrl("DeckPage.qml"), { deckPath: deckPath });
           }
        }
    }
    Rectangle {
        id: addButton
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height
        width: 100
        color: "transparent"
        Text {
            anchors.fill: parent
            text: "+"
            font.bold: true
            font.pointSize: 54
            color: "green"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                pageStack.push(Qt.resolvedUrl("EditPage.qml"), { deckPath: deckPath });
            }
        }
    }
}
