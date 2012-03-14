import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: studyWindow
    anchors.fill: parent
    property string deckPath: ""
    Image {
        fillMode: Image.Tile
        source: "../images/wood.jpg"
    }

    Card {
        id: ankiCard
        width: studyWindow.width * 0.8
        height: (studyWindow.height - 100) * 0.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -30
    }
    EaseButtons {
        id: ankiEaseButtons
        anchors.bottom: studyWindow.bottom
    }

    QueryDialog {
        id: finishedDialog
        acceptButtonText: "OK"
        onAccepted: {
            pageStack.pop();
        }
    }

    states: [
        State {
            name: "Finished"
            StateChangeScript {
                name: "onFinished"
                script: {
                    sharedToolBar.setTools(defaultTools, "replace"); 
                    finishedDialog.message = Deck.DeckFinishedMsg();
                    finishedDialog.open();
                }
            }
            PropertyChanges { target: sharedToolBar; visible: false }
        },
        State {
            name: "Question"
            StateChangeScript {
                name: "onQuestion"
                script: { sharedToolBar.setTools(defaultTools, "replace"); }
            }
            PropertyChanges { target: ankiCard; state: "" }
            PropertyChanges { target: ankiEaseButtons; state: "" }
            PropertyChanges { target: sharedToolBar; visible: true }
        },
        State{
            name: "Answer"
            PropertyChanges { target: ankiCard; state: "back" }
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
        Deck.startSession();
        showNextCard();
    }

    function endStudy() {
        console.log("End Study");
        Deck.stopSession();
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
            endStudy(); 
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
