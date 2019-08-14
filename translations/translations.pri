TRANSLATION_SOURCES += ../src

TRANSLATIONS = translations/harbour-jaksari-fi.ts \
               translations/harbour-jaksari-sv.ts \
               translations/harbour-jaksari-zh_CN.ts

updateqm.input = TRANSLATIONS
updateqm.output = translations/${QMAKE_FILE_BASE}.qm
updateqm.commands = \
        lrelease ${QMAKE_FILE_IN} \
        -qm translations/${QMAKE_FILE_BASE}.qm
updateqm.CONFIG += no_link
QMAKE_EXTRA_COMPILERS += updateqm

PRE_TARGETDEPS += compiler_updateqm_make_all

localization.files = $$files($$top_builddir/translations/*.qm)
localization.path = /usr/share/$${TARGET}/translations

INSTALLS += localization
