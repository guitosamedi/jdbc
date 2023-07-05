package org.example;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class TestProperties {
    private static final String DB_URL;
    private static final String DB_LOGIN;
    private static final String DB_PWD;

    //private int[] tab;

    static {
        ResourceBundle bundle = ResourceBundle.getBundle("db");
        DB_URL = bundle.getString("db.url");
        DB_LOGIN = bundle.getString("db.user");
        DB_PWD = bundle.getString("db.pwd");
    }
    /* VOIR COURS
    {
        tab = new int[10];
        for (int i = 0; i < tab.length; i++){
            tab[i] = -1;
        }
        System.out.println("Ceci est commun à tous me sconstructeurs");
    }
    */

    public static void main(String[] args) throws SQLException {
        // TestProperties test = new TestProperties();

        try (Connection cnx = DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD)) {
            System.out.println(cnx);
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting DB !");
        }
    }
}
