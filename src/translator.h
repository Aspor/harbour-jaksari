#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QtGui>

class Translator: public QObject
{
        Q_OBJECT
        Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    Translator();

    QString getEmptyString();
    Q_INVOKABLE void selectLanguage(int language);
signals:
 void languageChanged();

private:
     QTranslator* trans;
     QString translations[5] = {"harbour-jaksari-fi",
             "harbour-jaksari-sv",
             "harbour-jaksari-zh_CN",
             "harbour-jaksari-ru",
             "harbour-jaksari-de"};

};

#endif // TRANSLATOR_H
