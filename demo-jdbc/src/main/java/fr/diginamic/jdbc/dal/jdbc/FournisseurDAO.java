package fr.diginamic.jdbc.dal.jdbc;
import fr.diginamic.jdbc.dal.IFournisseurDAO;
import fr.diginamic.jdbc.entites.Fournisseur;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class FournisseurDAO implements IFournisseurDAO {

    // à voir déclarer des constantes pour les requêtes
    private static final String SELECT_RQ ="SELECT * FROM FOURNISSEUR";
    private static final String UPDATE_RQ ="UPDATE FOURNISSEUR SET NOM= %s WHERE ID =%s";
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
    public List<Fournisseur> extraire() throws SQLException {
        List<Fournisseur> fournisseur = new ArrayList<>();
        try(
        //Connection connection = PersistenceManager.getConnection();
        Connection connection = DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD);
        Statement st = connection.createStatement()){
        ResultSet resultat = st.executeQuery(String.format(SELECT_RQ));
            while (resultat.next()) {
                Integer id= resultat.getInt("ID");
                String nom= resultat.getString("NOM");
                //Fournisseur fournisseur = new Fournisseur(id, nom);
                //resultat.add(fournisseur);
                //
                resultat.add(new Fournisseur(resultat.getInt(1), resultat.getString("test")));
            }

        } catch (SQLException e ){
            System.err.println(e.getMessage());
        }
        return null;
    }

    @Override
    //public int update(String nouveauNom, String ancienNom ) {
    public int update(String nouveauNom, int idFournisseur) {
        int nb =0;
        try(
            Connection connection = DriverManager.getConnection(DB_URL, DB_LOGIN, DB_PWD);
            Statement st = connection.createStatement()){
            ResultSet resultat = st.executeQuery(String.format(SELECT_RQ));
            while (resultat.next()) {
                Integer id= resultat.getInt("ID");
                String nom= resultat.getString("NOM");
                resultat.add(new Fournisseur(resultat.getInt(1), resultat.getString("test")));
            }

        } catch (SQLException e ){
            System.err.println(e.getMessage());
        }
        return 0;

    }

    public void insert(Fournisseur fournisseur) {

    }

    public boolean delete(Fournisseur fournisseur){

    }
}
