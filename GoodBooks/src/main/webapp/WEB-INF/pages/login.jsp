<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Страница авторизации</title>

</head>



<body onload='document.loginForm.username.focus();'
	style="background-image:url(${pageContext.request.contextPath}/resources/img/fon.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
	 background-position:right;">



	<%@ include file="head.jsp"%>

	<c:if test="${not empty error}">
		<div class="error">
			<div class="alert alert-info">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<p align="center">Error! ${error}</p>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty success}">
		<div class="msg">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<p align="center">Success! ${success}</p>
			</div>
		</div>
	</c:if>


	<div class="container conteiner-wrap">
		<div class="container myContainer">


			<h3 class="form-signin-heading font-text" align="center">Пожалуйста,
				авторизируйтесь!</h3>

			<hr />

			<form name='loginForm' action="<c:url value='/login' />"
				method='POST'>

				<label class="control-label">Логин:</label> <input
					class="form-control" type='text' name='username'
					placeholder="Логин" required="required"> <label
					class="control-label" for="inputError1">Пароль:</label> <input
					class="form-control" type='password' name='password'
					placeholder="Пароль" required="required" /> <br /> <input
					class="btn btn-lg btn-default btn-block " name="submit"
					type="submit" value="Войти" /> <input type="hidden"
					name="${_csrf.parameterName}" value="${_csrf.token}" />
				<hr />
				<br />
			</form>

		</div>
	</div>



	<hr />
	<p class="text-center">
		<strong style="color:white;">© 2015</strong> Сервис рекомендации книг GoodBooks
	</p>
</body>
</html>