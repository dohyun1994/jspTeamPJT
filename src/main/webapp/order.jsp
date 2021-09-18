<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ page import="mvc.model.BoardDAO"%>
<%@ page import="dto.Food" %>
<%@ page import="dao.FoodRepository" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String shopping_cartId = "";	
	String shopping_name = "";	 
	String shopping_shoppingDate = "";	
	String shopping_addressName = "";
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shopping_cartId"))
				shopping_cartId = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			if (n.equals("Shopping_shoppingDate"))
				shopping_shoppingDate = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			if (n.equals("Shopping_name")) 
				shopping_name = URLDecoder.decode((thisCookie.getValue()),"UTF-8");
			if (n.equals("Shopping_addressName")) 
				shopping_addressName = URLDecoder.decode((thisCookie.getValue()),"UTF-8");
		}
	}
%>
<html>
<head>
<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>주문조회</title>
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
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron" class="image">
		<div class="container" align="center">
			<h1 class="display-3 font-weight-bold text-white">주문조회</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>아이디</th>
						<th>주문번호</th>
						<th>상품</th>
						<th>수령인</th>
						<th>주소</th>
						<th>희망배송날짜</th>
						<th>상품코드</th>
					</tr>
					
					<%	
					ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Food>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Food food = cartList.get(i);
					%>
					<tr>
						<td><%=sessionId%></td>
						<td><%	out.println(shopping_cartId);	%></td>						
						<td><a href="./product.jsp?id=<%=food.getProductId()%>"><%=food.getPname()%></a></td>
						<td><% out.println(shopping_name);%></td>
						<td><%out.println(shopping_addressName);%></td>
						<td><%out.println(shopping_shoppingDate);%></td>
						<td><span class="badge badge-sm" style="background-color: red;"><%=food.getProductId()%></span></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>





