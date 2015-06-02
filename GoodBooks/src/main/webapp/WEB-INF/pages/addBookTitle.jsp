<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>Добавление книги</title>
</head>
<body style="background-image:url(${pageContext.request.contextPath}/resources/img/fon.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
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
	
	<div class="container myContainer-add">

		<h2 class="form-signin-heading font-text" style="text-align: center;">Добавление книги</h2>
		<hr/>
		<form name='addBook' action="${pageContext.request.contextPath}/library/add_book_title" method='POST'
			role="form" enctype="multipart/form-data">
			<div class="form-group">
				<label>Название книги:</label> <input class="form-control" type='text'
					name='name' placeholder="Название книги" required >
			</div>
			 <div class="form-group">
				<label>Описание:</label> <textarea class="form-control"
					name='description' placeholder="Описание" required></textarea>
			</div>
			<div class="form-group">
				<label>Дата публикации:</label><input type="date"
					class="form-control" name="date"required>
			</div>
			<div class="form-group">
				<label>Файл изображения:</label><input type="file"
					class="form-control" name="urlImg"required>
			</div>
			<div class="form-group">
				<label>Файл книги:</label><input type="file"
					class="form-control" name="url"required>
			</div>
			<input class="btn btn-lg btn-default btn-block " name="submit"
				type="submit" value="Добавить" />
		</form>

	</div>
			<hr />
	<p class="text-center">
		<strong style="color: white;">© 2015</strong> Сервис рекомендации книг
		GoodBooks
	</p>

</body>
</html>