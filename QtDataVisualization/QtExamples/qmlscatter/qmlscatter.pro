INCLUDEPATH += ../../../include

LIBS += -L$$OUT_PWD/../../../lib

TEMPLATE = app

QT += datavisualization

contains(TARGET, qml.*) {
    QT += qml quick
}

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

RESOURCES += qmlscatter.qrc

OTHER_FILES += doc/src/* \
               doc/images/* \
               qml/qmlscatter/*
