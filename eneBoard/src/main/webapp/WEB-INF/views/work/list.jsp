<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title></title>
</head>
<body>
	<header>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="/">ENEBOARD</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/">Home <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="../guestBook/list">방명록</a>
					<li class="nav-item"><a class="nav-link disabled"
						href="../translation/search">사전</a>
					<li class="nav-item active"><a class="nav-link disabled"
						href="../work/list">일자리정보</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Begin page content -->
	<main role="main" class="container" style="padding-top: 20%;">
	<div class="container">
		<form role="form" action="/work/list" method="post" id="form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="row mb-4">
				<div class="col">
					<p>KEYWORD</p>
					<input class="form-control" name="keywords" />
				</div>
				<div class="col">
					<p>검색 결과 수</p>
					<select class="form-control" name="count">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>
				</div>
				<div class="col">
					<p>근무지/지역</p>
					<select class="form-control" name="loc_mcd">
						<option value="101000">서울전체</option>
						<option value="102000">경기</option>
					</select>
				</div>
				<div class="col" style="padding-top: 40px">
					<button class="btn btn-primary" id="search">검색</button>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${result }" var="job">
					<div class="col-3 mb-3">
						<div class="card">
							<div class="card-header">
								<input type="hidden" value="${job.id }" /> <a
									href="${job.company.name.href }">${job.company.name.content }</a>
							</div>
							<div class="card-body">
								<p>
									<b>${job.position.title }</b>
								</p>
								<p>${job.position.location.content }</p>
								<p>${job.salary.content }</p>
							</div>
							<div class="card-footer">
								<a href="${job.url }">채용공고</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>
	</main>

	<footer class="footer">
		<div class="container">
			<span class="text-muted"></span>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	var form = document.getElementById('form');
	console.log(form);
	document.getElementById('search').onclick = function() {
		form.submit();
	}
</script>
</html>