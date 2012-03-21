import QtQuick 1.1
import com.nokia.meego 1.1

Rectangle {
    id: editField
    width: parent.width
    height: fieldText.height + fieldTextEdit.height
    anchors.margins: 10
    color: "grey"
    property string name: ""
    property string active: ""
    Column {
        spacing: 5
        Text {
            id: fieldText
            text: name
            font.pointSize: 24
        }
        TextField {
            id: fieldTextEdit
            text: active
            width: editField.width
        }
    }
}
