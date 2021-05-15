# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed
#   - name definiton in yaml file have to be changed


# The name of your application
TARGET = harbour-jaksari

CONFIG += sailfishapp

HEADERS += \
    src/filereader.h\
    src/translator.h

SOURCES += \
    src/filereader.cpp \
    src/jaksari.cpp \
    src/translator.cpp


DISTFILES += \
    qml/cover/CoverPage.qml \
    qml/harbour-jaksari.qml \
    qml/pages/ElementDataSection.qml \
    qml/pages/TableComponent.qml \
    rpm/harbour-jaksari.changes \
    rpm/harbour-jaksari.changes.run.in \
    rpm/harbour-jaksari.spec \
    rpm/harbour-jaksari.yaml \
    translations/*.ts \
    harbour-jaksari.desktop \
    qml/pages/*.qml \
    icons/128x128/harbour-jaksari.png

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

lupdate_only{
SOURCES += \
    qml/cover/CoverPage.qml \
    pages/data.js \
    qml/pages/*.qml
    HEADERS += src/transalatble.h
}

# Translations
CONFIG += sailfishapp_i18n
include(translations/translations.pri)


RESOURCES = data.qrc

DEFINES+=APP_VERSION=\\\"$$VERSION\\\"

