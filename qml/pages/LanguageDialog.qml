import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog{
    ComboBox {
        id: combo
        anchors.fill: parent
        menu: ContextMenu {
                 MenuItem { text: qsTr("English")+trans.emptyString }
                 MenuItem { text: qsTr("Finnish")+trans.emptyString }
                 MenuItem { text: qsTr("Swedish")+trans.emptyString }
                 MenuItem { text: qsTr("Chinese")+trans.emptyString }
                 MenuItem { text: qsTr("Russian")+trans.emptyString }
                 MenuItem { text: qsTr("German")+trans.emptyString }

        }
    }

  onDone: {
    if (result == DialogResult.Accepted) {
//        language = combo.currentIndex
        trans.selectLanguage(combo.currentIndex)
        }
    }
}
