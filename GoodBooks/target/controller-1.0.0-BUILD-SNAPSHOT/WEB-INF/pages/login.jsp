<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Страница авторизации</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body onload='document.loginForm.username.focus();'>


	<%@ include file="head.jsp"%>

	<div class="container" style="width: 400px; height: 500px;">
		<br />
		<br />
		<br />
		<br />
		<br />

		<h3 class="form-signin-heading font-text">Пожалуйста,
			авторизируйтесь!</h3>

		<form name='loginForm' action="<c:url value='/login' />" method='POST'>
			<input class="form-control" type='text' name='username'
				placeholder="Логин"><br /> <input class="form-control"
				type='password' name='password' placeholder="Пароль" /><br /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Войти" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<c:if test="${not empty error}">
			<div class="allert allert-danger">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="allert allert-success">${msg}</div>
		</c:if>

	</div>

</body>
</html>