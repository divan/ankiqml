import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: easeButtons
    width: parent.width
    color: "transparent"
    height: 0
    opacity: 0
    property bool successive: true

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: ease1.width / 6
        width: parent.width
        EaseButton {
            id: ease1
            text: qsTr("Again")
            borderColor: "red"
            quality: 1
        }
        EaseButton {
            id: ease2
            text: successive ? qsTr("Hard") : qsTr("Good")
            borderColor: successive ? "orange" : "blue"
            quality: 2
        }
        EaseButton {
            id: ease3
            text: successive ? qsTr("Good") : qsTr("Easy")
            borderColor: successive ? "blue" : "darkgreen"
            quality: 3
        }
        EaseButton {
            id: ease4
            text: successive ? qsTr("Easy") : qsTr("Very Easy")
            borderColor: successive ? "darkgreen" : "green"
            quality: 4
        }
    }

    states: [
        State {
            name: "Show"
            PropertyChanges { target: easeButtons; visible: true }
            PropertyChanges { target: easeButtons; height: 100 }
            PropertyChanges { target: easeButtons; opacity: 1 }
        }
    ]

    transitions: Transition {
         PropertyAnimation { properties: "height,opacity"; easing.type: Easing.InOutQuad }
     }

    Component.onCompleted: {
        ease1.answer.connect(studyWindow.gotAnswer);
        ease2.answer.connect(studyWindow.gotAnswer);
        ease3.answer.connect(studyWindow.gotAnswer);
        ease4.answer.connect(studyWindow.gotAnswer);
    }
}
