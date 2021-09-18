<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>상품 목록</title>
<!-- 파일 변경 내용 테스트중입니다. -->
<style>
#box1 {
	width: 100%;
	height: auto;
	background-image: url(./resources/images/banner-895571.jpg);
	background-repeat: no-repeat;
	background-position: center;
}

.con1 {
	margin-top: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" id="box1">
		<div class="container con1 display-3 font-weight-bold text-white">
			<h1 class="text-center">
				<b>정성스러운 식사</b>
			</h1>
			<p class="text-center">맛과 정성이 가득한 음식을 준비했습니다.</p>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">

			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from food";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String link, p_id;

			while (rs.next()) {
			%>
			<div class="col-md-3">
				<div>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"><img
						src="./resources/images/Food/<%=rs.getString("p_filename")%>"
						style="width: 250px; height: 220px;"></a>
					<h3><%=rs.getString("p_name")%></h3>
					<%=rs.getString("p_unitPrice")%>원
					<p>
						<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
							class="btn btn-info" role="button"> 상품 정보</a>
				</div>
			</div>
			<%
			}
			%>
			<%
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>