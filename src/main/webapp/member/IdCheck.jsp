<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	System.out.println("IdCheck.jsp의 id =>" + id);
	
	MemberDAO dao = new MemberDAO();
	boolean check = dao.checkId(id);
%>
</head>
<body>
	<b><%=id %></b>
	<%
		if(check) {
			out.println("는 이미 존재하는 아이디입니다.");
		} else {
			out.println("는 사용가능한 아이디입니다.");
		}
	%>
	<!-- alert으로 바꿔보기.... -->
	<br>
	<a href="#" onclick="self.close()">닫기</a>
</body>
</html>