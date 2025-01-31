QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    flashexam.cpp \
    main.cpp \

HEADERS += \
    flashexam.h \

FORMS += \
    flashexam.ui \

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# Thanks to https://github.com/mrbindraw/TestVersion/blob/master/TestVersion.pro
GIT_VERSION = $$system(git describe --always --tags)
GIT_COMMIT = $$system(git rev-parse HEAD)
COMMAND_REMOVE_MAKEFILES=$$quote(rm $$system_path($$OUT_PWD\Makefile*))
PRE_BUILD_TARGET = .dummyfile
updatemakefiles.target = $$PRE_BUILD_TARGET
updatemakefiles.commands = $$COMMAND_REMOVE_MAKEFILES
updatemakefiles.depends = FORCE
PRE_TARGETDEPS += $$PRE_BUILD_TARGET
QMAKE_EXTRA_TARGETS += updatemakefiles
DEFINES += GIT_VERSION=\\\"$$GIT_VERSION\\\"
DEFINES += GIT_COMMIT=\\\"$$GIT_COMMIT\\\"
DEFINES += PCBUILD=1

RESOURCES += \
     resources.qrc
