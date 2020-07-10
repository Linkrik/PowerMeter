#include "sw_platform.h"

#include <QApplication>


#include <QStyleFactory>
#include <QFile>
#include <QTextStream>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);


//    QApplication::setStyle(QStyleFactory::create("Windows"));

//    QFile style_file(QDir::currentPath() + "/styles/Darkeum.qss"); /** + */
    QFile style_file(QDir::currentPath() + "/styles/Mig.qss"); /** + */
//    QFile style_file(QDir::currentPath() + "/styles/QtDark.qss"); /** + */
//    QFile style_file(QDir::currentPath() + "/styles/Devsion.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/Diffnes.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/Eclippy.qss");   /** + */
//    QFile style_file(QDir::currentPath() + "/styles/Gravira.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/Integrid.qss");   /** + */
//    QFile style_file(QDir::currentPath() + "/styles/Irrorater.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/Obit.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/SpyBot.qss");   /** - */
//    QFile style_file(QDir::currentPath() + "/styles/SyNet.qss");   /** - */
    style_file.open(QFile::ReadOnly | QFile::Text);
    QTextStream stream(&style_file);
    a.setStyleSheet(stream.readAll());

    sw_platform w;
    w.show();
    return a.exec();
}
