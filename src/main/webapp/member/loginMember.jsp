<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/loginForm.css">
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="container1" align="center">
		<%
			String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해 주세요");
				out.println("</div>");
			}
		%>
		
		<form action="processLoginMember.jsp" method="post" class="loginForm">
	      <h2>Login</h2>
	      <div class="idForm">
	        <input type="text" class="id" placeholder="ID" name="id">
	      </div>
	      <div class="passForm">
	        <input type="password" class="pw" placeholder="Password" name="password">
	      </div>
	      <button type="submit" class="btn" onclick="button()" id="signIn">
	        SIGN IN
	      </button>
	      <div class="bottomText">
	        Don't you have ID? <a href="addMember.jsp">sign up</a>
	      </div>
	    </form>
	</div>
	
</body>
</html>