TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        main.cpp

macx {
    # Boost.
    QMAKE_CXXFLAGS += -std=c++17

    INCLUDEPATH += "/usr/local/Cellar/boost/1.76.0/include/"
    LIBS += -L/usr/local/Cellar/boost/1.76.0/lib/
    ## Use only one of these:
    LIBS += -lboost_filesystem -lboost_system# -lboost_asio# using dynamic lib
    #LIBS += $${_BOOST_PATH}/lib/libboost_chrono-mt.a # using static lib
}

HEADERS += \
    DiffieHellman/DiffieHellman.h \
    DiffieHellman/RedTypes.h
