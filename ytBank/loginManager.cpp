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
                      "email TEXT NOT NULL,"
                      "firstname TEXT,"
                      "lastname TEXT,"
                      "age INTEGER,"
                      "sec_ques TEXT,"
                      "sec_ans TEXT,"
                      "phone_number	TEXT,"
                      "address	TEXT,"
                      "city	TEXT,"
                      "state	TEXT,"
                      "postal_code	INTEGER,"
                      "country	TEXT,"
                      "nationality	TEXT,"
                      "gender	TEXT,"
                      "date_of_birth	TEXT,"
                      "occupation	TEXT,"
                      "income	REAL,"
                      "account_balance	REAL,"
                      "credit_score	INTEGER,"
                      "credit_limit	REAL,"
                      "account_type	TEXT,"
                      "account_number	REAL,"
                      "account_open_date	TEXT,"
                      "account_status	TEXT,"
                      "last_login	TEXT,"
                      "transaction_history	TEXT,"
                      "debit_card_number	REAL,"
                      "debit_card_expiry TEXT,"
                      "debit_card_cvv	INTEGER,"
                      "credit_card_number	REAL,"
                      "credit_card_expiry	TEXT,"
                      "credit_card_cvv	INTEGER,"
                      "loan_amount	REAL,"
                      "loan_interest_rate	REAL,"
                      "loan_approval_date	TEXT,"
                      "loan_duration	INTEGER,"
                      "loan_repayment_amount	REAL"
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
        //addPerson("admin","12345","admin@admin.com","admin","adminoğlu",26,"kayinco tatlı yedi tatladı....","bende öpücük aldım");
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

bool loginManager::addPerson(const QString &username, const QString &password,const QString &email,
                             const QString &firstname, const QString &lastname, int age,
                             const QString &sec_ques, const QString &sec_ans)
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
    query.prepare("INSERT INTO users (username, password,email, firstname, lastname, age,sec_ques,sec_ans) "
                  "VALUES (:username, :password, :email, :firstname, :lastname, :age, :sec_ques, :sec_ans)");

    query.bindValue(":username", username);
    query.bindValue(":password", password);
    query.bindValue(":email", email);
    query.bindValue(":firstname", firstname);
    query.bindValue(":lastname", lastname);
    query.bindValue(":age", age);
    query.bindValue(":sec_ques", sec_ques);
    query.bindValue(":sec_ans", sec_ans);

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

bool loginManager::loginPassForget(const QString &username, const QString &email, const QString &sec_ans, const QString &newPass)
{   //sıkıntısız çalışıyor ama varyant olarak hepsini döndürmek istiyorum.
    if(newPass.isEmpty()) // eğer yeni şifre yoksa
    {
        if(sec_ans.isEmpty())
        {
            // ilk aşamadadır.
            // bu aşamada username ve pass geliyor.databaseden kontorl edilip onay dönecek.
            // onay dönerse 2. aşamaya geçecek.
            QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
            db.setDatabaseName(path);
            QSqlQuery query;
            if (!db.open()) {
                qDebug()<< "[loginPassForget::1.Aşama]" << "Veritabanına bağlanılamadı: " << db.lastError().text();
            } else {
                qDebug()<< "[loginPassForget::1.Aşama]"  << "Veritabanına başarıyla bağlandı.";
            }
            query.prepare("SELECT * FROM users WHERE username = :username AND email = :email");
            query.bindValue(":username", username);
            query.bindValue(":email", email);
            query.exec();

            bool success = query.next();
            qDebug()<< "[loginPassForget::1.Aşama]"  << "PassForget Login result:" << success;
            db.close();

        }
        else
        {
            // ikinci aşamadadır.
        }
    }
    else
    {
            // yeni şifre varsa 3. aşamadadır.

    }
}


