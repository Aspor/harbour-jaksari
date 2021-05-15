#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QtGui>

class Translator: public QObject
{
        Q_OBJECT
        Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
        Q_PROPERTY(QString language READ getLanguage NOTIFY languageChanged)

public:
    Translator();

    QString getEmptyString();
    QString getLanguage();

    Q_INVOKABLE void selectLanguage(int language);
signals:
 void languageChanged();

private:
     QTranslator* trans;
     QString translations[6] = {"harbour-jaksari-en"
                                ,"harbour-jaksari-fi",
             "harbour-jaksari-sv",
             "harbour-jaksari-zh_CN",
             "harbour-jaksari-ru",
             "harbour-jaksari-de"};
    QString m_language;
};

#endif // TRANSLATOR_H
