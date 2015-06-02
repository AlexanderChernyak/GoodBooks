<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Информация</title>
</head>
<body
	style="background-image:url(${pageContext.request.contextPath}/resources/img/fon2.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
	 background-position:right;">

	<%@ include file="head.jsp"%>
	<c:if test="${not empty error}">
		<div class="error">
			<div class="alert alert-danger alert-error">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<p align="center">
					<strong>Error!</strong> ${error}
				</p>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty success}">
		<div class="msg">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<p align="center">
					Success! ${success}
				</p>
			</div>
		</div>
	</c:if>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<hr />
	<p class="text-center">
		<strong style="color: white;">© 2015</strong> Сервис рекомендации книг
		GoodBooks
	</p>

</body>
</html>