package metier;

public class Livre {

	private String cote;
	private String titre;
	
	public Livre(String titre, String cote) {
		this.setCote(cote);
		this.setTitre(titre);
	}
	
	@Override
	public String toString() {
		return "Livre [cote=" + cote + ", titre=" + titre + "]";
	}

	public String getCote() {
		return cote;
	}
	
	public void setCote(String cote) {
		this.cote = cote;
	}
	
	public String getTitre() {
		return titre;
	}
	
	public void setTitre(String titre) {
		this.titre = titre;
	}
}
