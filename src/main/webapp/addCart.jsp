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

	ArrayList<Food> goodsList = dao.getAllFoods();
	Food goods = new Food();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Food> list = (ArrayList<Food>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Food>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Food goodsQnt = new Food();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("product.jsp?id=" + id);
%>