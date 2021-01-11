<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@ page import="metier.Abonne"%>


<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="<%= request.getContextPath() %>/accueil">LOGO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/accueil">Accueil
					</a></li>
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/gestion/emprunt/formulaire">Emprunter</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/gestion/emprunt/liste">Liste des emprunts</a></li>
					
					<%
					   Abonne abonne = (Abonne) session.getAttribute("abonne");
					%>
					<% if(abonne != null ){ %>
					<li class="nav-item" ><a class="nav-link" href="<%= request.getContextPath() %>/gestion/abonne/monCompte">Mon compte</a>
					</li>
					
					<li class="nav-item" ><a class="text-warning" href="<%= request.getContextPath() %>/gestion/abonne/root/listeAbonne">Gestion des abonnés</a>
					</li>
					<li class="nav-item" ><a class="text-warning" href="<%= request.getContextPath() %>/gestion/abonne/deconnexion">Deconnexion</a>
					</li>
					<%} %>
					<%if(abonne == null) { %>
					<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/gestion/abonne/connexion">Connexion</a>
					</li>
					<%} %>
				
				</ul>
			</div>
		</div>
	</nav>
