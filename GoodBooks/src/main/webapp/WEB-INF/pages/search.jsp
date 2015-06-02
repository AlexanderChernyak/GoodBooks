<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Поиск книги</title>
</head>
<body style="background-image:url(${pageContext.request.contextPath}/resources/img/fon3.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
	 background-position:right;">
	<%@ include file="head.jsp"%>
	<br />

	<table align="left"  class="table-nav-search">
		<tr>
			<td width="20px">
			</td>
			<td>
				<hr/>
				<form action="${pageContext.request.contextPath}/library/search/1" method="GET">
					<div class="form-group">
						<label>Название книги:</label> <input class="form-control"
							type='text' name='name' placeholder="Название книги" />
					</div>
					<div class="form-group">
						<label>Автор :</label> <select class="form-control" name="author">
							<option value="*">*</option>
							<c:forEach items="${authors}" var="author">
								<option value="${author.id}">${author.surname}
									${author.name} ${author.middlename}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Жанр :</label> <select class="form-control" name="genre">
							<option value="*">*</option>
							<c:forEach items="${genres}" var="genre">
								<option value="${genre.id}">${genre.name}</option>
							</c:forEach>
						</select>
					</div>
					<input type="submit" value="Найти" name="submit"
						class="form-control" />
				</form>
				<hr/>
			</td>
			<td width="20px">
			</td>
		</tr>
	</table>

	<div class="table-container">
		<table>
			<tr>
				<td><c:forEach var="i" begin="${(page-1)*8}" end="${page*8-1}">
						<c:if test="${not empty books[i] }">
							<div class="container-tr">
								<table>
									<tr>
										<td width="18%" style="padding-right: 10px;">
											<div class="thumbnail">
												<img class="img-rounded" src="${books[i].urlImage}"
													width="150" height="200">
											</div> <sec:authorize access="isAuthenticated()">
												<form action="${pageContext.request.contextPath}/library/show_book" method="GET">
													<input type="hidden" name="book" id="book"
														value="${books[i].id}" /> <input type="submit"
														class="btn btn-default" value="Просмотреть книгу" />
												</form>
											</sec:authorize>
										</td>
										<td>

											<table class="table table-condensed">
												<tr>
													<td><strong>Название:</strong></td>
													<td>${books[i].name}</td>
												</tr>
												<tr>
													<td><strong>Дата публикации:</strong></td>
													<td>${books[i].dateOfPublication}</td>
												</tr>
												<tr>
													<td><strong>Рейтинг:</strong></td>
													<td>${books[i].rating}</td>
												</tr>
												<sec:authorize access="isAuthenticated()">
													<tr>
														<td><strong>Произведение:</strong></td>
														<td><a class="btn btn-default"
															href="<c:url value="${books[i].url}"/>">Скачать</a></td>
													</tr>
												</sec:authorize>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</c:if>
					</c:forEach></td>
			</tr>
		</table>

		<nav align="center">
		<ul class="pagination">
			<li <c:if test="${page==1}">class = "disabled"</c:if>><a
				href="${page-1 }" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach var="i" begin="1" end="${countPage}">
				<li <c:if test="${i == page}">class = "active"</c:if>><a
					href="${i}">${i}</a></li>
			</c:forEach>
			<li <c:if test="${page==countPage}">class = "disabled"</c:if>><a
				href="${page+1 }" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>

	</div>

</body>
</html>