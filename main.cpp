/**
 * @file main.cpp
 * @brief Точка входа в клиентское приложение.
 * @details Инициализация движка QML, регистрация класса Backend для доступа из интерфейса
 * и загрузка основного окна приложения.
 */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <string>

/**
 * @brief Главная функция клиентского приложения.
 */
int main(int argc, char *argv[])
{
    // Инициализация графического движка для работы с окнами
    QGuiApplication app(argc, argv);

    // Создание движка QML
    QQmlApplicationEngine engine;

    // Обработка ошибки: выход при неудачном создании объекта
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    /**
     * @details Загрузка главного файла интерфейса.
     * "project" — имя модуля, заданное в CMake; "Main" — файл Main.qml.
     */
    engine.loadFromModule("project", "Main");

    // Запуск бесконечного цикла событий приложения
    return app.exec();
}
