<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/mainPage.css">
<title>밀키트</title>
<style>
.jumbotron {
	width: 100%;
	height: auto;
	background-image: url(./resources/images/banner-895571.jpg);
	background-repeat: no-repeat;
	background-position: center;
}

.img {
	max-height: 800px;
	overflow: hidden;
	max-height: initial;
	margin-top: -15%;
}
</style>

</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" class="image">
		<div class="container" align="center">
			<h1 class="display-3 font-weight-bold text-white">밀키트</h1>
		</div>
	</div>

	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="./resources/images/mealkit02.jpg"
					alt="1">
				<div class="carousel-caption">
					<h1>밀키트 상품 준비중</h1>
				</div>
			</div>
		</div>
	</div>
		<hr>
		<jsp:include page="footer.jsp" />
</body>
</html>