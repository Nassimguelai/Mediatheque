<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="metier.Abonne"%>
<%@ page import="metier.Livre"%>
<%@ page import="Dao.DaoV1"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Emprunter</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<!-- Formulaire d'emprunt -->
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
					<div class="page-heading">
						<h1>Emprunter</h1>

					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">

		<a href="<%= request.getContextPath() %>/accueil"> Retour à la page d'accueil</a> <br> <br>
		<form name="form" method="post"
			action="<%=request.getContextPath()%>/gestion/emprunt/formulaire/creer">

			<div class="form-group col-md-6">
				<label for="idemprunt">ID Emprunt</label> <input type="number"
					class="form-control" name="idemprunt" id="idemprunt" value="165"
					placeholder="15667" required>
			</div>
			<div class="form-group col-md-6">
				<label for="abonne">ID Abonne</label> <select class="form-control"
					id="abonne" name="abonne">
					<% for(Abonne abo : DaoV1.abonnes) { %>
					<option><%=abo.getNom()%>
						<%=abo.getPrenom()%></option>
					<% } %>
				</select> 
			</div>
			<div class="form-group col-md-6">
				<label for="livre1">Livre 1</label> <select class="form-control"
					id="abonne" name="titre1">
					<% for(Livre liv : DaoV1.livres) { %>
					<option>
						<%=liv.getTitre()%></option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="livre1">Livre 1</label> <select class="form-control"
					id="abonne" name="titre2">
					<% for(Livre liv : DaoV1.livres) { %>
					<option>
						<%=liv.getTitre()%></option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="livre1">Livre 1</label> <select class="form-control"
					id="abonne" name="titre3">
					<% for(Livre liv : DaoV1.livres) { %>
					<option>
						<%=liv.getTitre()%></option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="livre1">Livre 1</label> <select class="form-control"
					id="abonne" name="titre4">
					<% for(Livre liv : DaoV1.livres) { %>
					<option>
						<%=liv.getTitre()%></option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-6">
				<label for="livre1">Livre 1</label> <select class="form-control"
					id="abonne" name="titre5">
					<% for(Livre liv : DaoV1.livres) { %>
					<option>
						<%=liv.getTitre()%></option>
					<% } %>
				</select>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="date">Date d'emprunt</label> <input type="date"
						class="form-control" name="date" id="date">
				</div>

			</div>

			<button type="submit" class="btn btn-primary">Créer</button>
		</form>
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
