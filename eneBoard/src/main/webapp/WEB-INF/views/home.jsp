<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	background-color: #696969;
}
</style>
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
					<li class="nav-item active"><a class="nav-link" href="/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href="guestBook/list">방명록</a>
					<li class="nav-item"><a class="nav-link disabled"
						href="translation/search">사전</a>
					<li class="nav-item"><a class="nav-link disabled"
						href="work/list">일자리정보</a></li>
				</ul>
				<a href="/logout">LOGOUT</a> 
			</div>
		</nav>
	</header>

	<!-- Begin page content -->
	<div class="card-deck mb-3 text-center" style="padding: 20%">
     <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">KIM EUN HYE</h4>
      </div>
      <div class="card-body">
        <h1 class="card-title pricing-card-title">김은혜 <small class="text-muted"></small></h1>
        <ul class="list-unstyled mt-3 mb-4">
          <li>1992.04.29</li>
          <li>ehk0429@gmail.com</li>
          <li><a href="https://github.com/ehk0429/">https://github.com/ehk0429/</a></li>
        </ul>
        <a class="btn btn-lg btn-block btn-primary"
							href='/login'>Contact</a>
      </div>
    </div>
  </div>


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
</script>
</html>