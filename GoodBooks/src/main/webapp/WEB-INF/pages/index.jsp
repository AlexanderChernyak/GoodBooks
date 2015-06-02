<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 
<title>Сервис рекомендации книг</title>

</head>
<body>

	<%@ include file="head.jsp"%>


	<div id = "myCarousel" class = "carousel slide center" data-ride="carousel" >
	
		 <ol class="carousel-indicators" role="listbox">
   			 <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
   			 <li data-target="#myCarousel" data-slide-to="1"></li>
   			 <li data-target="#myCarousel" data-slide-to="2"></li>
  		</ol>
  		
  		<div class = "carousel-inner" >
  			<div class = "item active">
  				<img src="${pageContext.request.contextPath}/resources/img/book.jpg" alt = "Book"  class = "img-responsive"  >
  				  <div class="carousel-caption">
      				<font color="#FFF8DC" face="Arial" size="5">С помощью нашего сайта пользователь не только сможет оценивать книгу по ее обложке, 
      				  		а выбирать их исходя из своих предпочтений. </font>
     			 </div>
  			</div>
  			<div class = "item ">
  				<img src="${pageContext.request.contextPath}/resources/img/books.jpg" alt = "Book" class = "img-responsive" >
  				  <div class="carousel-caption">
     			   		 <font color="#FFF8DC" face="Arial" size="5"> С помощью индивидуальной оценки каждый пользователь сайта может выбрать литературу, 
     			   		подходящую себе. </font>
    			  </div>
  			</div>
  			<div class = "item ">
  				<img src="${pageContext.request.contextPath}/resources/img/books1.jpg" alt = "Book" class = "img-responsive" >
  				  <div class="carousel-caption">
      			  <font color="#FFFFE0" face="Arial" size="5">С помощью данного сервиса литературу можно разграничивать на прочитанные,
      			   читаю и собираюсь прочитать. </font>
      			</div>
  			</div>  			
  		</div>
  		 
  		<a class = "carousel-control left" href = "#myCarousel" role="button" data-slide = "prev">
  			<span class = "icon-prev"></span>
  		</a>
  		
  		
  		<a class = "carousel-control right" href = "#myCarousel" role="button" data-slide = "next">
  			<span class = "icon-next"></span>
  		</a>
	
	</div>
</body>
</html>