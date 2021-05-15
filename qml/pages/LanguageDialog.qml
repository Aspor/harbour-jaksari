import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog{
    ComboBox {
        id: combo
        anchors.fill: parent
        menu: ContextMenu {
                 MenuItem { text: "English" }
                 MenuItem { text: "Finnish" }
                 MenuItem { text: "Swedish" }
                 MenuItem { text: "Chinese" }
                 MenuItem { text: "Russian" }
                 MenuItem { text: "German" }

        }
    }

  onDone: {
    if (result == DialogResult.Accepted) {
//        language = combo.currentIndex
        trans.selectLanguage(combo.currentIndex)
        }
    }
}
