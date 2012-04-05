import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: easeButtons
    width: parent.width
    height: 0
    opacity: 0
    property bool successive: true

    ButtonRow {
        exclusive: false
        EaseButton {
            id: ease1
            text: qsTr("Again")
            quality: 1
        }
        EaseButton {
            id: ease2
            text: successive ? qsTr("Hard") : qsTr("Good")
            quality: 2
        }
        EaseButton {
            id: ease3
            text: successive ? qsTr("Good") : qsTr("Easy")
            quality: 3
        }
        EaseButton {
            id: ease4
            text: successive ? qsTr("Easy") : qsTr("Very Easy")
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

    Component.onCompleted: {
        ease1.answer.connect(studyWindow.gotAnswer);
        ease2.answer.connect(studyWindow.gotAnswer);
        ease3.answer.connect(studyWindow.gotAnswer);
        ease4.answer.connect(studyWindow.gotAnswer);
    }
}
