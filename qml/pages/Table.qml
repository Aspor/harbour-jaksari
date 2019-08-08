/*Copyright (c) 2019 Timo Mäenpää
 *
 *Permission to use, copy, modify, and distribute this software for any
 *purpose with or without fee is hereby granted, provided that the above
 *copyright notice and this permission notice appear in all copies.
 *
 *THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import utils 1.0

Page {
    id: periodicTable
    Item {
        id: elements
        property var naturalElements:     ["H","He"
            ,"Li","Be",                                                     "B", "C", "N", "O", "F", "Ne"
            ,"Na","Mg",                                                     "Al","Si","P", "S", "Cl","Ar"
            ,"K","Ca",  "Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn",   "Ga","Ge","As","Se","Br","Kr"
            ,"Rb","Sr", "Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd",   "In","Sn","Sb","Te","I", "Xe"
            ,"Cs","Ba",
            "La","Ce","Pr","Nd","Pm","Sm","Eu","Gb","Tb","Dy","Ho","Er","Tm","Yb"
            ,"Lu","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg",  "Tl","Pb","Bi","Po","At","Rn"
            ,"Fr","Ra",
            "Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No",
            "Lr","Rf","Db","Sg","Bh","Hs","Mt","Ds","Rg","Cn",   "Nh","Fl","Mc","Lv","TS","Og"]
    }
    Item {
        id: colorList
        property var  colors: {
            const groupColors = [ '#ffccff' ,'#ccffff',  '#ffffcc', '#ffffaa', '#00ffff', '#ffaaff', '#ccffcc', '#ccccff', '#ffcccc', '#aaaaff', '#aaffaa',  '#ffaaaa', '#aaccaa','#ccaaaa','#aaaacc','#ccccaa','#aacccc','#ccaacc','#ff00ff','#00ffff']
            var colorArr=[]
           //const elementData=ElementJSON.elementsData
            const elementData=dataFile.elements
            for(var i=1;i<119;i++){
                if(i===3||i===11||i===19||i===37||i===55||i===87)
                    colorArr[i-1]=groupColors[0]
                else if(i===4||i===12||i===20||i===38||i===56||i===88)
                    colorArr[i-1]=groupColors[1]
                else if(i===21 ||i===39)
                    colorArr.push(groupColors[2])
                else if(i===22 ||i===40||i===72||i===104)
                    colorArr.push(groupColors[3])
                else if(i===23 ||i===41||i===73||i===105)
                    colorArr.push(groupColors[4])
                else if(i===24 ||i===42||i===74||i===106)
                    colorArr.push(groupColors[5])
                else if(i===25 ||i===43||i===75||i===107)
                    colorArr.push(groupColors[6])
                else if(i===26 ||i===44||i===76||i===108)
                    colorArr.push(groupColors[7])
                else if(i===27 ||i===45||i===77||i===109)
                    colorArr.push(groupColors[8])
                else if(i===28 ||i===46||i===78||i===110)
                    colorArr.push(groupColors[9])
                else if(i===29 ||i===47||i===79||i===111)
                    colorArr.push(groupColors[10])
                else if(i===30 ||i===48||i===80||i===112)
                    colorArr.push(groupColors[11])
                else if(i===5 ||i===13||i===31||i===49||i===81||i===113)
                    colorArr[i-1]=groupColors[12]
                else if(i===6 ||i===14||i===32||i===50||i===82||i===114)
                    colorArr[i-1]=groupColors[13]
                else if(i===7 ||i===15||i===33||i===51||i===83||i===115)
                    colorArr[i-1]=groupColors[14]
                else if(i===8 ||i===16||i===34||i===52||i===84||i===116)
                    colorArr[i-1]=groupColors[15]
                else if(i===9 ||i===17||i===35||i===53||i===85||i===117||i===1 )
                    colorArr[i-1]=groupColors[16]
                else if(i===10 ||i===18||i===36||i===54||i===86||i===118||i===2)
                    colorArr[i-1]=groupColors[17]
                else if ( i=== 57| i=== 58|i=== 59 |i===60| i===61| i===62 |i===63 |i===64 |i===65 |i===66 |i===67| i===68|i=== 69| i===70|i=== 71 )
                    colorArr[i-1]=groupColors[18]
                else if ( i=== 89| i=== 90|i=== 91 |i===92| i===93| i===94 |i===95 |i===96 |i===97 |i===98 |i===99|i===100|i=== 101| i===102|i=== 103 )
                    colorArr.push(groupColors[19])
            }
            for( i=0;i<118;i++){
                colorArr[i+118]= "#"+String(elementData[i]['color'])
            }
            for( i=0;i<118;i++){
                var red= 1.0/(4.0-0.75) * (elementData[i]['electronegativity_pauling']-0.75)
                var blue= 1-red
                if(red>0) {
                    colorArr[2*118+i]= Qt.rgba(red,0.5,blue,1)
                }
                else {
                    colorArr[2*118+i]= Qt.rgba(0.7,0.7,0.7,1)
                }
            }
            for( i=0;i<118;i++){
                red = 1.0 / (350.0 + 225.0) * (elementData[i]['electron_affinity']+225.0)
                blue= 1-red
                if(red>0) {
                    colorArr[3*118+i]= Qt.rgba(red,0.5,blue,1)
                }
                else {
                    colorArr[3*118+i]= Qt.rgba(0.7,0.7,0.7,1)
                }
            }

            for( i=0;i<118;i++) {
                switch(elementData[i]['category']) {
                    case "diatomic nonmetal":
                        colorArr[4*118+i]=("#ff22ff")
                        break
                    case "polyatomic nonmetal":
                        colorArr[4*118+i]=("#ff55ff")
                        break
                    case "alkali metal":
                        colorArr[4*118+i]=("#22ffff")
                        break
                    case "alkaline earth metal":
                        colorArr[4*118+i]=("#aaffff")
                        break
                    case "metal":
                        colorArr[4*118+i]=("#ffff22")
                        break
                    case "transition metal":
                        colorArr[4*118+i]=("#ffffaa")
                        break
                    case "metalloid":
                        colorArr[4*118+i]=("#e0e0e0")
                        break
                    case "noble gas":
                        colorArr[4*118+i]=("#22ff22")
                        break
                    case "post-transition metal":
                        colorArr[4*118+i]=("#cccccc")
                        break
                    case "lanthanide":
                        colorArr[4*118+i]=("#abcdff")
                        break
                    case "actinide":
                        colorArr[4*118+i]=("#dcbaff")
                        break
                    case "unknonw":
                        colorArr[4*118+i]=("#ffffff")
                        break
                    default:
                        colorArr[4*118+i]=("#999999")
                    break
                }
            }
            return colorArr
        }
    }

    allowedOrientations: Orientation.Landscape
    SilicaFlickable {
        property var colorSchemes: [qsTr("Groups"),qsTr("CPK-color"),qsTr("Electronegativity"),qsTr("Electron affinity"),qsTr("Block")];
        MouseArea {
            width: Screen.width
            height: Screen.height
            onClicked: {
                if(table.colorScheme == 4) {
                    table.colorScheme=0
                }
                else {
                    table.colorScheme++
                }
            }
        }
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(aboutPage)
            }
            MenuItem {
                text: qsTr("Color scheme")
                onClicked: {
                    if(table.colorScheme == 4) {
                        table.colorScheme=0
                    }
                    else {
                        table.colorScheme++
                    }
                }
            }
        }

        id: table
        anchors.fill: parent
        leftMargin: Theme.paddingLarge
        property int colorScheme: 0
        Column {
            spacing: 5
            x: 25
            y: 25
            Row {
                spacing:  16*Screen.height/20 +17
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 2
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index]
                        Text {
                            text: qsTr(elements.naturalElements[index])
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Repeater{
                    anchors.fill: parent
                    model: 2
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+2
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+2]
                        Text {
                            text: elements.naturalElements[index+2]
                        }
                    }
                }

                Repeater {
                    anchors.fill: parent
                    model: 1
                    delegate: Rectangle {
                        width: Screen.height /20
                        height: 1
                        color: "transparent"
                    }
                }
                Rectangle {
                    width: Screen.height /20
                    height: colorSchemeLabel.height
                    y: -Screen.height /20
                    //opacity: 1
                    color: "transparent"
                    Rectangle {
                        width: colorSchemeLabel.width
                        height: colorSchemeLabel.height
                        color: "transparent"

                        Label {
                            id: colorSchemeLabel
                            //color: "black"
                            color: Theme.highlightColor
                            text: qsTr("Color scheme")+":  "+ table.colorSchemes[table.colorScheme]

                        }
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 8
                    delegate: Rectangle {
                        width: Screen.height /20
                        height: Screen.height /20
                        color: "transparent"
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 6
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber = index+4
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+4]
                        Text {
                            text: elements.naturalElements[index+4]
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 2
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+10
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+10]
                        Text {
                            text: elements.naturalElements[index+10]
                        }
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 10
                    delegate: Rectangle {
                        width: Screen.height /20
                        height: Screen.height /20
                        color: "transparent"
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 6
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+12
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+12]
                        Text {
                            text: elements.naturalElements[index+12]
                        }
                    }
                }
            }


            Row {
                spacing: 1
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 18
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+18
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+18]
                        Text {
                            text: elements.naturalElements[index+18]
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 18
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+36
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+36]
                        Text {
                            text: elements.naturalElements[index+36]
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 3
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+54
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+54]
                        Text {
                            text: elements.naturalElements[index+54]
                        }
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 15
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+71
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+71]
                        Text {
                            text: elements.naturalElements[index+71]
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Repeater {
                    anchors.fill: parent
                    model: 3
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+86
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+86]
                        Text {
                            text: elements.naturalElements[index+86]
                        }
                    }
                }
                Repeater {
                    anchors.fill: parent
                    model: 15
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+103
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+103]
                        Text {
                            text: elements.naturalElements[index+103]
                        }
                    }
                }
            }
            Row {
                height: Screen.height /20
                Rectangle{
                    width: Screen.width
                    height: Screen.height /20
                    color: "transparent"
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Rectangle {
                    width: Screen.width /10
                    height: Screen.height /20
                    color: "transparent"
                }
                Repeater {
                    anchors.fill: parent
                    model: 15
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber = index+56
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+56]
                        Text {
                            text: elements.naturalElements[index+56]
                        }
                    }
                }
            }
            Row {
                spacing: 1
                height: Screen.height /20
                Rectangle {
                    width: Screen.width /10
                    height: Screen.height /20
                    color: "transparent"
                }
                Repeater {
                    anchors.fill: parent
                    model: 15
                    delegate: Rectangle {
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                elementPage.elementNumber =index+88
                                pageStack.push(elementPage)
                            }
                        }
                        width: Screen.height /20
                        height: Screen.height /20
                        color: colorList.colors[table.colorScheme*118+index+88]
                        Text {
                            text: elements.naturalElements[index+88]
                        }
                    }
                }
            }
        }
    }
}
