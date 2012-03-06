import Qt 4.7

Rectangle {
	id: easeButtons
	width: parent.width
	visible: false
    height: 0
    opacity: 0
	
	Row {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
		EaseButton {
			id: ease1
			name: "Again"
			quality: 1
		}
		EaseButton {
			id: ease2
			name: "Hard"
			quality: 2
		}
		EaseButton {
			id: ease3
			name: "Good"
			quality: 3
		}
		EaseButton {
			id: ease4
			name: "Easy"
			quality: 4
		}
		EaseButton {
			id: ease5
			name: "Very Easy"
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
