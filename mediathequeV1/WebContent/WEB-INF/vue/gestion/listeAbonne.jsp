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

<title>Liste des abonnés</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<!-- Liste des abonnés avec suppression de l'abonné  -->
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
		String message = (String) request.getAttribute("message");
	%>
	<div class="container">
		<%
			if (message != null) {
		%>
		<p class="text-danger"><%=message%></p>
		<%
			}
		%>
		
		<h1>Liste des abonnés</h1>
		<table class="table">
			<thead>
				<tr>

					<th>Id abonné</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>email</th>
					<th> </th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Abonne abo : DaoV1.abonnes) {
				%>
				<%  if(!abo.getIdAbonne().equals("Root")) {%>
				<tr>

					<td><%=abo.getIdAbonne()%></td>
					<td><%=abo.getNom()%>
					<td><%=abo.getPrenom()%></td>
					<td><%=abo.getEmail()%></td>
					<td><form name="form" method="get" action="<%=request.getContextPath()%>/gestion/abonne/root/listAbonne/supprimer">
					<button name="idAbonne" value="<%=abo.getIdAbonne()%>"  type="submit" class="btn btn-primary">Supprimer</button>
					</form>
					</td>
				</tr>
				<%} %>
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
	<script
		src="<%=request.getContextPath()%>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>js/clean-blog.min.js"></script>
</body>

</html>

