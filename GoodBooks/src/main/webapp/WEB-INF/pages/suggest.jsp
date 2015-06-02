<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Предложения от пользователей сервиса</title>
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
				<p align="center">Success! ${success}</p>
			</div>
		</div>
	</c:if>


	<div class="table-container"  >
		<div class="container-tr">
		<table class = "table">
			<tr>
				<td><strong>Кто предложил</strong></td>
				<td><strong>Какая книга</strong></td>
				<td><strong>Действие</strong></td>
			</tr>
			<c:forEach items="${suggests}" var="suggest">
				<tr style="color:black;">
					<td>${suggest.who}</td>
					<td>${suggest.book}</td>
					<td>
						<form action="${pageContext.request.contextPath}/suggest/delete" method="get">
							<input type = "hidden" value="${suggest.id}" name="suggest"/>
							<input type="submit" value = "Удалить предложение" class = "btn btn-default"/> 
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>

</body>
</html>