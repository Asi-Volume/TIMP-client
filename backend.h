#ifndef BACKEND_H
#define BACKEND_H
#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h>
class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit Backend(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void login(const QString &login, const QString &password)
    {
        if (login.trimmed().isEmpty() && password.isEmpty()) {
            emit errorOccurred("Вы не ввели логин и пароль!");
            return;
        }

        if (login.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели логин!");
            return;
        }

        if (password.isEmpty()) {
            emit errorOccurred("Вы не ввели пароль!");
            return;
        }

        emit loginSucceeded();
    }
signals:
    void errorOccurred(const QString &message);
    void loginSucceeded();
};

#endif // BACKEND_H
