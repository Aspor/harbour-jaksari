/*Copyright (c) 2019 Timo Mäenpää
 *
 *Permission to use, copy, modify, and distribute this software for any
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

#include "filereader.h"
#include <QFile>
#include <QTextStream>

FileReader::FileReader() {
    m_elementData = read(":/data/periodicTable");
    locale = QLocale();
}

QJsonArray FileReader::read(QString name) {
    QFile file(name);
    file.open(QFile::ReadOnly);
    QByteArray data = file.readAll();
    QJsonObject obj = QJsonDocument::fromJson(data).object();
    file.close();

    return obj["elements"].toArray();
}
QJsonObject FileReader::getElementData() {
   return  m_element;
}
void FileReader::setElementNum(int num) {
    m_elementNum=num;
    m_element = m_elementData[m_elementNum].toObject();
    m_keyList.clear();
    m_values.clear();

    QStringList keys = m_element.keys();
    for (int i=0;i<18;i++){

        QString key = keys[detailIndexes[i]];
        QVariant value = m_element.value(key);
        QString s;
        double v;
        switch (i) {
        case 0: case 4: case 5: case 6: case 7: case 8:

            s = value.toString();
            s[0]=s[0].toUpper();
            m_values.push_back(s);
            break;
        case 11: case 12:
            v = value.toDouble();
            if( v!=0)
                m_values.push_back(locale.toString(v) + " K");
            else {
                m_values.push_back("");
            }
            break;
        case 9:
            v = value.toDouble();
            if( v!=0)
                m_values.push_back(locale.toString(v) + " g/mol");
            else {
                m_values.push_back("");
            }
            break;
        case 10:
            v = value.toDouble();
            if( v!=0)
                m_values.push_back(locale.toString(v) + " g/l");
            else {
                m_values.push_back("");
            }
            break;
        case 13:
            v = value.toDouble();
            if( v!=0)
                m_values.push_back(locale.toString(v) + " J/(mol·K)");
            else {
                m_values.push_back("");
            }
            break;
        case 14:
            v = value.toDouble();
            if( v!=0)
                m_values.push_back(locale.toString(v) + " kJ/mol");
            else {
                m_values.push_back("");
            }
            break;
        case 17: {
            QJsonArray a = m_element.value(key).toArray();
            foreach (QJsonValue v, a) {
                s+=locale.toString(v.toDouble())+"; ";
            }
            if(s.length()>0){
                s.remove(s.length()-2,2);
                s+=" kJ/mol";
            }
            else {
               s="";
            }
            m_values.push_back(s);
        }
        break;
        default:
            if(m_element.value(key).isNull())
                m_values.push_back("");
            else
                m_values.push_back(m_element.value(key).toVariant());
        break;
        }
        key.replace('_',' ');
        key[0]=key[0].toUpper();
        m_keyList.push_back(key);
    }

}
int FileReader::elementNum() {
    return m_elementNum;
}

QStringList FileReader::getKeys() {
    return m_keyList;
}
QVariantList FileReader::getValues() {
return m_values;
}

QVariantList FileReader::getElementsData(){
    return m_elementData.toVariantList();
}
