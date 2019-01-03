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
.form-signin {
	margin: 300px
}
</style>
<title></title>
</head>
<body class="text-center">
	<div class="justify-content-center col-lg-12">
		<form class="form-signin" method="post" action="/login">
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			<label for="inputId" class="sr-only">Id</label>
			 <input
				type="text" id="inputId" name="username" class="form-control"
				placeholder="Id" required autofocus> 
				<label
				for="inputPassword" class="sr-only">Password</label> 
				<input
				type="password" id="inputPassword" name="password" class="form-control"
				placeholder="Password" required>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="checkbox mb-3"></div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Signin</button>
			<p class="mt-5 mb-3 text-muted">HELLO! <a href="/join">Are you join here?</a></p>
		</form>
	</div>
</body>
</html>