<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@ page import="Dao.DaoV1"%>
<%@ page import="metier.Livre"%>
<%@ page import="metier.Abonne"%>
<%@ page import="metier.Emprunt"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Liste des Emprunts</title>

	<!-- Lien CSS -->
	<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<!-- Affichage de l'emprunt avec récupération des données du formEmprunt.jsp -->
<body>

	<!-- Barre de navigation -->
	<%@ include file="/WEB-INF/vue/include/navBarre.jsp"%>

	<!-- Page Header -->
	<header
		style="background-image: url('<%=request.getContextPath()%>/img/home-bg.jpg')"
		class="masthead">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="post-heading"></div>
				</div>
			</div>
		</div>
	</header>

	<!-- Post Content -->
	<a href="<%= request.getContextPath() %>/accueil">Retour a la page d'accueil</a>
	<br>
	<br>
	<%
		Emprunt emprunt1 = (Emprunt) session.getAttribute("emprunt");
	%>

	<div class="container">

		<p class="text-danger">
			L'emprunt:
			<%=emprunt1.getIdEmprunt()%>
			a bien été effectué
		</p>


		<h1>Liste des emprunts</h1>
		<table class="table">
			<thead>
				<tr>
					<th>Id emprunt</th>
					<th>Id abonné</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Date</th>
					<th>Titre</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Emprunt emprunt : DaoV1.emprunts) {
				%>
				<tr>

					<td><%=emprunt.getIdEmprunt()%></td>
					<td><%=emprunt.getAbonne().getIdAbonne()%></td>
					<td><%=emprunt.getAbonne().getNom()%>
					<td><%=emprunt.getAbonne().getPrenom()%></td>
					<td><%=emprunt.getDateEmprunt()%></td>
					<%
						for (Livre livre : emprunt.getLivres()) {
					%>
					<td><%=livre.getTitre()%></td>
					<%}%>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<hr>

	<!-- Footer -->
	<%@ include file="/WEB-INF/vue/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>js/clean-blog.min.js"></script>
</body>

</html>
