package fr.diginamic.jdbc.resource;

import java.util.ResourceBundle;

public class CnxDB implements AutoCloseable {
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

    @Override
    public void close() throws Exception {
        System.out.println("Fermeture de la DB !");
    }
}
