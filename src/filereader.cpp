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
    QVector<QVariant> values=QVector<QVariant>();
    QVector<QString> keyVec = QVector<QString>();
    QStringList keys = m_element.keys();
    for (int i=0;i<18;i++){
        QString key = keys[detailIndexes[i]];
        if(i==17) {
            QJsonArray a = m_element.value(key).toArray();
            QString s="";
            foreach (QJsonValue v, a) {
                s+=QString::number(v.toDouble())+"; ";
            }
            s.remove(s.length()-2,2);
            values.push_back(s);
        }
        else {
            values.push_back(m_element.value(key).toVariant());
        }
        key.replace('_',' ');
        key[0]=key[0].toUpper();
        keyVec.push_back(key);
    }
    m_values=QVariantList::fromVector(values);
    m_keyList=QStringList::fromVector(keyVec);
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
