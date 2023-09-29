#ifndef LOGINMANAGER_H
#define LOGINMANAGER_H

#include <QObject>
#include <QDebug>
#include <QtSql>
#include <QSqlError>


class loginManager : public QObject
{
    Q_OBJECT


public:
    explicit loginManager(QObject *parent = nullptr);
    ~loginManager();
    bool login(const QString &username, const QString &password);
    bool addPerson(const QString &username, const QString &password,const QString &email,
                   const QString &firstname, const QString &lastname, int age,
                   const QString &sec_ques, const QString &sec_ans);
private:
   // bool success= false;
    QDir databasePath;
    QString path=databasePath.currentPath()+"/userInformations.db"; // Not "myDb.db"
signals:
    void loginResult(const bool success);

public slots:
    bool loginRequest(const QString &username, const QString &password);
    void doSomething();
};

#endif // LOGINMANAGER_H
