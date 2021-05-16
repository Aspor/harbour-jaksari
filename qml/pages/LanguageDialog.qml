import QtQuick 2.0
import Sailfish.Silica 1.0

        Dialog{
            DialogHeader{
               id: languageDialogHeader
               title:  qsTranslate("Table" ,"Language")+trans.emptyString
           }

           ComboBox {
               y: languageDialogHeader.height
                anchors{
                    right: parent.right
                    rightMargin: Theme.paddingLarge
                }

                id: combo
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
                trans.selectLanguage(combo.currentIndex)
                }
            }
        }

