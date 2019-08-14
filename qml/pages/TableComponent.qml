import QtQuick 2.0
import Sailfish.Silica 1.0


Rectangle {

    property int num: 0
        MouseArea {
            anchors.fill: parent
            onClicked: {
                elementPage.elementNumber =num
                pageStack.push(elementPage)
            }
        }
        width: Screen.height /20
        height: Screen.height /20
        color: colorList.colors[table.colorScheme*118+num]
        Text {
            property var sym: {
                var s='';
                if(Qt.locale().name == 'zh_CN'){
                     s= qsTranslate('ElementDetails',(dataFile.elements[num]['name']))
                }
                if(s.length===0 || s.length>1 ){
                    s= elements.naturalElements[num]
                }
                return s;
            }
            text: sym
        }

}

