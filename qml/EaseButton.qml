import QtQuick 1.1
import com.nokia.meego 1.1

Button {
    id: easeButton
    property int quality: 0
    signal answer(int quality)
    checked: false
    checkable: false

    platformStyle: ButtonStyle {
         fontFamily: "Arial"
         fontPixelSize: 28
         fontCapitalization: Font.SmallCaps
         fontWeight: Font.Bold
         horizontalAlignment: Text.AlignHCenter
         textColor: "black"
         pressedTextColor: "red"
         disabledTextColor: "gray"
         checkedTextColor: "black"
         buttonHeight: 100
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            answer(quality);
        }
    }
}
