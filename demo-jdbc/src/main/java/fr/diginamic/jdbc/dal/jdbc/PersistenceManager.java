package fr.diginamic.jdbc.dal.jdbc;
// import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

// Cette classe est final pour empêcher les classes enfants
public final class PersistenceManager {
    private static final String DB_URL;
    private static final String DB_LOGIN;
    private static final String DB_PWD;

    static {
        ResourceBundle bundle = ResourceBundle.getBundle("db");
        DB_URL = bundle.getString("db.url");
        DB_LOGIN = bundle.getString("db.user");
        DB_PWD = bundle.getString("db.pwd");
    }
    // Le constructeur est en privée afin de ne pas pouvoir créer d'objet
    private PersistenceManager(){}

    /* Sans Connection persistente
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD);
    }*/

    public static Connection getConnection() throws SQLException {
        if (connection  == null || !connection.isValid(2)){
            return DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD);
        }else {

        }
    }
}
