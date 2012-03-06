import Qt 4.7
 
Rectangle {
	id: root
    width: 800
    height: 400
    color: "#111111"

	DeckManager {
		id: ankiDecks
		anchors.centerIn: parent
	}
    StudyWindow {
        id: ankiStudy
		anchors.centerIn: parent
    }
    EditWindow {
        id: ankiEdit
        anchors.centerIn: parent
    }

    states: [
        State {
            name: "DeckManager"
            PropertyChanges { target: ankiStudy; state: "" }
            PropertyChanges { target: ankiDecks; visible: true }
            PropertyChanges { target: ankiEdit; visible: false }
        },
        State {
            name: "Study"
            StateChangeScript {
                name: "onStudyStart"
                script: { ankiStudy.startStudy(); }
            }
            PropertyChanges { target: ankiStudy; state: "Question" }
            PropertyChanges { target: ankiDecks; visible: false }
            PropertyChanges { target: ankiEdit; visible: false }
        },
        State {
            name: "Edit"
            StateChangeScript {
                name: "onEditStart"
                script: { console.log("edit"); }
            }
            PropertyChanges { target: ankiStudy; state: "" }
            PropertyChanges { target: ankiDecks; visible: false }
            PropertyChanges { target: ankiEdit; visible: true }
        }
    ]
    
	Component.onCompleted: {
        state = "DeckManager";

    }
}
