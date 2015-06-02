<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">


</head>

<body style ="background:linear-gradient(to top,rgb(180,180,180), rgb(0,0,0))">
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">
				<img src="${pageContext.request.contextPath}/resources/img/logo.jpg"
				class="smallLogo"> <b><i><font face="times new roman"
						size="7" color="black">GoodBooks</font></i></b>
			</a>
		</div>


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			

			<ul class="nav navbar-nav navbar-right">
				<br/>
				<br/>
				<br/>
				<li class = "divider-vertical"><a href="${pageContext.request.contextPath}/library/all_book/1">Библиотека</a></li>
				
				<sec:authorize access="isAuthenticated()">
					<li >
						<a class = "divider-vertical brand" style="font-color: black;">Здравствуйте, ${pageContext.request.userPrincipal.name} !</a>
					</li>
					<li class="divider-vertical"><a href="<c:url value="/logout" />">
							Выйти</a></li>

				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">			
					<li class = "divider-vertical"><a href="${pageContext.request.contextPath}/login">Войти</a></li>
					<li class = "divider-vertical"><a href="${pageContext.request.contextPath}/register">Зарегистрироваться</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
	</nav>
</body>
</html>