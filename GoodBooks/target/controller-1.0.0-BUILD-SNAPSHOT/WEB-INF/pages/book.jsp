<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Книга</title>
</head>
<body>
	<%@ include file="head.jsp"%>
	<br />

	<table align="center">
		<tr>
			<td>
				<table>
					<tr>
						<td><img src="${book.urlImage}" width="150" height="200"></td>
					</tr>
					<tr>
						<td><sec:authorize access="isAuthenticated()">
								<c:if test="${!card.exposureRating}">

									<form action="set_rating" method="POST">
										<div class="form-group">
											<label class="radio-inline"> <input type="radio"
												name="inlineRadio" value="1" /> 1
											</label> <label class="radio-inline"> <input type="radio"
												name="inlineRadio" value="2" /> 2
											</label> <label class="radio-inline"> <input type="radio"
												name="inlineRadio" value="3" /> 3
											</label> <label class="radio-inline"> <input type="radio"
												name="inlineRadio" value="4" /> 4
											</label> <label class="radio-inline"> <input type="radio"
												name="inlineRadio" value="5" /> 5
											</label>
										</div>
										<div class="form-group">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> <input type="hidden" name="book"
												id="book" value="${book.id}" /> <input type="hidden"
												name="libraryCard" id="libraryCard" value="${card.id}" />
											<div class="form-group">
												<input type="submit" value="Оценить" name="setRating"
													class="form-control" />
											</div>
										</div>
									</form>
								</c:if>
							</sec:authorize>
							<sec:authorize access = "hasRole('ROLE_ADMIN')">
							<form action="delete_book" method="GET">
								<input type="hidden" name="book" id="book" value="${book.id}" />
								<input type="submit" value="Удалить" name="setRating"
													class="form-control" />
							</form>
							</sec:authorize>
							</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td>Название:</td>
						<td>${book.name}</td>
					</tr>
					<tr>
						<td>Описание:</td>
						<td>${book.description}</td>
					</tr>
					<tr>
						<td>Дата публикации:</td>
						<td>${book.dateOfPublication}</td>
					</tr>
					<tr>
						<td>Рейтинг:</td>
						<td>${book.rating}</td>
					</tr>
					<tr>
						<td>Жанр:</td>
						<td><c:forEach items="${genres}" var="genre">
								${genre.name};
							</c:forEach></td>
					</tr>
					<tr>
						<td>Авторы:</td>
						<td><c:forEach items="${authors}" var="author">
								${author.surname} ${author.name} ${author.middlename};
							</c:forEach></td>
					</tr>
					<tr>
						<td>Произведение:</td>
						<td><a class="btn btn-default"
							href="<c:url value="${book.url}"/>">Скачать</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td>
				<div class="container">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title" align="center">
									<a data-toggle="collapse" data-parrent="#accordion"
										data-target="#section"> Показать комментарии </a>
								</h4>
							</div>

							<!-- Comment -->
							<div class="panel-collapse collapse" id="section">
								<div class="panel-body">
									<table class="table">
										<c:forEach items="${comments}" var="comment">
											<tr>
												<td>
													<blockquote>
														<p>${comment.text}</p>
														<footer>${comment.libraryCard.user.surname}
														${comment.libraryCard.user.name}
														${comment.libraryCard.user.middlename}<cite
															title="Source Title">${comment.timeWrite}</cite></footer>
													</blockquote>
												</td>
											</tr>
											<tr>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>

						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>

	<sec:authorize access="isAuthenticated()">
		<div class="container">
			<h4 class="form-signin-heading" style="text-align: left;">
				<ins>Оставить комментарий</ins>
			</h4>
			<hr />
			<form action="set_comment" method="GET">
				<div class="form-group">
					<textarea name="text" placeholder="Комментарий..."
						class="form-control"></textarea>
				</div>
				<input type="hidden" name="book" id="book" value="${book.id}" />
				<div class="form-group">
					<input type="submit" value="Оставить комментарий" name="submit"
						class="form -control" />
				</div>
			</form>
		</div>
	</sec:authorize>

</body>
</html>