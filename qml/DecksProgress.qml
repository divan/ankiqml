import QtQuick 1.1
import com.nokia.meego 1.0

Rectangle {
    id: decksProgress
    width: busyIndicator.width * 2
    height: busyIndicator.height + 50
    anchors.centerIn: parent
    anchors.margins: 10
    visible: false
    border.color: "gray"
    border.width: 2
    color: "white"
    property int value: 0
    BusyIndicator {
        id: busyIndicator
        platformStyle: BusyIndicatorStyle { size: "large" }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        running: true
    }
    Text {
        id: updatingLabel
        text: qsTr("Updating...")
        font.pointSize: 22
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: busyIndicator.bottom
    }
}
