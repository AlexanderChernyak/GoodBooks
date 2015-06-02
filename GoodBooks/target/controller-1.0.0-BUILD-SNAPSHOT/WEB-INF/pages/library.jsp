<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Библиотека</title>
</head>
<body>
	<%@ include file="head.jsp"%>

	<br />

	<table border="2px" align = "center" >
		<tr height="500px">
			<td width = "15%">
				<ul class="nav nav-tabs nav-stacked">
					<li class="divider-vertical"><a href="all_book">Все
							произведения</a></li>
					<sec:authorize access="isAuthenticated()">
						<li class="divider-vertical"><a href="currently_book">Читаю сейчас</a></li>
						<li class="divider-vertical"><a href="future_book">Собираюсь
							прочитать</a></li>
						<li class="divider-vertical"><a href="past_book">Уже прочитанное</a></li>
					</sec:authorize>
				</ul>
				<hr/>
				<ul class="nav nav-tabs nav-stacked">
					<li class="divider-vertical"><a href="add_book">Добавить произведение</a></li>
					<li class="divider-vertical"><a href="search_books">Найти произведение</a></li>
				</ul>
			</td>
			
			<td width="50%">
				<table class = "table table-hover" border="3px">
					<c:forEach items="${books}" var="book">
						<tr>
							<td width="18%">
								<img src="${book.urlImage}" width="150" height="200">	
								<sec:authorize access="isAuthenticated()" method="POST">
								<form action = "show_book" method = "GET">
									<input type="hidden" name="book" id = "book" value= "${book.id}" />
									<input type="hidden" name="card" id = "card" value= "${card.id}" />
									<input type="submit" class = "btn btn-default" value = "Просмотреть книгу"/>
								</form>	
								</sec:authorize>			
							</td>
							<td>
								
								<table class = "table table table-striped table-condensed">
									<tr><td>Название:</td><td>${book.name}</td></tr>									
									<tr><td>Дата публикации:</td><td>${book.dateOfPublication}</td></tr>
									<tr><td>Рейтинг:</td><td>${book.rating}</td></tr>
									<tr><td>Произведение:</td><td><a class = "btn btn-default" href="<c:url value="${book.url}"/>">Скачать</a></td></tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>			
	</table>

</body>
</html>