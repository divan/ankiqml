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
            anchors.centerIn: parent
            width: parent.width
            Text {
                id: labelMain
                text: deckName
                font.pointSize: 24
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: labelSmall
                text: deckFactCount + " " + qsTr("facts")
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        MouseArea {
           anchors.fill: parent
           onClicked: {
               pageStack.push(Qt.createComponent("DeckPage.qml"), { deckPath: deckPath });
           }
        }
    }
}
