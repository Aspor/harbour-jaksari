#include "translator.h"

Translator::Translator()
{
    trans = new QTranslator(this);
    m_language="";
    if( QLocale().name().split("_").takeLast().left(2) == "zh")
        m_language="zh";
}

void Translator::selectLanguage(int index) {
 qDebug()<<"selecte Language"<<index;
 if( index<6){
    qApp->removeTranslator(trans);
    trans->load(translations[index], LOCALIZATIONPATH);//:/translatinos/");// "/opt/sdk/harbour-jaksari/usr/share/harbour-jaksari/translations");
    m_language=translations[index].split("-").takeLast().left(2);
    qApp->installTranslator(trans);
    emit languageChanged();
  }
 else {
     qApp->removeTranslator(trans);
     emit languageChanged();
 }
}

QString Translator::getEmptyString() {
 return "";
}
QString Translator::getLanguage() {
 return m_language;
}
