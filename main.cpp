#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <string>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("project", "Main");

    return app.exec();
}

std::string govno() {
    return "asdasd";
}
