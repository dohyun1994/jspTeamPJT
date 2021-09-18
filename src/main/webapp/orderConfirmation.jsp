<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "dto.Food" %>
<%@ page import = "dao.FoodRepository" %>

<%
	request.setCharacterEncoding("UTF-8");	
	String cartId = session.getId();	
	String shopping_cartId = "";	
	String shopping_name = "";	
	String shopping_shoppingDate = "";	
	String shopping_country = "";	
	String shopping_zipCode = "";	
	String shopping_addressName = "";	
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if (n.equals("Shopping_cartId")) 
				shopping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if (n.equals("Shopping_name")) 
				shopping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if (n.equals("Shopping_shoppingDate")) 
				shopping_shoppingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if (n.equals("Shopping_country")) 
				shopping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if (n.equals("Shopping_zipCode")) 
				shopping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
			if (n.equals("Shopping_addressName")) 
				shopping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>주문 정보</title>
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
<script type = "text/javascript">
	function addOrder() {
		if(confirm("상품을 주문하시겠습니까?")) {
			document.addorder.submit();
			alert("주문이 완료되었습니다.");
		} else {
			document.addorder.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page = "menu.jsp" />
	<div class="jumbotron" class="image">
		<div class="container" align="center">
			<h1 class="display-3 font-weight-bold text-white">주문 정보</h1>
		</div>
	</div>
	
	<div class = "container col-8 alert alert-info">
		<div class = "text-center">
			<h1>영수증</h1>
		</div>
		
		<div class = "row justify-content-between">
			<div class = "col-4" align = "left">
				<strong>배송 주소</strong> 
				<br> 성명 : <% out.println(shopping_name);%> <br>
				우편번호 : <% out.println(shopping_zipCode);%> <br>
				주소 : <% out.println(shopping_addressName);%> (<% out.println(shopping_country);%>) <br>
			</div>
			
			<div class = "col-4" align = "right">
				<p> <em>배송일: <% out.println(shopping_shoppingDate);%></em>
			</div>
		</div>
			<div>
				<table class = "table table-hover">
				<tr>
					<th class = "text-center">제품 </th>
					<th class = "text-center"># </th>
					<th class = "text-center">가격 </th>
					<th class = "text-center">소계 </th>
				</tr>
				
				<%
					int sum = 0;
					ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
					
					if(cartList == null)
						cartList = new ArrayList<Food>();
					
					for (int i=0; i<cartList.size(); i++) {				// 상품 리스트 하나씩 출력하기
						
						Food food = cartList.get(i);
						int total = food.getUnitPrice() * food.getQuantity();
						sum = sum + total;
				%>
				
				<tr>
					<td class = "text-center"><em><%= food.getPname() %></em></td>
					<td class = "text-center"><%= food.getQuantity() %></td>
					<td class = "text-center"><%= food.getUnitPrice() %></td>
					<td class = "text-center"><%= total %>원</td>
				</tr>
				
				<%
					}
				%>
				
				<tr>
					<td></td>
					<td></td>
					<td class = "text-right"><strong>총액:</strong></td>
					<td class = "text-center text-danger"><strong><%=sum%></strong></td>
				</tr>
				</table>
				<%
					String id = request.getParameter("id");
					FoodRepository dao = FoodRepository.getInstance();
					Food food = dao.getProductById(id);
				%>				
				<form name="addorder" action="./order.jsp" method="post">
				<a href = "./shoppingInfo.jsp?cartId=<%=shopping_cartId %>"
				class = "btn btn-secondary" role = "button">이전</a>
				<a href = "#" class = "btn btn-success" onclick="addOrder()">주문 완료</a>
				<a href = "./checkOutCancelled.jsp" class = "btn btn-secondary"
				role = "button">취소</a>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
</body>
</html>	
