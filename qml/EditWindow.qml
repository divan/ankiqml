import Qt 4.7

Rectangle {
    id: editWindow
    anchors.fill: parent
	property string deckPath: ""
    color: "white"
    visible: false
    Rectangle {
        border.color: "green"
        border.width: 10
        height: editWindow.height / 2
        width: editWindow.width - 100
        anchors.top: editWindow.top
        anchors.left: editWindow.left
        TextEdit {
            id: questionText
            text: deckPath
            anchors.fill: parent
            font.pointSize: 32
        }
    }
    Rectangle {
        border.color: "green"
        border.width: 10
        height: editWindow.height / 2
        width: editWindow.width - 100
        anchors.bottom: editWindow.bottom
        anchors.left: editWindow.left
        TextEdit {
            id: answerText
            text: deckPath
            font.pointSize: 32
            anchors.fill: parent
        }
    }
    EditWindowButton {
        id: btn1
        anchors.top: editWindow.top
        anchors.right: editWindow.right
    }
    EditWindowButton {
        id: btn2
        anchors.top: btn1.bottom 
        anchors.right: editWindow.right
    }
    EditWindowButton {
        id: btn3
        anchors.top: btn2.bottom 
        anchors.right: editWindow.right
    }
    EditWindowButton {
        id: btn4
        anchors.top: btn3.bottom 
        anchors.right: editWindow.right
    }
}
