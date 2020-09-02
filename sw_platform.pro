QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11 staticlib

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    detector.cpp \
    eventprocessor.cpp \
    main.cpp \
    managergui.cpp \
    measurer.cpp \
    sw_platform.cpp

HEADERS += \
    detector.h \
    eventprocessor.h \
    managergui.h \
    measurer.h \
    sw_platform.h

FORMS += \
    sw_platform.ui

#LIBS += $$PWD"/libs/VISA/WinNT/lib/msc/rsnrpz_32.lib" #G:/Qt/sw_platform/sw_platform visa64
#LIBS += $$PWD"/libs/VISA/WinNT/lib/msc/NrpControl2.lib"NrpControl2_64
LIBS += $$PWD"/libs/VISA/Win64/lib/msc/rsnrpz_64.lib"
LIBS += $$PWD"/libs/VISA/Win64/lib/msc/NrpControl2_64.lib"

INCLUDEPATH += $$PWD"/libs/VISA/WinNT/Include"

INCLUDEPATH += $$PWD"/sw_platform/libs"

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
