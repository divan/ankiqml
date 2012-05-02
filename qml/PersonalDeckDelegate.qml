import QtQuick 1.1 
import com.nokia.extras 1.1

Rectangle {
    height: 90
    width: parent.width
    border.width: 1
    border.color: "grey"
    radius: 5

    BorderImage {
        id: background
        anchors.fill: parent
        anchors.leftMargin: -parent.anchors.leftMargin
        anchors.rightMargin: -parent.anchors.rightMargin
        visible: mouseArea.pressed
        source: "image://theme/meegotouch-list-background-pressed-center"
    }

    Item {
        anchors.fill: parent
        anchors.margins: 10
        Column {
            anchors.centerIn: parent
            width: parent.width
            Text {
                id: labelMain
                text: Name
                font.pointSize: 24
                font.bold: true
            }
        }

        Image {
            source: "image://theme/icon-m-common-drilldown-arrow" + (theme.inverted ? "-inverse" : "")
            anchors.right: parent.right;
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                console.log("Syncing deck " + Name);
            }
        }
    }
}
