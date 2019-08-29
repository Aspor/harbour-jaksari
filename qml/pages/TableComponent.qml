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
        width: table.rectangleSize
        height: table.rectangleSize
        color: colorList.colors[table.colorScheme*118+num]
        Text {
            anchors.centerIn: parent
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
            textFormat: Text.StyledText
            font.pixelSize: table.rectangleSize/3
            text: '<font size="1">'+ Number((num+1)).toLocaleString(Qt.locale(),'f',0)+'</font><br><font size="5"> ' + sym +'</font>'
        }

}

