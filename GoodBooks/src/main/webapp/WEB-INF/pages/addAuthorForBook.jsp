<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Добавление авторов</title>
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

	<!-- Show author for book -->

	<div class="container myContainer-add">
		<h3 align="center">Авторы книги</h3>
		<hr />
		<c:forEach items="${authors}" var="author">
			<blockquote
				style="color: black; font-style: oblique; font-family: Times New Roman; font-size: 18px;">${author.surname}
				${author.name} ${author.middlename}</blockquote>
		</c:forEach>
	</div>


	<!-- Add author for book -->
	<div class="container myContainer-add">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление
			автора</h2>
		<hr />

		<form
			action="${pageContext.request.contextPath}/library/add_annotation"
			name="addAnntotation" method="POST">
			<select class="form-control" name="author">
				<c:forEach items="${allAuthor}" var="author">
					<option value="${author.id}">${author.surname}
						${author.name} ${author.middlename}</option>
				</c:forEach>
			</select>
			<br/>
			 <input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить автора" />
		</form>

		<form name='addAuthorForBook'
			action="${pageContext.request.contextPath}/library/add_author_for_book"
			method='POST' role="form">
			<div class="form-group">
				<label>Имя: </label><input class="form-control" type='text'
					name='name' placeholder="Имя" required >
			</div>
			<div class="form-group">
				<label>Фамилия:</label> <input class="form-control" type='text'
					name='surname' placeholder="Фамилия" required>
			</div>
			<div class="form-group">
				<label>Отчество:</label> <input class="form-control" type='text'
					name='middlename' placeholder="Отчество" required>
			</div>
			<div class="form-group">
				<label>Дата рождения:</label><input type="date" class="form-control"
					name="birthday" required>
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="book"
				value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form>
		<br/>
		<form action="add_genre" method="GET" name="addGenreForBook">
			<input type="hidden" name="book" value="${book.id}" /> <input
				class="btn btn-lg btn-default btn-block " name="submit"
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