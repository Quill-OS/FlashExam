#include "flashexam.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    flashExam w;
    w.show();
    return a.exec();
}
