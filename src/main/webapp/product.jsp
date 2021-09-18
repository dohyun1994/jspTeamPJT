<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Food" %>
<%@ page import = "dao.FoodRepository" %>
<%@ page errorPage = "exceptionNoProductId.jsp" %>
<jsp:useBean id = "FoodDAO" class = "dao.FoodRepository" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type = "text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
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
	<jsp:include page = "menu.jsp" />
	<div class="jumbotron" class="image">
		<div class="container" align="center">
			<h1 class="display-3 font-weight-bold text-white">상품 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		FoodRepository dao = FoodRepository.getInstance();
		Food food = dao.getProductById(id);
	%>
	
	<div class = "container">
		<div class = "row">
			<div class = "col-md-4">
				<img src = "./resources/images/Food/<%=food.getFilename() %>"
				style = "width: 100%; height: 230px">
			</div>
			<div class = "col-md-4">
				<h3><%= food.getPname() %></h3>
				<p><%= food.getDescription() %>
				<p> <b>상품 아이디 : </b> <span class = "badge badge-danger" style="background-color: red;">
					<%= food.getProductId()%></span>
				<p> <b>분류</b> : <%= food.getCategory() %>
				<p> <b>재고 수</b> : <%= food.getUnitsInStock() %>
				<h4> <%= food.getUnitPrice() %>원</h4>
				<p> <form name = "addForm" action = "./addCart.jsp?id=<%= food.getProductId() %>" method = "post">
					<a href = "#" class = "btn btn-info" onclick = "addToCart()">상품 주문 &raquo;</a>
					<a href = "./cart.jsp" class = "btn btn-warning"> 장바구니 &raquo;</a>
					<a href = "./products.jsp" class = "btn btn-secondary">상품 목록
					&raquo;</a>
				</form>
			</div>	
		</div>
		<hr>
	</div>
	<jsp:include page = "footer.jsp" />
</body>
</html>