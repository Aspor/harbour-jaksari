/*Copyright (c) 2019 Timo Mäenpää
 *
 *Permission to use, copy, modify, and distribute this file for any
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
import io.thp.pyotherside 1.2

Page {
    SilicaFlickable {
	anchors.fill: parent
	Column {
            spacing: Theme.paddingLarge
            anchors {
                fill: parent
                leftMargin: Theme.PaddingLarge
                rightMargin: Theme.PaddingLarge
            } 
            PageHeader {
                title: qsTr("About Jaksari")
            }
            Label {
                width: parent.width
                font.pixelSize: Theme.fontSizeSmall
                text: '© 2019 Timo Mäenpää'
            } 
            Label {
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr('License: GPLv3 or later')
            } 
            Label {
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr('Atom data:')+  '<html><style type="text/css"></style><a href="https://www.wikipedia.org/">https://www.wikipedia.org/</a></html> ' + qsTr('and') +' '
                onLinkActivated: Qt.openUrlExternally('https://www.wikipedia.org/')
            } 
            Label {
                font.pixelSize: Theme.fontSizeSmall
                text: '<html><style type="text/css"></style><a href="https://github.com/Bowserinator/Periodic-Table-JSON">https://github.com/Bowserinator/Periodic-Table-JSON</a></html>'
                onLinkActivated: Qt.openUrlExternally('https://github.com/Bowserinator/Periodic-Table-JSON')
            }
        }
    }
}

