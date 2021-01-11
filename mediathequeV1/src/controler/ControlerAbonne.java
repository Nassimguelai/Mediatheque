package controler;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DaoV1;
import metier.Abonne;

/**
 * Servlet de contrôle de l'affichage et de l'accessibilité d'un abonné
 * 
 */
@WebServlet(
		name = "ControlEmprunt", 
		description = "Controle des abonnés", 
		urlPatterns = {"/gestion/abonne/*"}
		)
public class ControlerAbonne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RequestDispatcher 	disp;

	//Traitement en GET des données d'affichage de connexion, deconnexion, d'accessibilité à son compte etc..
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();

		if(path.equals("/connexion")) doAfficheConnexion(request, response);
		else if(path.equals("/deconnexion")) doAfficheDeconnexion(request, response);
		else if(path.equals("/monCompte")) doAfficheMonCompte(request, response);
		else if(path.equals("/root/listeAbonne")) doAfficheListeAbonne(request, response);
		else if(path.equals("/root/listAbonne/supprimer")) doSupprimerAbonne(request, response);
	}

	//Traitement en POST des données de connexion, modifications, suppression
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();

		if(path.equals("/connexion/login")) doControlConnexion(request, response);
		if(path.equals("/monCompte/modifier")) doModiferCompte(request, response);
		if(path.equals("/root/listAbonne/supprimer")) doSupprimerAbonne(request, response);
	}


	//METHODE
	private void doSupprimerAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String idAbonne = request.getParameter("idAbonne");
		Abonne aboVerif = null;
		for(Abonne abo : DaoV1.abonnes) {
			if(abo.getIdAbonne().equals(idAbonne)){
				aboVerif = abo;
			}
		}

		DaoV1.abonnes.remove(aboVerif);
		request.setAttribute("message", "L'abonné " + aboVerif.getIdAbonne() + " a été supprimé");
		RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/listeAbonne.jsp");
		disp.forward(request, response);
	}


	private void doAfficheListeAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(true);
		Abonne abonneSession = (Abonne) session.getAttribute("abonne");

		if(!abonneSession.getIdAbonne().equals("Root")) {
			request.setAttribute("message", "Vous n'avez pas accès !!");
			String chemin = this.getServletContext().getInitParameter("pageError");
			RequestDispatcher disp = request.getRequestDispatcher(chemin);
			disp.forward(request, response);
		}
		disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/listeAbonne.jsp"); 
		disp.forward(request,response);
	}

	private void doModiferCompte(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		disp = request.getRequestDispatcher("/modificationAbonne"); 
		disp.forward(request,response);
	}


	private void doAfficheDeconnexion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.getSession().invalidate();
		request.getRequestDispatcher("/index.jsp").forward(request,response); 
	}

	private void doAfficheConnexion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/connexion.jsp"); 
		disp.forward(request,response);
	}

	private void doControlConnexion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String nom = request.getParameter("nom");
		String mdp = request.getParameter("mdp");

		Abonne abonne = DaoV1.getAbonne(nom, mdp);

		if(abonne != null ) {
			HttpSession session = request.getSession(true);
			Abonne abonneSession = new Abonne (abonne.getIdAbonne(), abonne.getPrenom(), abonne.getNom() );

			session.setAttribute("abonne", abonneSession);

			RequestDispatcher disp = request.getRequestDispatcher("/index.jsp");
			disp.forward(request, response);
		}else {
			request.setAttribute("message", "Erreur d'authentification");
			String chemin = this.getServletContext().getInitParameter("pageError");
			RequestDispatcher disp = request.getRequestDispatcher(chemin);
			disp.forward(request, response);
		}
	}

	private void doAfficheMonCompte(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(true);
		Abonne aboEnSession = (Abonne) session.getAttribute("abonne");
		String chemin = null;

		if(aboEnSession == null) {
			request.setAttribute("message", "Connectez-vous");
			ServletContext context = this.getServletContext();
			chemin= context.getInitParameter("pageError");
		}else {
			Abonne abobo = DaoV1.getAbonneId(aboEnSession.getIdAbonne());
			request.setAttribute("abonne", abobo);
		}

		disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/compte.jsp"); 
		disp.forward(request,response);
	}
}
