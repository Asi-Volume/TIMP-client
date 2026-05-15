#ifndef BACKEND_H
#define BACKEND_H
#include <QObject>
#include <QTcpSocket>
#include <QString>
#include <QtQml/qqmlregistration.h>
class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit Backend(QObject *parent = nullptr) : QObject(parent), m_socket(new QTcpSocket(this))
    {
        connect(m_socket, &QTcpSocket::connected, this, [this]() {
            emit statusChanged("Подключено к серверу");
        });

        connect(m_socket, &QTcpSocket::readyRead, this, &Backend::onReadyRead);

        connect(m_socket, &QTcpSocket::errorOccurred, this, [this](QAbstractSocket::SocketError) {
            emit errorOccurred("Ошибка сети: " + m_socket->errorString());
        });

        // сразу подключаемся к серверу
        m_socket->connectToHost("172.20.10.4", 33333);
    }

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

        if (m_socket->state() != QAbstractSocket::ConnectedState) {
            emit errorOccurred("Нет подключения к серверу");
            return;
        }

        QString request = QString("auth&%1&%2\n").arg(login, password);
        m_socket->write(request.toUtf8());
        m_socket->flush();
    }
    Q_INVOKABLE void registrations(const QString &email, const QString &login, const QString &password,const QString &password2) {
        if (email.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели почту");
            return;
        }
        if (login.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели логин");
            return;
        }
        if (password.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели пароль");
            return;
        }
        if (password2.trimmed().isEmpty()) {
            emit errorOccurred("Введите ваш пароль повторно");
            return;
        }
        if (password.trimmed() != password2.trimmed()) {
            emit errorOccurred("Вы неверно повторили ваш пароль!");
            return;
        }
        if (m_socket->state() != QAbstractSocket::ConnectedState) {
            emit errorOccurred("Нет подключения к серверу");
            return;
        }

        QString request = QString("reg&%1&%2&%3\n").arg(login, password, email);
        m_socket->write(request.toUtf8());
        m_socket->flush();
    }

    Q_INVOKABLE void forgetpassword(const QString &email) {
        if (request == true) {
            emit errorOccurred("Пожалуйста подождите!");
            return;
        }
        if (email.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели почту");
            return;
        }
        if (m_socket->state() != QAbstractSocket::ConnectedState) {
            emit errorOccurred("Нет подключения к серверу");
            return;
        }
        request = true;
        QString request = QString("recover_code&%1\n").arg(email);
        m_socket->write(request.toUtf8());
        m_socket->flush();
    }
    Q_INVOKABLE void codemail(const QString &email, const QString &code, const QString &password, const QString &newpassword) {
        if (email.trimmed().isEmpty()) {
            emit errorOccurred("Попробуйте снова.");
            return;
        }
        if (code.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели код подтверждения.");
            return;
        }
        if (password.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели новый пароль.");
            return;
        }
        if (newpassword.trimmed().isEmpty()) {
            emit errorOccurred("Вы не ввели повтор пароля.");
            return;
        }
        if (password.trimmed().isEmpty() != newpassword.trimmed().isEmpty()) {
            emit errorOccurred("Повтор пароля не верный!");
            return;
        }
        QString request = QString("recover_conf&%1&%2&%3\n").arg(email, code, password);
        m_socket->write(request.toUtf8());
        m_socket->flush();
    }
signals:
    void errorOccurred(const QString &message);
    void loginSucceeded();
    void registration();
    void statusChanged(const QString &message);
    void sendCode();
    void recoverPassword();
private:
    void onReadyRead()
    {
        m_buffer += QString::fromUtf8(m_socket->readAll());

        while (m_buffer.contains('\n')) {
            int idx = m_buffer.indexOf('\n');
            QString response = m_buffer.left(idx).trimmed();
            m_buffer.remove(0, idx + 1);

            if (response.startsWith("auth+&")) {
                emit loginSucceeded();
            } else if (response == "auth-") {
                emit errorOccurred("Неверный логин или пароль");
            } else if (response.startsWith("reg+&")) {
                emit registration();
            } else if (response == "recover_code-") {
                request = false;
                emit errorOccurred("Аккаунт не найден!");
            } else if (response == "recover_code+") {
                emit sendCode();
                request=false;
            } else if (response == "recover_conf+") {
                emit recoverPassword();
            }
            else {
                emit errorOccurred("Неизвестный ответ сервера: " + response);
            }

        }
    }
    QTcpSocket *m_socket;
    bool request = false;
    QString m_buffer;
};

#endif // BACKEND_H
