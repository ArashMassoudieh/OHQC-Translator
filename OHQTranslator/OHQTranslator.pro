QT -= gui

CONFIG += c++20 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += ../../QAquifolium/aquifolium/include/
INCLUDEPATH += ../../QAquifolium/aquifolium/include/GA/
INCLUDEPATH += ../../QAquifolium/aquifolium/src/
INCLUDEPATH += ../../jsoncpp/include/

SOURCES += \
        ../../QAquifolium/aquifolium/src/Block.cpp \
        ../../QAquifolium/aquifolium/src/Command.cpp \
        ../../QAquifolium/aquifolium/src/Condition.cpp \
        ../../QAquifolium/aquifolium/src/ErrorHandler.cpp \
        ../../QAquifolium/aquifolium/src/Expression.cpp \
        ../../QAquifolium/aquifolium/src/GA/Binary.cpp \
        ../../QAquifolium/aquifolium/src/GA/Distribution.cpp \
        ../../QAquifolium/aquifolium/src/GA/DistributionNUnif.cpp \
        ../../QAquifolium/aquifolium/src/GA/Individual.cpp \
        ../../QAquifolium/aquifolium/src/Link.cpp \
        ../../QAquifolium/aquifolium/src/Matrix.cpp \
        ../../QAquifolium/aquifolium/src/Matrix_arma.cpp \
        ../../QAquifolium/aquifolium/src/MetaModel.cpp \
        ../../QAquifolium/aquifolium/src/NormalDist.cpp \
        ../../QAquifolium/aquifolium/src/Object.cpp \
        ../../QAquifolium/aquifolium/src/Objective_Function.cpp \
        ../../QAquifolium/aquifolium/src/Objective_Function_Set.cpp \
        ../../QAquifolium/aquifolium/src/Parameter.cpp \
        ../../QAquifolium/aquifolium/src/Parameter_Set.cpp \
        ../../QAquifolium/aquifolium/src/Precipitation.cpp \
        ../../QAquifolium/aquifolium/src/Quan.cpp \
        ../../QAquifolium/aquifolium/src/QuanSet.cpp \
        ../../QAquifolium/aquifolium/src/QuickSort.cpp \
        ../../QAquifolium/aquifolium/src/Rule.cpp \
        ../../QAquifolium/aquifolium/src/RxnParameter.cpp \
        ../../QAquifolium/aquifolium/src/Script.cpp \
        ../../QAquifolium/aquifolium/src/Source.cpp \
        ../../QAquifolium/aquifolium/src/System.cpp \
        ../../QAquifolium/aquifolium/src/Utilities.cpp \
        ../../QAquifolium/aquifolium/src/Vector.cpp \
        ../../QAquifolium/aquifolium/src/Vector_arma.cpp \
        ../../QAquifolium/aquifolium/src/constituent.cpp \
        ../../QAquifolium/aquifolium/src/observation.cpp \
        ../../QAquifolium/aquifolium/src/precalculatedfunction.cpp \
        ../../QAquifolium/aquifolium/src/reaction.cpp \
        ../../QAquifolium/aquifolium/src/restorepoint.cpp \
        ../../QAquifolium/aquifolium/src/solutionlogger.cpp \
        ../../jsoncpp/src/lib_json/json_reader.cpp \
        ../../jsoncpp/src/lib_json/json_value.cpp \
        ../../jsoncpp/src/lib_json/json_writer.cpp \
        main.cpp

TRANSLATIONS += \
    OHQTranslator_en_US.ts


CONFIG(debug, debug|release) {
    message(Building in debug mode)
    !macx: QMAKE_CXXFLAGS *= "-Xpreprocessor -fopenmp"
    !macx: QMAKE_LFLAGS +=  -fopenmp
    !macx: LIBS += -lgomp -lpthread
    LIBS += -lpthread
    DEFINES += _NO_OPENMP DEBUG

} else {
    message(Building in release mode)
    !macx: QMAKE_CXXFLAGS *= "-Xpreprocessor -fopenmp"
    !macx: QMAKE_LFLAGS +=  -fopenmp
    # QMAKE_CFLAGS+=-pg
    # QMAKE_CXXFLAGS+=-pg
    # QMAKE_LFLAGS+=-pg
    # macx: DEFINES += NO_OPENMP
    ! macx: LIBS += -lgomp -lpthread
    macx: LIBS += -lpthread
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ../../QAquifolium/aquifolium/include/Block.h \
    ../../QAquifolium/aquifolium/include/Condition.h \
    ../../QAquifolium/aquifolium/include/Expression.h \
    ../../QAquifolium/aquifolium/include/GA/GA.hpp \
    ../../QAquifolium/aquifolium/include/Link.h \
    ../../QAquifolium/aquifolium/include/Matrix.h \
    ../../QAquifolium/aquifolium/include/Matrix_arma.h \
    ../../QAquifolium/aquifolium/include/MetaModel.h \
    ../../QAquifolium/aquifolium/include/Object.h \
    ../../QAquifolium/aquifolium/include/Parameter.h \
    ../../QAquifolium/aquifolium/include/Precipitation.h \
    ../../QAquifolium/aquifolium/include/Quan.h \
    ../../QAquifolium/aquifolium/include/QuanSet.h \
    ../../QAquifolium/aquifolium/include/RxnParameter.h \
    ../../QAquifolium/aquifolium/include/Source.h \
    ../../QAquifolium/aquifolium/include/System.h \
    ../../QAquifolium/aquifolium/include/Vector.h \
    ../../QAquifolium/aquifolium/include/Vector_arma.h \
    ../../QAquifolium/aquifolium/include/constituent.h \
    ../../QAquifolium/aquifolium/include/observation.h \
    ../../QAquifolium/aquifolium/include/precalculatedfunction.h \
    ../../QAquifolium/aquifolium/include/reaction.h \
    ../../QAquifolium/aquifolium/src/BTC.hpp \
    ../../QAquifolium/aquifolium/src/BTCSet.hpp


win32 {

    LAPACK_INCLUDE = $$PWD/include
    #64 bits build
    contains(QMAKE_TARGET.arch, x86_64) {
        #debug
        CONFIG(debug, debug|release) {
            LAPACK_LIB_DIR = $$PWD/libs/lapack-blas_lib_win64/debug
            LIBS +=  -L$${LAPACK_LIB_DIR} -llapack_win64_MTd \
                    -lblas_win64_MTd
        }
        #release
        CONFIG(release, debug|release) {
            LAPACK_LIB_DIR = $$PWD/libs/lapack-blas_lib_win64/release
            LIBS +=  -L$${LAPACK_LIB_DIR} -llapack_win64_MT \
                    -lblas_win64_MT
        }
    }

    INCLUDEPATH += $${LAPACK_INCLUDE}

    DEFINES += ARMA_USE_LAPACK ARMA_USE_BLAS

}

linux {
    #sudo apt-get install libblas-dev liblapack-dev
     DEFINES += ARMA_USE_LAPACK ARMA_USE_BLAS
     LIBS += -larmadillo -llapack -lblas
}

macx {
    #sudo apt-get install libblas-dev liblapack-dev
    message( $$PWD )
     DEFINES += ARMA_USE_LAPACK ARMA_USE_BLAS
     LIBS += -L$$PWD/../Armadillo/ -llapack.3.10.1
     LIBS += -L$$PWD/../Armadillo/ -lblas.3.10.1
     LIBS += -L$$PWD/../Armadillo/ -larmadillo.11.2.3
     INCLUDEPATH += $$PWD/../Armadillo/include/
     DEPENDPATH += $$PWD/../Armadillo
}
