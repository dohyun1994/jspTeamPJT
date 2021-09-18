<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Food" %>
<%@ page import="dao.FoodRepository" %>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	FoodRepository dao = FoodRepository.getInstance();
	
	Food food = dao.getProductById(id);
	if (food == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
	Food goodsQnt = new Food();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
