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
<title>Добавление книги</title>
</head>
<body>

	<%@ include file="head.jsp"%>
	<br />
	
	<div class="container" style="width: 400px; height: 550px;">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление книги</h2>
		<hr/>
		<form name='addBook' action="add_book_title" method='POST'
			role="form">
			<div class="form-group">
				<label>Название книги:</label> <input class="form-control" type='text'
					name='name' placeholder="Название книги">
			</div>
			<div class="form-group">
				<label>Описание:</label> <textarea class="form-control"
					name='description' placeholder="Описание" ></textarea>
			</div>
			<div class="form-group">
				<label>Дата публикации:</label><input type="datetime"
					class="form-control" name="date">
			</div>
			<div class="form-group">
				<label>Файл изображения:</label><input type="file"
					class="form-control" name="urlImg">
			</div>
			<div class="form-group">
				<label>Файл книги:</label><input type="file"
					class="form-control" name="url">
			</div>
			<input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form>

	</div>
	

</body>
</html>