import QtQuick 1.1

Rectangle {
    id: easeButton
    property int quality: 0
    property alias text: label.text
    property string borderColor: "gray"
    signal answer(int quality)
    opacity: 0.9
    width: parent.width / 4.5
    height: 100
    radius: 20
    gradient: Gradient {
         GradientStop { position: 0.0; color: "white" }
         GradientStop { position: 0.66; color: "lightgray" }
         GradientStop { position: 1.0; color: "white" }
    }
    border.color: borderColor
    border.width: 9 

    Text {
        id: label
        anchors.centerIn: parent
        font.pointSize: 24
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "black"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            answer(quality);
        }
    }
}
