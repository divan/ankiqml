import Qt 4.7

Rectangle {
    id: card
    width: parent.width
    property string question: ""
    property string answer: ""
    property real fontScale: 2.5
    signal clicked()

    Text {
        id: text
        font.pointSize: 34
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        verticalAlignment: Text.AlignVCenter
        textFormat: Text.RichText
        wrapMode: Text.Wrap
    }
    MouseArea {
        anchors.fill: parent
        onClicked: card.clicked()
    }

    states: [
        State {
            name: "Question"
            StateChangeScript {
                name: "onQuestion"
                script: {
                    text.text = adjustFontSize(card.question);
                }
            }
            PropertyChanges { target: card; color: "white" }
        },
        State {
            name: "Answer"
            StateChangeScript {
                name: "onQuestion"
                script: {
                    text.text = adjustFontSize(card.answer);
                }
            }
            PropertyChanges { target: card; color: "white" }
        }
    ]

    function adjustFontSize(str) {
        console.log("Adjusting font...");
        return str.replace("24px", "54px");
    }

    function adjustFontSize2(str) {
        console.log("Adjusting font 2...");
        var div; // = document.createElement('div');
        div = str;

        var elements = div.getElementsByTagName("*");

        for (i = 0; i < elements.length; ++i)
        {
            if(elements[i].style.fontSize)
            {
                var s = parseInt(elements[i].style.fontSize.replace("px",""));
            }

            elements[i].style.fontSize = s*card.fontScale+"px"
        }

        console.log(div);
    }
}
