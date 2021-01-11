package WEB.APP.GESTION.ABONNE;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DaoV1;
import metier.Abonne;

/**
 * Servlet de traitement de modification d'un abonné forumlaire"Mon compte"
 */
@WebServlet("/modificationAbonne")
public class ModificationAbonne extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession(true);
		Abonne abonneSession = (Abonne) session.getAttribute("abonne");

		try {
			Objects.requireNonNull(abonneSession);

			String idAbonne = request.getParameter("idAbonne");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String mdp = request.getParameter("mdp");
			String email = request.getParameter("email");

			Abonne newAbo = new Abonne(idAbonne, nom, prenom, mdp, email);

			Abonne abonnetest = DaoV1.setAbonne(newAbo);

			System.out.println(abonnetest.getEmail());
			request.setAttribute("abonne", abonnetest);
			

			request.setAttribute("message", "L'abonne " + abonnetest.getIdAbonne() + " a été modifié");
			
			RequestDispatcher disp = request.getRequestDispatcher("/WEB-INF/vue/gestion/compte.jsp");
			disp.forward(request, response); 

			
		}catch(NullPointerException e) {
			request.setAttribute("message", "Connectez-vous");
		}

	}
}