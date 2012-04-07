import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: syncProgress
    width: parent.width * 0.8
    height: parent.height * 0.5
    gradient: Gradient {
         GradientStop { position: 0.0; color: "white" }
         GradientStop { position: 0.66; color: "lightgray" }
         GradientStop { position: 1.0; color: "white" }
    }
    opacity: 1
    anchors.centerIn: parent
    border.width: 2
    border.color: "darkgray"
    radius: 5
    visible: false

    Image {
        width: 192
        height: 192
        opacity: 0.1
        source: "../images/sync.png"
        anchors.centerIn: parent
    }

    Column {
        anchors.fill: parent
        anchors.centerIn: parent
        Text {
            id: messageText
            width: parent.width
            height: parent.height / 2
            font.pointSize: 36
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }
        BusyIndicator {
            id: busyIndicator
            platformStyle: BusyIndicatorStyle { size: "large" }
            anchors.horizontalCenter: parent.horizontalCenter
            running: false
        }
    }
    MouseArea {
        anchors.fill: parent
    }

    states: [
        State {
            name: "active"
            PropertyChanges { target: syncProgress; visible: true }
            PropertyChanges { target: busyIndicator; running: true }
        }
    ]

    function updateMessage(message) {
        messageText.text = message;
    }
}
