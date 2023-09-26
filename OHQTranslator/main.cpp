#include <QCoreApplication>
#include "System.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    MetaModel M;
    M.AppendFromJsonFile("/home/arash/Projects/OpenHydroQual/resources/unsaturated_soil.json");
    QuanSet* qset = M.GetItem("Soil");
    qset->CreateCPPcode("/home/arash/Dropbox/OHQCPP/soil.cpp","/home/arash/Dropbox/OHQCPP/soil.h");
    return a.exec();
}
