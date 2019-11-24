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
    id: elementDataPage
    allowedOrientations: Orientation.All
    property int elementNumber: 0
    property var elementsymbol
    property var translatableData
    property var keyList
    property var values
    property var dataFile
    keyList: dataFile.keys
    values: dataFile.values
    elementsymbol: values[1]

    SilicaFlickable {
        PageHeader {
            id: header
            title: qsTr("Element details")
        }
        anchors.fill: parent
        contentHeight: col.height+header.height+Theme.paddingLarge*2

        Column {
            id: col
            y: header.height
            anchors {
                left: parent.left
                right: parent.right
            }
            ElementDataSection{
                name: qsTr("General Properties")
                repeat: 8
                offset: 0
                values: elementDataPage.values
                keyList: elementDataPage.keyList
            }
            ElementDataSection{
                name: qsTr("Physical Properties")
                repeat: 6
                offset: 8
                values: elementDataPage.values
                keyList: elementDataPage.keyList
            }
            ElementDataSection{
                name: qsTr("Electronic Properties")
                repeat: 4
                offset: 14
                values: elementDataPage.values
                keyList: elementDataPage.keyList
            }
            SectionHeader {
                color: Theme.highlightColor
                height: Theme.fontSizeLarge*2
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                text: qsTr("More info")
                anchors {
                    topMargin: 55
                    bottomMargin: 15
                }
            }
            Item {
                width: parent.width
                height: Theme.paddingLarge*2

                MouseArea{
                    z: -1
                    width: parent.width
                    height: parent.height+5
                    //onClicked: console.log("CLICK " + qsTr("https://en.wikipedia.org/wiki/")
                     //                      + qsTranslate("ElementDetails", qsTr(values[0])) )
                    onClicked: Qt.openUrlExternally(qsTr("https://en.wikipedia.org/wiki/")
                                                    + qsTranslate("ElementDetails", qsTr(values[0])))

                }

                Label {
                    color: Theme.highlightColor
                    font.pixelSize: Theme.fontSizeSmall
                    text: qsTr("Wikipedia link")
                    anchors {
                        fill: parent
                        leftMargin: Theme.paddingLarge
                    }
                }
                Label {
                    z: -1
                    horizontalAlignment: Text.AlignRight
                    color: Theme.highlightColor
                    font.pixelSize: Theme.fontSizeSmall
                    text: '<a href="'+qsTr("https://en.wikipedia.org/wiki/")+ qsTranslate("ElementDetails", qsTr(values[0])) + '">' + qsTranslate("ElementDetails", values[0]) + '</a>'
                    onLinkActivated: Qt.openUrlExternally(link)

                    anchors {
                        fill: parent
                        rightMargin: Theme.paddingLarge
                    }
                }
            }
        }
        VerticalScrollDecorator {}
    }
    function next() {
        if (elementNumber ==117) {
            elementNumber = 0
        }
        else
        elementNumber++
    }
    function previous() {
        if (elementNumber == 0) {
            elementNumber = 117
        }
        else
            elementNumber--
    }
    onElementNumberChanged: {
        dataFile.elementNum = elementNumber
        keyList = dataFile.keys
        values = dataFile.values
        elementsymbol = values[1]
    }
}
