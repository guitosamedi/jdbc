package fr.diginamic.jdbc.resource;

public class MyResource implements AutoCloseable {
        public void doSomeThing() {
        System.out.println("Je fais un traitement très compliqué !!!");
        int diviseur = (int) (Math.random() * 2);
        System.out.println("le resultat de la division entre 2 et "+ diviseur+" est égal à :"+ 2/diviseur);
    }
    @Override
    public void close() throws Exception {
        System.out.println("Fermeture de ma ressource !");
    }
}
