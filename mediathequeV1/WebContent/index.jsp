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

<title>Accueil</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<body>
	
	<!-- Barre de navigation -->

	<%@ include file="/WEB-INF/vue/include/navBarre.jsp"%>

	<!-- Page Header -->

	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/img/home-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1>Médiathèque</h1>
						
						<%
							if (abonne == null || abonne.getNom().equals("Root")) {
						%>
						<span class="subheading">Bonjour !</span>
						<%
							} else {
						%>
						<span class="subheading">Bonjour <%=abonne.getNom() + " " + abonne.getPrenom()%>
						</span>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>
	

	<!-- Footer -->

	<%@ include file="/WEB-INF/vue/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>/css/clean-blog.min.js"></script>
	
</body>

</html>
