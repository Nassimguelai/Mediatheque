package filtre;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DaoV1;
import metier.Abonne;

/**
 * Servlet qui implémente la class Filter
 */
@WebFilter(urlPatterns={"/*"})
public class filtre implements Filter {
	

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest requestHttp = (HttpServletRequest) request; 
		String chemin = requestHttp.getServletPath();
		
		if( chemin.equals("/accueil") || chemin.equals("/index.jsp") || chemin.equals("/"))  {
			RequestDispatcher disp = requestHttp.getRequestDispatcher("/index.jsp");
			disp.forward(request, response);
		}
		
		else if (chemin.startsWith("/gestion/emprunt"))	chain.doFilter(request, response);
		
		else if (chemin.startsWith("/gestion/abonne"))	chain.doFilter(request, response);
		
		else if (chemin.startsWith("/css"))	chain.doFilter(request, response);
		
		else if (chemin.startsWith("/vendor"))	chain.doFilter(request, response);
		
		else if (chemin.startsWith("/img"))	chain.doFilter(request, response);
	}
}




