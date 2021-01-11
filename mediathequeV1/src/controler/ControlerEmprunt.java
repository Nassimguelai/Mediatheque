package controler;

import java.io.IOException;


import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.Abonne;
import metier.Emprunt;

/**
 * Servlet de contrôle de l'affichage et la création d'un emprunt
 */
@WebServlet(
		name = "Control Emprunt", 
		description = "Controleur emprunts", 
		urlPatterns = {"/gestion/emprunt/*"}
		)
public class ControlerEmprunt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RequestDispatcher 	disp;

	// Traitement en GET de l'affichage du formulaire et de la liste des emprunts
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		
		if(path.equals("/formulaire")) 			doAbonneAfficheFormulaire(request, response);
		else if(path.equals("/liste"))           			doAbonneListe(request, response); 
	}

	// Traitement en post de la création d'un emprunt
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		if(path.equals("/formulaire/creer"))  	doEmpruntCreer(request, response);	
	}



	//METHODE
	private void doAbonneListe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession(true);
		
		Abonne abonne = (Abonne) session.getAttribute("abonne");
		Emprunt emprunt1 = (Emprunt) session.getAttribute("emprunt");
		
		if(abonne == null) {
			request.setAttribute("message", "Connectez-vous pour avoir accès à la liste");
			String chemin = this.getServletContext().getInitParameter("pageError");
			RequestDispatcher disp = request.getRequestDispatcher(chemin);
			disp.forward(request, response);
		}
		
		else if (abonne != null & emprunt1 == null) {
			request.setAttribute("message", "Liste vide !");
			String chemin = this.getServletContext().getInitParameter("pageError");
			RequestDispatcher disp = request.getRequestDispatcher(chemin);
			disp.forward(request, response);
		}
		
		disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/listeEmprunt.jsp"); 
		disp.forward(request,response);

	}

	private void doEmpruntCreer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		disp = request.getRequestDispatcher("/emprunt/formulaire/creer"); 
		disp.forward(request,response);
	}

	private void doAbonneAfficheFormulaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		HttpServletRequest requestHttp = (HttpServletRequest) request;
		HttpSession session = requestHttp.getSession(true);
		Abonne abonne = (Abonne) session.getAttribute("abonne");

		if(abonne==null) {
			request.setAttribute("message", "Connectez-vous pour avoir accès à l'emprunt");
			String chemin = this.getServletContext().getInitParameter("pageError");
			RequestDispatcher disp = request.getRequestDispatcher(chemin);
			disp.forward(request, response);
		}
		disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/formEmprunt.jsp"); 
		disp.forward(request,response);

	}


}
