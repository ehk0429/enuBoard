<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
	<h1>
		<c:out value="${exception.getMessage()}"></c:out>
	</h1>
	<ul>
		<c:forEach items="${exception.getStackTrace()}" var="stack">
		<li><c:out value="${stack}"></c:out></li>
		</c:forEach>
	</ul>
</body>
</html>