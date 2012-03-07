import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: easeButtons
    width: parent.width
    height: 0
    opacity: 0

    ButtonRow {
        exclusive: false
        EaseButton {
            id: ease1
            text: "Again"
            quality: 1
        }
        EaseButton {
            id: ease2
            text: "Hard"
            quality: 2
        }
        EaseButton {
            id: ease3
            text: "Good"
            quality: 3
        }
        EaseButton {
            id: ease4
            text: "Easy"
            quality: 4
        }
        EaseButton {
            id: ease5
            text: "Very Easy"
            quality: 5
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
        ease5.answer.connect(studyWindow.gotAnswer);
    }
}