QVariant loginManager::loginPassForget2(const QString &username, const QString &email, const QString &newPass)
{
    QVariantList result;
    QVariantMap userInfo;
    // Qvaryant Yapısı  | bool isErrorMessageExis?|error Message|info| 1.adım user&mail check Bool | user first name | String Question to Qml | secQuestCheck Bool |newPassChekOk&chance bool |

    if(!username.isEmpty() & !email.isEmpty() & newPass.isEmpty())
    {
        QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName(path);
        QSqlQuery query;
        if (!db.open()) {
            qDebug()<< "[loginPassForget::1.Aşama]" << "Veritabanına bağlanılamadı: " << db.lastError().text();
        } else {
            qDebug()<< "[loginPassForget::1.Aşama]"  << "Veritabanına başarıyla bağlandı.";
        }

        query.prepare("SELECT * FROM users WHERE username = :username AND email = :email");
        query.bindValue(":username", username);
        query.bindValue(":email", email);

        if((query.exec()&&query.next()))
        {   QVariantMap userInfo;
            qDebug()<< "[loginPassForget::2.Aşama]"  << "PassForget Login result:" << true;

            userInfo["username"] = query.value(1).toString();
            userInfo["password"] = query.value(2).toString();
            userInfo["email"] = query.value(3).toString();
            userInfo["firstname"] = query.value(4).toString();
            userInfo["lastname"] = query.value(5).toString();
            userInfo["age"] = query.value(6).toInt();
            userInfo["sec_ques"] = query.value(7).toString();
            userInfo["sec_ans"] = query.value(8).toString();

            result << true <<userInfo;
            db.close();

            emit passwordForgetResponse(QVariant::fromValue(result));
            return QVariant::fromValue(result);
        }
        else
        {
            result << false << "Username or email does not match!" << "";
                emit passwordForgetResponse(QVariant::fromValue(result));

                return QVariant::fromValue(result);
        }
    }
    else if(!username.isEmpty() & !email.isEmpty() & !newPass.isEmpty())
    {
        // username
        // email
        // new password
        // everything is ok change the password from database

        qDebug()<< "Gönderilen bilgiler: <" << username <<"<"<< email<<"<" << newPass;

        QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName(path);
        QSqlQuery query;
        if (!db.open()) {
                qDebug()<< "[loginPassForget::3.Aşama]" << "Veritabanına bağlanılamadı: " << db.lastError().text();
        } else {
                qDebug()<< "[loginPassForget::3.Aşama]"  << "Veritabanına başarıyla bağlandı.";
        }
        query.prepare("UPDATE users SET password = :password WHERE username = :username AND email = :email");
        query.bindValue(":password", newPass);
        query.bindValue(":username", username);
        query.bindValue(":email", email);

        if(query.exec())
        {
                result << true <<" Şifre değiştirme işlemi başarılı" ;
                emit passwordForgetResponse(QVariant::fromValue(result));
                return QVariant::fromValue(result);
                db.close();
        }
        else
        {
               qDebug()<< "[loginPassForget::3.Aşama]"  <<"Şifre değiştirme işlemi başarısız" << query.lastError().text();
               result << false <<" Şifre değiştirme işlemi başarısız";
                emit passwordForgetResponse(QVariant::fromValue(result));
                return QVariant::fromValue(result);

        }

    }
    else{
        qInfo()<<"Else niye giriyor : " << username <<"<"<< email<< "<" << newPass << "isemty result"<<!username.isEmpty()<<"<"<<!email.isEmpty()<<"<"<<!newPass.isEmpty();
        result << false << "Username or email cannot be empty!" << "";
            emit passwordForgetResponse(QVariant::fromValue(result));

        return QVariant::fromValue(result);
    }


}


bool loginManager::loginRequest(const QString &username, const QString &password)
{
    qDebug() << "Login request received:" << username << password;
    return login(username, password);
}

bool loginManager::newPassword(const QString &newpassword)
{
    qDebug() << "New Password request received:" << newpassword;

    QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);
    QSqlQuery query;

    if (!db.open()) {
        qDebug()<< "[loginPassForget::1.Aşama]" << "Veritabanına bağlanılamadı: " << db.lastError().text();
    } else {
        qDebug()<< "[loginPassForget::1.Aşama]"  << "Veritabanına başarıyla bağlandı.";
    }

    //query.prepare("UPDATE users SET password = :password WHERE username = :username");
    query.prepare("UPDATE users SET password = :password WHERE username = :username AND email = :email");
    query.bindValue(":password", newpassword);







    return true;
}



void loginManager::doSomething()
{
    qDebug() << "doSometing called";
}
