QT -= gui

CONFIG += c++20 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += ../../OpenHydroQual/aquifolium/include/
INCLUDEPATH += ../../OpenHydroQual/aquifolium/include/GA/
INCLUDEPATH += ../../OpenHydroQual/aquifolium/src/
INCLUDEPATH += ../../jsoncpp/include/

SOURCES += \
        ../../OpenHydroQual/aquifolium/src/Block.cpp \
        ../../OpenHydroQual/aquifolium/src/Command.cpp \
        ../../OpenHydroQual/aquifolium/src/Condition.cpp \
        ../../OpenHydroQual/aquifolium/src/ErrorHandler.cpp \
        ../../OpenHydroQual/aquifolium/src/Expression.cpp \
        ../../OpenHydroQual/aquifolium/src/GA/Binary.cpp \
        ../../OpenHydroQual/aquifolium/src/GA/Distribution.cpp \
        ../../OpenHydroQual/aquifolium/src/GA/DistributionNUnif.cpp \
        ../../OpenHydroQual/aquifolium/src/GA/Individual.cpp \
        ../../OpenHydroQual/aquifolium/src/Link.cpp \
        ../../OpenHydroQual/aquifolium/src/Matrix.cpp \
        ../../OpenHydroQual/aquifolium/src/Matrix_arma.cpp \
        ../../OpenHydroQual/aquifolium/src/MetaModel.cpp \
        ../../OpenHydroQual/aquifolium/src/NormalDist.cpp \
        ../../OpenHydroQual/aquifolium/src/Object.cpp \
        ../../OpenHydroQual/aquifolium/src/Objective_Function.cpp \
        ../../OpenHydroQual/aquifolium/src/Objective_Function_Set.cpp \
        ../../OpenHydroQual/aquifolium/src/Parameter.cpp \
        ../../OpenHydroQual/aquifolium/src/Parameter_Set.cpp \
        ../../OpenHydroQual/aquifolium/src/Precipitation.cpp \
        ../../OpenHydroQual/aquifolium/src/Quan.cpp \
        ../../OpenHydroQual/aquifolium/src/QuanSet.cpp \
        ../../OpenHydroQual/aquifolium/src/QuickSort.cpp \
        ../../OpenHydroQual/aquifolium/src/Rule.cpp \
        ../../OpenHydroQual/aquifolium/src/RxnParameter.cpp \
        ../../OpenHydroQual/aquifolium/src/Script.cpp \
        ../../OpenHydroQual/aquifolium/src/Source.cpp \
        ../../OpenHydroQual/aquifolium/src/System.cpp \
        ../../OpenHydroQual/aquifolium/src/Utilities.cpp \
        ../../OpenHydroQual/aquifolium/src/Vector.cpp \
        ../../OpenHydroQual/aquifolium/src/Vector_arma.cpp \
        ../../OpenHydroQual/aquifolium/src/constituent.cpp \
        ../../OpenHydroQual/aquifolium/src/observation.cpp \
        ../../OpenHydroQual/aquifolium/src/precalculatedfunction.cpp \
        ../../OpenHydroQual/aquifolium/src/reaction.cpp \
        ../../OpenHydroQual/aquifolium/src/restorepoint.cpp \
        ../../OpenHydroQual/aquifolium/src/solutionlogger.cpp \
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
    ../../OpenHydroQual/aquifolium/include/Block.h \
    ../../OpenHydroQual/aquifolium/include/Condition.h \
    ../../OpenHydroQual/aquifolium/include/Expression.h \
    ../../OpenHydroQual/aquifolium/include/GA/GA.hpp \
    ../../OpenHydroQual/aquifolium/include/Link.h \
    ../../OpenHydroQual/aquifolium/include/Matrix.h \
    ../../OpenHydroQual/aquifolium/include/Matrix_arma.h \
    ../../OpenHydroQual/aquifolium/include/MetaModel.h \
    ../../OpenHydroQual/aquifolium/include/Object.h \
    ../../OpenHydroQual/aquifolium/include/Parameter.h \
    ../../OpenHydroQual/aquifolium/include/Precipitation.h \
    ../../OpenHydroQual/aquifolium/include/Quan.h \
    ../../OpenHydroQual/aquifolium/include/QuanSet.h \
    ../../OpenHydroQual/aquifolium/include/RxnParameter.h \
    ../../OpenHydroQual/aquifolium/include/Source.h \
    ../../OpenHydroQual/aquifolium/include/System.h \
    ../../OpenHydroQual/aquifolium/include/Vector.h \
    ../../OpenHydroQual/aquifolium/include/Vector_arma.h \
    ../../OpenHydroQual/aquifolium/include/constituent.h \
    ../../OpenHydroQual/aquifolium/include/observation.h \
    ../../OpenHydroQual/aquifolium/include/precalculatedfunction.h \
    ../../OpenHydroQual/aquifolium/include/reaction.h \
    ../../OpenHydroQual/aquifolium/src/BTC.hpp \
    ../../OpenHydroQual/aquifolium/src/BTCSet.hpp


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
