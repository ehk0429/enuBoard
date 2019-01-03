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
					<li class="nav-item active"><a class="nav-link disabled"
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
					<div class="card-body">
						<h5 class="card-title">방명록</h5>
						<table class="table table-striped table-bordered talbe-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="guestBook">
									<tr>
										<td><c:out value="${guestBook.id}"></c:out></td>
										<td><c:out value="${guestBook.title}"></c:out></td>
										<td><a href='detail?id=${guestBook.id}'><c:out
													value="${guestBook.content}"></c:out></a></td>
										<td><c:out value="${guestBook.writer}"></c:out></td>
										<td><c:out value="${guestBook.created_at}"></c:out></td>
										<td><c:out value="${guestBook.updated_at}"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<nav aria-label="Page navigation example">
						<form role="form" name="actionForm" id="actionForm"
								action="/guestBook/list" method="get">
							<ul class="pagination">
								<c:if test="${pages.prev }">
									<li class="page-item"><a class="page-link"
										href="${pages.startPage -1 }" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
									</a></li>
								</c:if>
								<c:forEach var="num" begin="${pages.startPage }"
									end="${pages.endPage }">
									<li class="page-item ${pages.page.num == num * 5 - 5 ? 'active' : ' '}"><a
										class="page-link" href="${num == 1 ? 1 : num * 5 - 5}">${num }</a></li>
								</c:forEach>
								<c:if test="${pages.next }">
									<li class="page-item"><a class="page-link"
										href="${pages.endPage + 1 }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>					
								<input type="hidden" name="num" value="${pages.page.num}">
								<input type="hidden" name="amount" value="${pages.page.amount }">
							</form>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="row float-right" style="margin-top: 30px">
			<div class="col-lg-12">
				<a class="btn btn-sm btn-outline-primary" href="register"
					role="button">등록</a>
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
$(document).ready(function() {
	var actionForm = $('#actionForm')
	$('a.page-link').on('click', function(e) {
		e.preventDefault();
		actionForm.find("input[name='num']").val($(this).attr("href"));
		actionForm.submit();
	});
});
</script>
</html>