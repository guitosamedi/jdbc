package fr.diginamic.jdbc.*;
import fr.diginamic.jdbc.dal.IFournisseurDAO;
import fr.diginamic.jdbc.dal.jdbc.FournisseurDAO;
import fr.diginamic.jdbc.entites.Fournisseur;
import java.util.List;

public class App {
    public static void main(String[] args) {
        listerFournisseurs();
    }

    private static void listerFournisseurs(){
        try {
            IFournisseurDAO dao = new FournisseurDAO();
            List<Fournisseur> fournisseurs = dao.extraire();
            for (Fournisseur f : fournisseurs) {
                System.out.println(f);
            }
        } catch (Exception e){
            System.err.println(e.getMessage());
        }
    }

    private static void modifierFournisseur(String newName, int id){
        IFournisseurDAO dao = new FournisseurDAO();
        dao.update(newName, id);
    }
}
