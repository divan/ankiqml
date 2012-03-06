import Qt 4.7
 
Rectangle {
	id: studyWindow
    color: "#111111"
    anchors.fill: parent
	property string deckPath: ""
    visible: false

    Column {
        anchors.fill: parent
        Card {
            id: ankiCard
            height: parent.height - ankiEaseButtons.height
        }
        EaseButtons {
            id: ankiEaseButtons
        }
    }

    FinishedWindow {
        id: finishedWindow
    }

    FinishButton {
        id: finishButton
    }

	states: [
		State {
			name: "Finished"
			PropertyChanges { target: finishedWindow; state: "Show" }
			PropertyChanges { target: studyWindow; visible: true }
		},
		State {
			name: "Question"
			PropertyChanges { target: ankiCard; state: "Question" }
			PropertyChanges { target: ankiEaseButtons; state: "" }
			PropertyChanges { target: studyWindow; visible: true }
		},
		State {
			name: "Answer"
			PropertyChanges { target: ankiCard; state: "Answer" }
			PropertyChanges { target: ankiEaseButtons; state: "Show" }
			PropertyChanges { target: studyWindow; visible: true }
		}
	]

    function cardClicked() {
        if (state == "Question")
            state = "Answer"
        else
            state = "Question"
    }

    function startStudy() {
        console.log("Start Study");
        Deck.openDeck(deckPath);
		showNextCard();
	}

    function gotAnswer(quality) {
        Deck.answerCard(quality);
        showNextCard();
    }

	function showNextCard() {
		Deck.getCard();
        if (Deck.Finished())
        {
            state = "Finished";
            Deck.FinishDeck();
        }
        else
        {
            ankiCard.question = Deck.getQuestion();
            ankiCard.answer = Deck.getAnswer();
            state = "Question" 
        }
	}

    Component.onCompleted: {
        ankiCard.clicked.connect(cardClicked);
    }
}
