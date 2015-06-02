<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Добавление жанра</title>
</head>
<body style="background-image:url(${pageContext.request.contextPath}/resources/img/fon3.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
	 background-position:right;">

	<%@ include file="head.jsp"%>
	<br />
	
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
	<!-- Show genre for book -->
	
	<div class="container myContainer-add" >
		<h3 align="center">Жанры книги</h3>
		<hr />
		<c:forEach items="${genres}" var="genre">
			<blockquote style="color: black; font-style: oblique; font-family: Times New Roman; font-size: 18px;">${genre.name}</blockquote>
		
		</c:forEach>
	</div>

	<!-- Add genre for book -->
	<div class="container myContainer-add" >

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление
			жанра</h2>
		<hr />

		<form action="${pageContext.request.contextPath}/library/add_stylistic" method="POST">
			<select class="form-control" name="genre">
				<c:forEach items="${allGenres}" var="genre">
					<option value="${genre.id}">${genre.name}</option>
				</c:forEach>
			</select><br/> <input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить жанр" />
		</form>

		<form name='addGenreForBook' action="${pageContext.request.contextPath}/library/add_genre_for_book" method='POST'
			role="form">
			<div class="form-group">
				<label>Название жанра: </label><input class="form-control"
					type='text' name='name' placeholder="Название жанра" required>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="book"
				value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form><br/>
		<form action="${pageContext.request.contextPath}/library/all_book/1" method="GET" name="endAdd">
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Далее" />
		</form>

	</div>
		<hr />
	<p class="text-center">
		<strong style="color: white;">© 2015</strong> Сервис рекомендации книг
		GoodBooks
	</p>

</body>
</html>