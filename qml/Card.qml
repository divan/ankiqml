import QtQuick 1.1

Flipable {
    id: card
    property alias question: textQuestion.text
    property alias answer: textAnswer.text
    property real fontScale: 2.5
    signal clicked()
    property bool flipped: false
    property real zoomFactor: 2.0

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
    states: [
        State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: card.flipped
        },
        State {
            name: ""
            when: !card.flipped
        }
    ]
    transform: [
        Rotation {
            id: rotation
            origin.x: card.width/2
            origin.y: card.height/2
            axis.x: 0
            axis.y: 1
            axis.z: 0
            angle: 0
        },
        Translate {
            id: translate
            x: 0
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "back"
            NumberAnimation { target: rotation; property: "angle"; duration: 250 }
        },
        Transition {
            from: "back"
            to: ""
            SequentialAnimation {
                NumberAnimation {
                    target: textQuestion
                    property: "opacity"
                    to: 0
                    duration: 0
                }
                NumberAnimation {
                    target: translate
                    property: "x"
                    to: -500
                    duration: 250
                    easing {
                        type: Easing.InBack; amplitude: 1.0; period: 0.5;
                    }
                }
                NumberAnimation { target: translate; property: "x"; to: 500; duration: 0 }
                NumberAnimation {
                    target: textQuestion
                    property: "opacity"
                    to: 1
                    duration: 0
                }
                NumberAnimation {
                    target: translate
                    property: "x"
                    to: 0
                    duration: 250
                    easing {
                        type: Easing.OutBack; amplitude: 1.0; period: 1.5;
                    }
                }
            }
        }
    ]

    function adjustFonts() {
        console.log("Adjusting font...");
        textQuestion.text = adjustFontSize(textQuestion.text);
        textAnswer.text = adjustFontSize(textAnswer.text);
    }

    function adjustFontSize(str) {
        var re = /font-size: (\d+)px/g;
        var a;
        while ((a = re.exec(str)) != null)
        {
            str = str.replace(a[0], a[0].replace(a[1], a[1]*zoomFactor));
        }
        return str; 
    }
}
