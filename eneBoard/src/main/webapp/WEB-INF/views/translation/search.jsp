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
					<li class="nav-item active"><a class="nav-link disabled"
						href="../translation/search">사전</a>
					<li class="nav-item"><a class="nav-link disabled"
						href="../work/list">일자리정보</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Begin page content -->
	<main role="main" class="container" style="padding-top: 20%;">
	<div class="row">
		<div class="col-md-6 offset-md-3 form-inline">
			<form role="form" action="/translation/search" method="post"
				id="form">
				<div class="row mb-2">
					<select class="form-control mr-sm-2" name="source" id="source">
						<!-- source ko:한국어, en:영어, ja:일본어, zh-CN:중국어(간체), zh-TW:중국어(번체) -->
						<option value="ko">한국어</option>
						<option value="en">영어</option>
					</select> <select class="form-control mr-sm-2" name="target">
						<!-- target ko:한국어, en:영어, ja:일본어, zh-CN:중국어(간체), zh-TW:중국어(번체) -->
						<option value="ko">한국어</option>
						<option value="en">영어</option>
						<option value="ja">일본어</option>
						<option value="zh-CN">중국어(간체)</option>
						<option value="zh-TW">중국어(번체)</option>
					</select>
					<div class="form-group form-inline">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
				</div>
				<div class="row mb-2">
					<input class="form-control mr-sm-2" type="text" name="text"
						placeholder="텍스트를 입력하세요." />
					<button class="btn btn-primary" id="translation">번역</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<input id="text" class="form-control-plaintext" />
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
	document.getElementById('translation').onclick = function() {
		form.submit();
	}
	var text = ${text}
	console.log(text.message.result.translatedText)
	var result = text.message.result
	document.getElementById('text').value = result.translatedText
	if (result.srcLangType) {
		document.getElementById('source').value = result.srcLangType
	}
</script>
</html>