package fr.diginamic.jdbc.dal;
import fr.diginamic.jdbc.entites.Fournisseur;
import java.util.List;

public interface IFournisseurDAO {
    List<Fournisseur> extraire() throws Exception;
    void insert(Fournisseur fournisseur);

    //int update(String nouveauNom, String ancienNom );
    int update(String nouveauNom, int idFournisseur);
    boolean delete(Fournisseur fournisseur);
}
