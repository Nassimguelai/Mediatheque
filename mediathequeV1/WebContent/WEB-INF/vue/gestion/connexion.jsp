<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Connexion</title>

<!-- Lien CSS -->
<%@ include file="/WEB-INF/vue/include/lienCSS.jsp"%>

</head>

<!-- Formulaire de connexion -->
<body>

	<!-- Barre de navigation -->
	<%@ include file="/WEB-INF/vue/include/navBarre.jsp"%>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/img/contact-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="page-heading">
						<h1>Connectez-vous</h1>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">

				<form name="login" method="post"
					action="<%=request.getContextPath()%>/gestion/abonne/connexion/login">
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Nom</label> <input type="text" name="nom"
								class="form-control" placeholder="Nom" id="name">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Mot de passe</label> <input type="password"
								class="form-control" name="mdp" placeholder="Mot de passe"
								id="email">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group"></div>
					<br>
					<div id="success"></div>
					<button type="submit" name="login" class="btn btn-primary"
						id="sendMessageButton">Continuer</button>
				</form>
			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->
	<%@ include file="/WEB-INF/vue/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="<%=request.getContextPath()%>js/jqBootstrapValidation.js"></script>
	<script src="<%=request.getContextPath()%>js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>js/clean-blog.min.js"></script>

</body>

</html>
