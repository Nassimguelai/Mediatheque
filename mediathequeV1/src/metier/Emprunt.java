package metier;

import java.time.LocalDate;
import java.util.ArrayList;

public class Emprunt {

	private int idEmprunt;
	private LocalDate dateEmprunt;
	private Abonne abonne;
	private ArrayList<Livre> livres;
	
	public Emprunt(int idEmprunt, Abonne abonne) {
		this.idEmprunt = idEmprunt;
		this.abonne = abonne;
		this.setLivres(new ArrayList<Livre>());
		this.dateEmprunt = LocalDate.now();	
	}
	
	public Emprunt (int idEmprunt) {
		this.idEmprunt = idEmprunt;
	}
	
	@Override
	public String toString() {
		return "Emprunt [idEmprunt=" + idEmprunt + ", dateEmprunt=" + dateEmprunt + ", abonne=" + abonne + ", livres="
				+ livres + "]";
	}

	public int getIdEmprunt() {
		return idEmprunt;
	}
	
	public void setIdEmprunt(int idEmprunt) {
		this.idEmprunt = idEmprunt;
	}
	
	public LocalDate getDateEmprunt() {
		return dateEmprunt;
	}
	
	public void setDateEmprunt(LocalDate dateEmprunt) {
		this.dateEmprunt = dateEmprunt;
	}

	public Abonne getAbonne() {
		return abonne;
	}

	public void setAbonne(Abonne abonne) {
		this.abonne = abonne;
	}

	public ArrayList<Livre> getLivres() {
		return livres;
	}

	public void setLivres(ArrayList<Livre> livres) {
		this.livres = livres;
	}
}
