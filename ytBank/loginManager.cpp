#include "loginManager.h"

loginManager::loginManager(QObject *parent)
    : QObject{parent}
{
    qDebug() << "loginManager created";
    QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");

    db.setDatabaseName(path);

    if(!QFile::exists(path)) // eğer dastabase kurulmamışsa
    {
        //QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

        db.open();
        QSqlQuery query;

        query.prepare("CREATE TABLE IF NOT EXISTS users ("
                      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                      "username TEXT NOT NULL,"
                      "password TEXT NOT NULL,"
                      "firstname TEXT,"
                      "lastname TEXT,"
                      "age INTEGER"
                      ")");


        qDebug() << "Database created";
        bool success = query.exec();
        db.close();
        qInfo() << "Veritabanı Oluşturuldu ve tablolar eklendi: " << success;
    }
    else
    {
        //db.open();
        //QSqlQuery query;

        qDebug() << "Database already exists";
        //addPerson("admin","1234","admin","adminoğlu",26);
    }

}

loginManager::~loginManager()
{
    qDebug() << "loginManager destroyed";
}

bool loginManager::login(const QString &username, const QString &password)
{
    QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);

    db.open();

    QSqlQuery query;

    //QSqlDatabase db;
    query.prepare("SELECT * FROM users WHERE username = :username AND password = :password");
    query.bindValue(":username", username);
    query.bindValue(":password", password);
    query.exec();

    bool success = query.next();
    qDebug() << "Login result:" << success;

    emit loginResult(success);
    db.close();
    return success;
}

bool loginManager::addPerson(const QString &username, const QString &password, const QString &firstname, const QString &lastname, int age)
{
    QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);
    QSqlQuery query;

    //QSqlDatabase db;
    //db = QSqlDatabase::addDatabase("QSQLITE");

    if (!db.open()) {
        qDebug() << "Veritabanına bağlanılamadı: " << db.lastError().text();
    } else {
        qDebug() << "Veritabanına başarıyla bağlandı.";
    }
    query.prepare("INSERT INTO users (username, password, firstname, lastname, age) "
                  "VALUES (:username, :password, :firstname, :lastname, :age)");

    query.bindValue(":username", username);
    query.bindValue(":password", password);
    query.bindValue(":firstname", firstname);
    query.bindValue(":lastname", lastname);
    query.bindValue(":age", age);

    bool success = query.exec();
    db.close();
    if (success) {
        qDebug() << "Yeni kişi başarıyla eklendi.";
    } else {
        qDebug() << "Kişi eklenemedi: " << query.lastError().text();
    }
    //qInfo() << "Veritabanına kayıt eklendi: " << success;
    return success;
}

bool loginManager::loginRequest(const QString &username, const QString &password)
{
    qDebug() << "Login request received:" << username << password;
    return login(username, password);
}



void loginManager::doSomething()
{
    qDebug() << "doSometing called";
}
