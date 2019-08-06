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
import "pages"
import "cover"
import utils 1.0

ApplicationWindow
{

    initialPage: Component {
        Table {
            id: periodicTable
            FileReader {
                id: dataFile
                 elementNum: 0
            }
            Component.onCompleted: {
                elementPage.dataFile = dataFile
                coverId.elementData = elementPage.values
            }
        }

    }
    allowedOrientations: Orientation.All
    cover: CoverPage {
        id: coverId
        elementData: elementPage.values
    }
    ElementDataPage {
        id: elementPage
        onElementNumberChanged: {
            cover.changeElement(elementPage.values)
        }
        dataFile: dataFile
    }
    AboutPage {
        id: aboutPage
    }

}
