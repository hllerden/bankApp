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
    void passwordForgetResponse(const QVariant &response);
public slots:
    //bool loginPassForgetStep1(const QString &username, const QString &email);                           // ilk olarak kullanıcı adı ve email doğruysa true döndürüp kullanıcıya güvenlik sorusunu soracak.
    //bool loginPassForgetStep2(const QString &username, const QString &email, const QString &sec_ans);   // güvenlik sorusunun cevabı doğruysa true döndürüp kullanıcıya yeni şifresini soracak.
    //bool loginPassForgetStep3(const QString &username, const QString &email, const QString &newPass);   // yeni şifre doğruysa true döndürüp kullanıcıya şifresini değiştirdiğini bildirecek.

    bool loginPassForget(const QString &username, const QString &email,const QString &sec_ans = QString() ,const QString &newPass = QString());
    QVariant loginPassForget2(const QString &username, const QString &email,  const QString &newPass = QString());

    bool loginRequest(const QString &username, const QString &password);
    bool newPassword(const QString &newpassword);
    void doSomething();
};

#endif // LOGINMANAGER_H
