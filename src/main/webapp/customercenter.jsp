<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
.jumbotron {
	width: 100%;
	height: auto;
	background-image: url(./resources/images/banner-895571.jpg);
	background-repeat: no-repeat;
	background-position: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./resources/css/mainPage.css">
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container" align="center">
			<h1 class="display-3 font-weight-bold text-white">고객센터</h1>
		</div>
	</div>
	<ul class="nav nav-tabs nav-justified" role="tablist">
		<li class="nav-item"><a class="nav-link active" data-toggle="tab"
			href="#집밥">집밥</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="tab"
			href="#밀키트">밀키트</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="집밥" class="container tab-pane active">
			<br>
			<div id="accordion">
				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapseOne">
							결제는 어떻게 하나요?? </a>
					</div>
					<div id="collapseOne" class="collapse show"
						data-parent="#accordion">
						<div class="card-body">
							농협 770-02-276805(김상훈)으로 입금하시면 됩니다 :)
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse"
							href="#collapseTwo"> 희망배송일이라고 되있는데 정말 그 날에 배송이 되나요?? </a>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion">
						<div class="card-body">
							최대한 고객님의 희망배송일에 맞춰서 보내드리려 노력하고 있습니다.
							하지만 날씨 또는 자연재해로 인한 지연배송은 양해 부탁드립니다 :)
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse"
							href="#collapseThree"> 제품 등록을 하고싶은데 어떻게하면 되나요?? </a>
					</div>
					<div id="collapseThree" class="collapse" data-parent="#accordion">
						<div class="card-body">
							관리자에게 신청을 하신 뒤 검토 후 게시됩니다.
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="밀키트" class="container tab-pane">
			<br>
			<h2>서비스 준비중입니다.<br>
			해당 서비스가 시작되면 많은 관심 부탁드립니다.</h2>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>