import QtQuick 1.1

Flipable {
    id: card
    property alias question: textQuestion.text
    property alias answer: textAnswer.text
    property real fontScale: 2.5
    signal clicked()
    property bool flipped: false

    front: Item {
        anchors.fill: parent
        Image {
            fillMode: Image.Tile
            anchors.fill: parent
            source: "../images/paper.jpg"
        }
        Text {
            id: textQuestion
            font.pointSize: 34
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            textFormat: Text.RichText
            wrapMode: Text.Wrap
        }
    }
    back: Item {
        anchors.fill: parent
        Image {
            fillMode: Image.Tile
            anchors.fill: parent
            source: "../images/paper.jpg"
        }
        Text {
            id: textAnswer
            font.pointSize: 34
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            textFormat: Text.RichText
            wrapMode: Text.Wrap
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            card.flipped = !card.flipped;
            card.clicked();
            console.log("Card clicked");
        }
    }
    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: card.flipped
    }
    transform: Rotation {
        id: rotation
        origin.x: card.width/2
        origin.y: card.height/2
        axis.x: 0
        axis.y: 1
        axis.z: 0
        angle: 0
    }
    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 250 }
    }

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
