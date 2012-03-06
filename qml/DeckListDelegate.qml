import Qt 4.7

Item {
    height: 90
    width: parent.width
    Item {
        width: parent.width * 0.8
        height: parent.height
        Column {
            Text {
                text: deckName
                font.pointSize: 32
                font.bold: true
            }
            Text {
                text: deckPath
                font.pointSize: 24
            }
        }
        MouseArea {
           anchors.fill: parent
           onClicked: {
               ankiStudy.deckPath = deckPath;
               root.state = "Study";
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
                ankiEdit.deckPath = deckPath;
                root.state = "Edit";
            }
        }
    }
}
