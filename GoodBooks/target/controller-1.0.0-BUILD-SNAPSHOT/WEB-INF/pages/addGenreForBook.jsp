<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Добавление жанра</title>
</head>
<body>

	<%@ include file="head.jsp"%>
	<br />
	<!-- Show genre for book -->
	<div class="container" style="width: 400px;">
		<c:forEach items="${genres}" var="genre">
			<!-- TODO:: add code -->
			<!--  <form action="delete_stylistic" method="POST"></form>-->
			<p>${genre.name}</p>
			<hr />
		</c:forEach>
	</div>

	<!-- Add genre for book -->
	<div class="container" style="width: 400px; height: 550px;">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление
			жанра</h2>
		<hr />

		<form action="add_stylistic" name="addStylistic">
			<select class="form-control" name="genre">
				<c:forEach items="${allGenres}" var="genre">
					<option value="${genre.id}">${genre.name}</option>
				</c:forEach>
			</select> <input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить жанр" />
		</form>

		<form name='addGenreForBook' action="add_genre_for_book" method='POST'
			role="form">
			<div class="form-group">
				<label>Название жанра: </label><input class="form-control"
					type='text' name='name' placeholder="Название жанра">
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="book"
				value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form>
		<form action="library" method="GET" name="endAdd">
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Далее" />
		</form>

	</div>


</body>
</html>