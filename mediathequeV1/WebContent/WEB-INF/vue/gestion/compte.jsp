<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@ page import="metier.Abonne"%>


<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Mon compte</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<!-- Affichage des données disponible dans la DAO concernant le compte de l'abonné connecter -->
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
						<h1>Mon compte</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<%
		String message = (String) request.getAttribute("message");
	%>
	
	<div class="col-lg-6 col-md-10 mx-auto">
		<%
			if (message != null) {
		%>
		<p class="text-danger"><%=message%></p>
		<%
			}
		%>
		
		 <%Abonne abonne1 = (Abonne) request.getAttribute("abonne"); %> 
		 
		<form name="sentMessage" method="post"
			action="<%=request.getContextPath()%>/gestion/abonne/monCompte/modifier">
			<div class="form-group">
				<label for="exampleInputEmail1">Id abonné</label> <input type="text"
					name="idAbonne" class="form-control" value="<%=abonne1.getIdAbonne()%>"
					 readonly placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Nom</label> <input type="text"
					name="nom" class="form-control" value="<%=abonne1.getNom()%>"
					readonly placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Prenom</label> <input type="text"
					name="prenom" class="form-control" value="<%=abonne1.getPrenom()%>"
					readonly placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email</label> <input type="email"
					class="form-control" value="<%=abonne1.getEmail()%>"
					aria-describedby="emailHelp" name="email" placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Mot de passe</label> <input
					type="password" class="form-control" id="password-field" name="mdp"
					value="<%=abonne1.getMdp()%>" placeholder="Password"><span
					toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>

				<button type="submit" class="btn btn-primary">Modifier</button>
			</div>
		</form>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/vue/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/clean-blog.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/nassim.js"></script>
</body>

</html>
