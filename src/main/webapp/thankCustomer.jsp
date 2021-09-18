<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>주문 완료</title>
</head>
<body>
	<%
		String shopping_cartId = "";
		
		String shopping_name = "";
		 
		String shopping_shoppingDate = "";
		
		String shopping_country = "";
		
		String shopping_zipCode = "";
		
		String shopping_addressName = "";	

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shopping_cartId"))
					shopping_cartId = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
				if (n.equals("Shopping_shippingDate"))
					shopping_shoppingDate = URLDecoder.decode((thisCookie.getValue()), "UTF-8");
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은	<%	out.println(shopping_shoppingDate);	%>에 배송될 예정입니다! !	
		<p>주문번호 :	<%	out.println(shopping_cartId);	%>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
</body>
</html>
<%
	session.invalidate();

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Customer_Id"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_phoneNumber"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Customer_addressName"))
			thisCookie.setMaxAge(0);

		if (n.equals("Shopping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shopping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shopping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shopping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shopping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shopping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>
