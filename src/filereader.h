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

#ifndef FILEREADER_H
#define FILEREADER_H
#include <QtCore>
#include <QJsonObject>

#define GENERALPROPERTIES "name","symbol","number","period","category","appearance","discovered_by","named_by"
#define PHYSICALPROPERTIES "phase","atomic_mass","density","boil","melt","molar_heat"
#define ELECTICPROPERTIES "electron_affinity","electronegativity_pauling","electron_configuration","ionization_energies"
#define WIKIPEDIALINK "source"

class FileReader: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QJsonObject elementData READ getElementData)

    Q_PROPERTY(int elementNum READ elementNum WRITE setElementNum)
    Q_PROPERTY(QStringList keys READ getKeys )
    Q_PROPERTY(QVariantList values READ getValues )
    Q_PROPERTY(QVariantList elements READ getElementsData NOTIFY elementsLoaded )

public:
    FileReader();
    QJsonObject getElementData();
    void setElementNum(int);
    int elementNum();
    QStringList getKeys();
    QVariantList getValues();
    QVariantList getElementsData();
signals:
    void elementsLoaded();

private:
    QJsonArray read(QString name);
    QJsonArray  m_elementData;
    QJsonObject m_element;
    int m_elementNum;

    QStringList m_keyList;
    QVariantList m_values;

    QLocale locale;

    //Qt returns values from JSON sorted lexographically so order needs to be changed
//    const int detailIndexes[18] ={13,22,15,16,3,0,6,14,17,1,5,2,11,12,7,9,8,10};
//    const QString propertyOrder[19] = {GENERALPROPERTIES, PHYSICALPROPERTIES, ELECTICPROPERTIES, WIKIPEDIALINK};


};

#endif // FILEREADER_H




