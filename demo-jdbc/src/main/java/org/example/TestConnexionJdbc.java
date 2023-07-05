package org.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class TestConnexionJdbc {
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/compta";
    private static final String DB_LOGIN = "root";
    private static final String DB_PWD = "";

    public static void main(String[] args) throws SQLException {

        try(Connection cnx = DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD)){
            System.out.println(cnx);
        } catch (SQLException a){
            throw new RuntimeException("error connecting DB !");
        }

    }
}