<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Библиотека</title>
</head>
<body
	style="background-image:url(${pageContext.request.contextPath}/resources/img/fon2.jpg) ;background-repeat: no-repeat;  background-color:rgb(0,0,0); 
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

	<div>
		<table align="left" class="table-nav">
			<tr>
				<td>
					<ul class="nav nav-tabs nav-stacked">
						<li class="divider-vertical"><a
							href="${pageContext.request.contextPath}/library/all_book/1">Все
								произведения</a></li>
						<sec:authorize access="isAuthenticated()">
							<li class="divider-vertical"><a
								href="${pageContext.request.contextPath}/library/currently_book/1">Читаю
									сейчас</a></li>
							<li class="divider-vertical"><a
								href="${pageContext.request.contextPath}/library/future_book/1">Собираюсь
									прочитать</a></li>
							<li class="divider-vertical"><a
								href="${pageContext.request.contextPath}/library/past_book/1">Уже
									прочитанное</a></li>
						</sec:authorize>
					</ul>
					<hr />
					<ul class="nav nav-tabs nav-stacked">
						<li class="divider-vertical"><a data-toggle="modal"
							data-target="#myModal">Предложить книгу</a></li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="divider-vertical"><a
								href="${pageContext.request.contextPath}/library/add_book">Добавить
									произведение</a></li>
							<li class="divider-vertical"><a
								href="${pageContext.request.contextPath}/suggest/show">Предложенные книги</a></li>
						</sec:authorize>
						<li class="divider-vertical"><a
							href="${pageContext.request.contextPath}/library/search_books/1">Найти
								произведение</a></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
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
												<form
													action="${pageContext.request.contextPath}/library/show_book"
													method="GET">
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
													<td><fmt:formatNumber value="${books[i].rating/books[i].countRate }" maxFractionDigits="2" minFractionDigits="2"></fmt:formatNumber></td>
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


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Предложить книгу</h4>
				</div>
				<form action="${pageContext.request.contextPath}/suggest"
					method="POST">
					<div class="modal-body">
						<label>Представьтесь:</label><input type="text"
							class="form-control" name="who" required> <label>Книга:</label><input
							type="text" class="form-control" name="book">
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Предложить" />
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>