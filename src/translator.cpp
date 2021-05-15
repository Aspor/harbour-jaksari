#include "translator.h"

Translator::Translator()
{
    trans = new QTranslator(this);
    m_language="";
    if( QLocale().name().toStdString() == "zh_CN")
        m_language="CN";
}

void Translator::selectLanguage(int index) {
 qDebug()<<"selecte Language"<<index;
 if( index<6){
     qApp->removeTranslator(trans);

    auto succ = trans->load(translations[index], LOCALIZATIONPATH);//:/translatinos/");// "/opt/sdk/harbour-jaksari/usr/share/harbour-jaksari/translations");
    qDebug()<<succ<<"Trans"<<trans->isEmpty()<< QCoreApplication::applicationDirPath();
    m_language=translations[index].right(2);
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
