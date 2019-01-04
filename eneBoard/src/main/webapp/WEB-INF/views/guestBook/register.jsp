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
					<li class="nav-item"><a class="nav-link disabled"
						href="../work/list">일자리정보</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Begin page content -->
	<main role="main" class="container" style="padding-top: 150px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card">
						<form role="form" action="/guestBook/register" method="post" id="form">
							<div class="card-header">
								<div class="form-group form-inline">
									<input type="hidden" name="type" value="GUESTBOOK" /> <label
										class="col-sm-2 col-form-label">title</label>
									<div class="auto">
										<input type="text" class="form-control" name='title'>
									</div>
									<label class="col-sm-2 col-form-label">writer</label>
									<div class="auto">
										<input type="text" class="form-control" readonly="readonly" name='writer' value="${writer }" />
									</div>
								</div>
							</div>

							<div class="card-body">
								<div class="form-group form-inline">
									<label class="col-sm-2 col-form-label">content</label>
									<div class="auto">
										<textarea class="form-control" rows="3" name='content'></textarea>
									</div>
								</div>
								<div class="form-group form-inline">
									<label class="col-sm-2 col-form-label">password</label>
									<div class="auto">
										<input type="password" class="form-control" name='password'
											placeholder="Password">
									</div>
								</div>
								<div class="form-group form-inline">
									<label class="col-sm-2 col-form-label">secret</label>
									<div class="form-check form-check-inline">
										<input class="form-radio-input" checked="checked" type="radio"
											name="is_enabled" id="radio" value="true"> <label
											class="form-radio-label" for="radio">yes</label>
									</div>
								</div>
								<div class="form-group form-inline">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
							</div>
						</form>
						<div class="card-footer">
							<a class="btn btn-sm btn-outline-info" href="list" role="button">목록</a>
							<button class="btn btn-sm btn-outline-primary" type="submit"
								id="add">등록</button>
						</div>
					</div>
				</div>
			</div>
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
	document.getElementById('add').onclick = function() {
		form.submit();
	}
</script>
</html>