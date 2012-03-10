import QtQuick 1.1

Rectangle {
    height: 80
    width: parent.width
    color: "#444"
    property alias text: headerText.text
    Text {
        id: headerText
        anchors.centerIn: parent
        font.pointSize: 32
        color: "white"
    }
}
