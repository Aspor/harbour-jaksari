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

Item {
    id: section
    property var name
    property var repeat
    property var offset
    property var values
    property var keyList
    width: parent.width
    height: sectionColum.height
    Column{
        id: sectionColum
        width: parent.width
    Label {
        color: Theme.highlightColor
        height: Theme.fontSizeLarge*2
        font.pixelSize: Theme.fontSizeLarge
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        text: section.name
    }
    Repeater {
        model: repeat
        delegate: ElementItem {
            tag: String(section.keyList[index+section.offset]) +trans.emptyString
            value: String(section.values[index+section.offset]) +trans.emptyString
        }
    }
    }
}
