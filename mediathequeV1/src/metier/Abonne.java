package metier;

public class Abonne {
	
	private String idAbonne;
	private String nom ;
	private String prenom;
	private String mdp ;
	private String email ;
	
	public Abonne(String idAbonne) {
		this.idAbonne = idAbonne;
	}
	
	public Abonne(String idabonne, String nom, String prenom) {
		this.idAbonne= idabonne;
		this.nom = nom;
		this.prenom = prenom;
		
	}
	
	public Abonne(String idabonne, String nom, String prenom,  String mdp, String email) {
		this.idAbonne= idabonne;
		this.nom = nom;
		this.prenom = prenom;
		this.mdp = mdp;
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Abonne [idAbonne=" + idAbonne + "]";
	}

	public String getIdAbonne() {
		return idAbonne;
	}
	
	public void setIdAbonne(String idAbonne) {
		this.idAbonne = idAbonne;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
