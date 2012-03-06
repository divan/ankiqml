import Qt 4.7

Rectangle {
	id: easeButton
	width: easeButtons.width / 5
	height: 100
	color: "blue"
	property string name: ""
	property int quality: 0
    signal answer(int quality)

	Text {
		id: easeButtonText
		font.pointSize: 24
		anchors.centerIn: parent
		text: name
	}

	MouseArea {
		anchors.fill: parent
		onClicked: {
            answer(quality);
		}
		onPressed: {
			easeButton.state = "Pressed"
		}
		onReleased: {
			easeButton.state = ""
		}
	}

	states: [
		State {
			name: "Pressed"
			PropertyChanges { target: easeButton; color: "red" }
		}
	]
}
