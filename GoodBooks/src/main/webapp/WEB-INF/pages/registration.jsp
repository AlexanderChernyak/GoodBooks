<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Регистрация</title>
</head>
<body style="background-image:url(${pageContext.request.contextPath}/resources/img/fon3.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
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

		<h3 class="form-signin-heading font-text" style="text-align: center;">Регистрация</h3>
		<hr/>
		<form name='loginForm' action="${pageContext.request.contextPath}/registration" method='POST'
			role="form">	
				<label>Логин:</label> <input class="form-control" type='text'
					name='username' placeholder="Логин" required/>
				<label>Пароль:</label> <input class="form-control" type='password'
					name='password' placeholder="Пароль" required/>
				<label>Имя: </label><input class="form-control" type='text'
					name='name' placeholder="Имя"required/>			
				<label>Фамилия:</label> <input class="form-control" type='text'
					name='surname' placeholder="Фамилия"required/>
				<label>Отчество:</label> <input class="form-control" type='text'
					name='middlename' placeholder="Отчество"required/>
				<label>Дата рождения:</label><input type="date"
					class="form-control" name="birthday"required/>
			<input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
			<br/>
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Зарегистрироваться" />
			<hr/><br/>

		</form>

	</div>
	</div>
		<hr />
	<p class="text-center">
		<strong style="color: white;">© 2015</strong> Сервис рекомендации книг
		GoodBooks
	</p>

</body>
</html>