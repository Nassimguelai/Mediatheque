package Dao;

import java.util.ArrayList;

import metier.Abonne;
import metier.Emprunt;
import metier.Livre;

/**
 * Servlet jouant le rôle d'une base de donnée
 */
public class DaoV1 {

	public static ArrayList<Emprunt> emprunts = new ArrayList<Emprunt>(); 
	public static ArrayList<Abonne> abonnes = initAbonnes();
	public static ArrayList<Livre> livres = initLivres();

	private static ArrayList<Abonne> initAbonnes(){
		ArrayList<Abonne> liste = new ArrayList<Abonne>();
		liste.add(new Abonne("A1", "Dupon", "Alain","1111", "Alain@gmail.com"));
		liste.add(new Abonne("A3", "Newgate", "Edward","7777", "Edward@gmail.com"));
		liste.add(new Abonne("A4", "Marshall", "Teach","1010", "Teach@gmail.com"));
		liste.add(new Abonne("A5", "Dicaprio", "Leonardo","7777", "Leonardo@gmail.com"));
		liste.add(new Abonne("A6", "Mbappe", "Kylian","7777", "Mbappe@gmail.com"));
		liste.add(new Abonne("Root", "Root", "Root","0000", "Root@gmail.com"));
		return liste;
	}
	
	//Méthode qui compare l'id d'un abonné
    public static Abonne getAbonneId(String idAbonne) {
        Abonne trouve = null;
        
        for(Abonne abonne : abonnes) {
            if (abonne.getIdAbonne().equals(idAbonne)) trouve = abonne;
        }
        return trouve;
    }
    
    //Méthode de modification d'un abonné dans son espace "Mon compte"
    public static Abonne setAbonne(Abonne abonne) {
        
        for(Abonne abo : abonnes) {
            if (abo.getIdAbonne().equals(abonne.getIdAbonne())) {
                    abo.setEmail(abonne.getEmail());
                    abo.setMdp(abonne.getMdp());
                    abonne = abo;
            }
        }
        return abonne;
    }
	
	private static ArrayList<Livre> initLivres(){
		ArrayList<Livre> livres = new ArrayList<Livre>();

		Livre livre1 = new Livre("Titre 1", "Livre123");
		Livre livre2 = new Livre("Titre 2", "Livre124");
		Livre livre3 = new Livre("Titre 3", "Livre125");
		Livre livre4 = new Livre("Titre 4", "Livre126");
		Livre livre5 = new Livre("Titre 5", "Livre127");
		Livre livre6 = new Livre("Titre 6", "Livre128");
		Livre livre7 = new Livre("Titre 7", "Livre129");
		Livre livre8 = new Livre("Titre 8", "Livre130");
		Livre livre9 = new Livre("Titre 9", "Livre31");
		Livre livre10 = new Livre("Titre 10", "Livre132");

		livres.add(livre1);
		livres.add(livre2);
		livres.add(livre3);
		livres.add(livre4);
		livres.add(livre5);
		livres.add(livre6);
		livres.add(livre7);
		livres.add(livre8);
		livres.add(livre9);
		livres.add(livre10);
		
		return livres;
	}

	
	public static Abonne getAbonne(String nom, String mdp) {
		Abonne trouve = null;

		if( nom!= null && mdp != null) {
			for (Abonne abo : DaoV1.abonnes) {
				if (abo != null && nom.equals(abo.getNom()) && mdp.equals(abo.getMdp())) 
					trouve = abo;;
			}
		}
		return trouve;
	}

	public static Abonne getNomPrenom(String nomprenom) {
		Abonne trouve = null;

		for (Abonne abo : DaoV1.abonnes) {
			if (abo != null && nomprenom.contains(abo.getNom()) && nomprenom.contains(abo.getPrenom())) {
				trouve = abo;
			}
		}
		return trouve;
	}

}


