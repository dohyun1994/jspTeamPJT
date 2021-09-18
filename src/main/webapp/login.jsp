<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/mainPage.css">

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="889291260690-ra7tt1pkam6avei7p7e1tu6eldnheoi7.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Login</title>
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
			<h1 class="display-3 font-weight-bold text-white">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input	type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button> 
			</form>
		</div>
	</div>
</body>
</html>