<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<style>
	.nav-item{
	list-style-type : none;
	display: inline-block;
	margin-right: 65px;
	}
	.dropdown{
		margin-right: 95px;
	}
	.dropdown:hover .dropdown-menu{	display: block;}
</style>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp"><img src="./resources/images/logo.jpg" alt="Logo" style="width: 50%;"></a>
			</div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item col-md-2"><a class="nav-link" href="products.jsp" style="color:black">집밥</a></li>
				<li class="nav-item col-md-2"><a class="nav-link" href="mealkit.jsp" style="color:black">밀키트</a></li>
				<li class="nav-item col-md-2"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>" style="color:black">무료나눔</a></li>
				<li class="nav-item col-md-2"><a class="nav-link" href="customercenter.jsp" style="color:black">고객센터</a></li>
			</ul>
			<div class="dropdown">
				<button type="button" class="btn btn-outline"
					data-toggle="dropdown">Member</button>
				<div class="dropdown-menu">
					<c:choose>
						<c:when test="${empty sessionId }">
							<a class="dropdown-item" href="./member/loginMember.jsp">Login</a> 
							<a class="dropdown-item" href="./member/addMember.jsp">회원가입</a>
						</c:when> 
						<c:otherwise>
							<span style="padding-top: 7px; color: white">[<%=sessionId %>님]</span>
							<a class="dropdown-item" href="./member/logoutMember.jsp">Logout</a>
							<a class="dropdown-item" href="./member/updateMember.jsp">회원정보수정</a>
							<a class="dropdown-item" href="./cart.jsp">장바구니</a>
							<a class="dropdown-item" href="./order.jsp">주문내역</a>							
						</c:otherwise>
					</c:choose>	
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="addProduct.jsp">관리자</a>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>