/*Copyright (c) 2019 Timo Mäenpää
 *
 *Permission to use, copy, modify, and distribute this file for any
 *purpose with or without fee is hereby granted, provided that the above
 *copyright notice and this permission notice appear in all copies.

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
import "../pages"

CoverBackground {
    property var elementData: []
    Image {
            anchors.fill: parent
            id: coverImage
            source: "coverImage.png"
            fillMode: Image.PreserveAspectFit
    }
    Column {
        spacing: Theme.paddingLarge
        anchors.centerIn: parent
        Label {
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
            text: qsTranslate("ElementDetails",elementData[0])
        }
        Label {
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
            text: elementData[1]
        }
        Label {
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
            text: elementData[2]
        }
        Label {
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
            text: elementData[9]
        }
    }
    CoverActionList {
        id: coverAction
        CoverAction {
            id: actionPrev
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: {
                elementPage.previous()
            }
        }
        CoverAction {
            id: actionNext
            iconSource: "image://theme/icon-cover-next"
            onTriggered: {
                elementPage.next()
            }
        }
    }
    function changeElement(data) {
        elementData = data
    }
}

