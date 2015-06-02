<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Регистрация</title>
</head>
<body>
	<%@ include file="head.jsp"%>

	<div class="container" style="width: 400px; height: 550px;">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Регистрация</h2>
		<hr/>
		<form name='loginForm' action="${pageContext.request.contextPath}/registration" method='POST'
			role="form">
			<div class="form-group">
				<label>Логин:</label> <input class="form-control" type='text'
					name='username' placeholder="Логин">
			</div>
			<div class="form-group">
				<label>Пароль:</label> <input class="form-control" type='password'
					name='password' placeholder="Пароль" />
			</div>
			<div class="form-group">
				<label>Имя: </label><input class="form-control" type='text'
					name='name' placeholder="Имя">
			</div>
			<div class="form-group">
				<label>Фамилия:</label> <input class="form-control" type='text'
					name='surname' placeholder="Фамилия">
			</div>
			<div class="form-group">
				<label>Отчество:</label> <input class="form-control" type='text'
					name='middlename' placeholder="Отчество">
			</div>
			<div class="form-group">
				<label>Дата рождения:</label><input type="datetime"
					class="form-control" name="birthday">
			</div>
			<input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Зарегистрироваться" />

		</form>

	</div>

</body>
</html>