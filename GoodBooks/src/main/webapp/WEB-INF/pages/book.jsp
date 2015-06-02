<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>Книга</title>
</head>
<body
	style="background-image:url(${pageContext.request.contextPath}/resources/img/fon3.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
	 background-position:right;">

	<%@ include file="head.jsp"%>
	<br />
	<div class="container table-container-book">
		<div class="container-tr">
			<table align="center" class="table">
				<tr>
					<td>
						<table width="200px">
							<tr>
								<td><div class="thumbnail">
										<img src="${book.urlImage}" width="150" height="200">
									</div></td>
							</tr>
							<tr>
								<td><c:if test="${card.exposureRating == false}">
										<form
											action="${pageContext.request.contextPath}/library/set_rating"
											method="POST">
											<div class="form-group">
												<label class="radio-inline"> <input type="radio"
													name="inlineRadio" value="1" checked /> 1
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
												<input type="hidden" name="card" id="card"
													value="${card.id}" /> <input type="submit" value="Оценить"
													name="setRating" class="form-control btn btn-default" />

											</div>
										</form>
									</c:if></td>
							</tr>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<tr>
									<td>
										<form action="${pageContext.request.contextPath}/library/delete_book" method="get">
											<input type="hidden" value="${book.id}" name="book">
											<input type="submit" value="Удалить" name="deleteBook"
												class="form-control btn btn-default" />
										</form>
									</td>
								</tr>
							</sec:authorize>
						</table>
					</td>
					<td>

						<table class="table"
							style="background-color: rgba(250, 250, 250, 0.5);">
							<tr>
								<td width="100px"><strong>Название:</strong></td>
								<td>${book.name}</td>
							</tr>
							<tr>
								<td><strong>Описание:</strong></td>
								<td>${book.description}</td>
							</tr>
							<tr>
								<td><strong>Опубликовано:</strong></td>
								<td>${book.dateOfPublication}</td>
							</tr>
							<tr>
								<td><strong>Рейтинг:</strong></td>
								<td>${book.rating/book.countRate }</td>
							</tr>
							<tr>
								<td><strong>Жанр:</strong></td>
								<td><c:forEach items="${genres}" var="genre">
								${genre.name};
							</c:forEach></td>
							</tr>
							<tr>
								<td><strong>Авторы:</strong></td>
								<td><c:forEach items="${authors}" var="author">
								${author.surname} ${author.name} ${author.middlename};
							</c:forEach></td>
							</tr>
							<tr>
								<td><strong>Статус:</strong></td>
								<td><c:if test="${card.status == 0 }">
								--------------------
							</c:if> <c:if test="${card.status == 1 }">
								Читаю
							</c:if> <c:if test="${card.status == 2 }">
								Собираюсь прочитать
							</c:if> <c:if test="${card.status == 3 }">
								Книга прочитана
							</c:if></td>
							</tr>
							<tr>
								<td>
									<form
										action="${pageContext.request.contextPath}/library/set_status"
										method="POST" class="form-horizontal">
										<select class="form-control" name="status">
											<option value="0">Убрать из списка моих книг</option>
											<option value="1">Добавить в список "Читаю"</option>
											<option value="2">Добавить в список "Собираюсь
												прочитать"</option>
											<option value="3">Добавить в список "Книга
												прочитана"</option>
										</select> <input type="hidden" name="card" id="card" value="${card.id}" />
										<input type="hidden" name="book" id="book" value="${book.id}" />
								</td>
								<td><input type="submit" value="Сменить статус"
									name="setStatus" class="form-control btn btn-default" />
									</form></td>
							</tr>
							<tr>
								<td><strong>Произведение:</strong></td>
								<td><a class="btn btn-default"
									href="<c:url value="${book.url}"/>">Скачать</a></td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</div>


		<table align="center">
			<tr>
				<td>
					<div style="width: 800px;">
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
															<footer style="text-align:right;">
															<strong>${comment.libraryCard.user.surname}
																${comment.libraryCard.user.name}
																${comment.libraryCard.user.middlename} </strong>
															<br />
															<cite title="Source Title">${comment.timeWrite}</cite></footer>
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
			<div>

				<hr />
				<form
					action="${pageContext.request.contextPath}/library/set_comment"
					method="GET">
					<div class="form-group">
						<textarea name="text" placeholder="Комментарий..."
							class="form-control"></textarea>
					</div>
					<input type="hidden" name="book" id="book" value="${book.id}" />
					<div class="form-group">
						<input type="submit" value="Оставить комментарий" name="submit"
							class="form-control btn btn-default" />
					</div>
				</form>
			</div>
		</sec:authorize>
	</div>
	<hr />
	<p class="text-center">
		<strong style="color: white;">© 2015</strong> Сервис рекомендации книг
		GoodBooks
	</p>
</body>
</html>