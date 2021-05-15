#include "translator.h"

Translator::Translator()
{
    trans = new QTranslator(this);
}

void Translator::selectLanguage(int index) {
 qDebug()<<"selecte Language"<<index;
 if(index>0 && index<6){
    bool succsess = trans->load(translations[index-1],"/opt/sdk/harbour-jaksari/usr/share/harbour-jaksari/translations");
    qDebug()<<"select Language"<<trans->isEmpty()<<translations[index-1]<<succsess<<QDir::currentPath();


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
