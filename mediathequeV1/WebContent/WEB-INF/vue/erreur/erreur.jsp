<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
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

<title>Erreur</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>


</head>

<!-- Page d'erreur avec une variable "message" afin d'informer l'utilisateur -->
<body>

	<!-- Barre de navigation-->
	<%@ include file="/WEB-INF/vue/include/navBarre.jsp"%>

	<!-- Traitement message-->
	<%
		String message = (String) request.getAttribute("message");

	if (message == null) {
		message = "";
	}
	%>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/img/contact-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1><%=message%></h1>

						<%  if(abonne == null){ %>
						<a class="text-warning"
							href="<%=request.getContextPath()%>/gestion/abonne/connexion">Connectez-vous
							! </a>
						<%}%>
						
					</div>
				</div>
			</div>
		</div>
	</header>

	<hr>

	<!-- Footer -->
	<%@ include file="/WEB-INF/vue/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="<%=request.getContextPath()%>/js/jqBootstrapValidation.js"></script>
	<script src="<%=request.getContextPath()%>/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>/js/clean-blog.min.js"></script>

</body>

</html>
