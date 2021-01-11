package WEB.APP.GESTION.EMPRUNT;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DaoV1;
import metier.Abonne;
import metier.Emprunt;
import metier.Livre;


@WebServlet("/emprunt/formulaire/creer")
public class CreerEmprunt extends HttpServlet{

	/**
	 * Servlet de traitement de la création d'un emprunt
	 */
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
	ServletException, IOException {

		//Récupération des données
		String titre1 = request.getParameter("titre1");
		String titre2 = request.getParameter("titre2");
		String titre3 = request.getParameter("titre3");
		String titre4 = request.getParameter("titre4");
		String titre5 = request.getParameter("titre5");
		String dateEmprunt = request.getParameter("date");
		
		//Gestion de la date
		LocalDate dateEmp = LocalDate.now();
		if(!dateEmprunt.isBlank()) dateEmp = LocalDate.parse(dateEmprunt, DateTimeFormatter.ofPattern("yyyy-MM-dd"));	

		String nomprenom = request.getParameter("abonne");
	
		//Associations des côtes et des livres
		Livre livre1 = new Livre(titre1, "5151");
		Livre livre2 = new Livre(titre2, "5152");
		Livre livre3 = new Livre(titre3, "5153");
		Livre livre4 = new Livre(titre4, "5154");
		Livre livre5 = new Livre(titre5, "5155");

		ArrayList<Livre> livres = new ArrayList<Livre>();
		livres.add(livre1);
		livres.add(livre2);
		livres.add(livre3);
		livres.add(livre4);
		livres.add(livre5);

		Abonne abonne1 = DaoV1.getNomPrenom(nomprenom);

		// Création de l'emprunt avec l'id et l'abonne
		String idEmprunt = request.getParameter("idemprunt");
		Emprunt emprunt1 = new Emprunt(Integer.parseInt(idEmprunt), abonne1);
		emprunt1.setDateEmprunt(dateEmp);
		
		emprunt1.setLivres(livres);

		// Ajouter l'emprunt à la liste (dans dao.Dao)
		DaoV1.emprunts.add(emprunt1);

		HttpSession session = request.getSession(true);
		session.setAttribute("emprunt", emprunt1);

		// Redirection vers le ficher index.html
		request.getRequestDispatcher("/WEB-INF/vue/gestion/listeEmprunt.jsp").forward(request, response);
	
	} 



}
