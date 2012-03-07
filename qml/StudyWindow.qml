import Qt 4.7

Rectangle {
    id: studyWindow
    color: "#111111"
    anchors.fill: parent
    property string deckPath: ""

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

    states: [
        State {
            name: "Finished"
            PropertyChanges { target: finishedWindow; state: "Show" }
            PropertyChanges { target: ankiEaseButtons; state: "" }
        },
        State {
            name: "Question"
            StateChangeScript {
                name: "onQuestion"
                script: { sharedToolBar.setTools(defaultTools, "replace"); }
            }
            PropertyChanges { target: ankiCard; state: "Question" }
            PropertyChanges { target: ankiEaseButtons; state: "" }
            PropertyChanges { target: sharedToolBar; visible: true }
        },
        State{
            name: "Answer"
            PropertyChanges { target: ankiCard; state: "Answer" }
            PropertyChanges { target: ankiEaseButtons; state: "Show" }
            PropertyChanges { target: sharedToolBar; visible: false }
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

    function endStudy() {
        console.log("End Study");
        Deck.closeDeck();
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
            Deck.closeDeck();
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
