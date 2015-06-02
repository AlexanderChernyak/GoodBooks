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
<title>Добавление авторов</title>
</head>
<body>
	<%@ include file="head.jsp"%>
	<br />

	<!-- Show author for book -->

	<div class="container" style="width: 400px; ">
		<c:forEach items="${authors}" var="author">
			<p>${author.surname} ${author.name} ${author.middlename}</p>
			<hr />
		</c:forEach>
	</div>


	<!-- Add author for book -->
	<div class="container" style="width: 400px; height: 550px;">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление
			автора</h2>
		<hr />

		<form action="add_annotation" name="addAnntotation" method = "POST">
			<select class="form-control" name = "author">
				<c:forEach items="${allAuthor}" var="author">
					<option value="${author.id}">${author.surname} ${author.name} ${author.middlename}</option>
				</c:forEach>				
			</select>
			<input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить автора" />
		</form>

		<form name='addAuthorForBook' action="add_author_for_book"
			method='POST' role="form">
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
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="book"
				value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form>
		<form action="add_genre" method="GET" name="addGenreForBook">
			<input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Далее" />
		</form>

	</div>


</body>
</html>