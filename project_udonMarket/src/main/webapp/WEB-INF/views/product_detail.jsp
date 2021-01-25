<%@page import="org.springframework.http.HttpStatus"%>
<%@page import="org.springframework.web.client.HttpClientErrorException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품게시판</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
	<script type="text/javascript">
		/*
		(function msg(){
			alert("${msg}");
		})();
		*/
	</script>
</c:if>
<jsp:include page="../../top.jsp"></jsp:include>
<div class="container">
<h4 style="text-align: center;">* 상세보기</h4>
<table class="table" style="width: 80%">
  <tr>
  	<td></td>
  	<td style="text-align: right;">
  		<a href="reply?product_id=${data.product_id}&page=${page}">
  			<img src="./resources/images/reply.gif" />
  		</a>
  		<%
  			//AOP login check - 로그인상태인 경우에만 수정,삭제버튼 show
  		%>
  		<a href="update?product_id=${data.product_id}&page=${page}">
  			<img src="./resources/images/edit.gif" />
  		</a>
  		<!-- 
  		<button id="btnDel"><img src="./resources/images/del.gif" /></button>
  		 -->
  		<a href="delete?product_id=${data.product_id}&page=${page}">
  			<img src="./resources/images/del.gif" />
  		</a>
  		
  		<a href="list?page=${page}">
  			<img src="./resources/images/list.gif" />
  		</a>
  	</td>
  </tr>
</table>

<table border="1" style="width: 80%">
  <tr>
  	<td>
  		작성자 : <!-- <a href="판매자가 쓴 글 목록"> -->${data.user_id}<!-- </a> -->
  	</td>
  	<td>작성일 : ${data.update_date}</td>
  	<td>조회수 : ${data.views}</td>
  </tr>
  <tr>
  	<td colspan="3">제목 : ${data.product_title}</td>
  </tr>
  <tr>
  	<td colspan="3">
  		<textarea rows="5" readonly="readonly" style="width:99%">
  			${data.product_content}
  		</textarea>
  	</td>
  </tr>
</table>
</div>
</body>
</html>