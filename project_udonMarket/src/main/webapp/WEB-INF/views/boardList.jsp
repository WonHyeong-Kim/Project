<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<div class="container">
	<table  class="table">
	  <tr>
	  	<td>
	  		[<a href="boardList?page=1">최근목록</a>]&nbsp;
	  		<%
  			//AOP login check - 로그인상태인 경우에만 게시물 등록 버튼 show
  			%>
	  		[<a href="boardInsert">게시물 등록</a>]
	  	</td>
	  </tr>
	</table>
	<table class="table table-striped">
	  <thead>
	  <tr style="">
	  	<th>번호</th><th>제  목</th><th>작성자</th><th>작성일</th><th>조회수</th>
	  </tr>
	  </thead>
	  <c:forEach var="b" items="${data}">
	  	<!-- 덧글 들여쓰기 준비-->
	  	<c:set var="tab" value=""/>
	  	<c:forEach var="n" begin="1" end="${b.indent}">
	  		<c:set var="tab" value="${tab}&nbsp;&nbsp;&nbsp;&nbsp;"/> <!-- tab누적 -->
	  	</c:forEach>
	  <tr>
	  	<td>${b.board_no}</td>
	  	<td>
	  		${tab}<a href="boardDetail?board_no=${b.board_no}&page=${page}">${b.board_title}</a>
	  	</td>
	  	<td>${b.user_id}</td>
	  	<td>${b.board_wrt_date}</td>
	  	<td>${b.views}</td>
	  </tr>	
	  </c:forEach>
	  <!-- paging -->
	  <tr style="text-align: center;">
	  	<td colspan="5">
	  	<c:forEach var="psu" begin="1" end="${pageCount}">
	  		<c:if test="${psu==page}">
	  			<b>${psu}</b>
	  		</c:if>
	  		<c:if test="${psu!=page}">
	  			<a href="boardList?page=${psu}">${psu}</a>
	  		</c:if>
	  	</c:forEach>
	  	</td>
	  	
	  </tr>
	  <!-- search -->
	  <tr style="text-align: center;">
	  	<td colspan="5">
	  	<br><br>
	  	<form action="boardSearch" method="post">
	  		<select name="searchName">
	  			<option value="board_title" selected="selected">글제목</option>
	  			<option value="user_id">작성자</option> 
	  		</select>
	  		<input type="text" name="searchValue">
	  		<input type="submit" value="검색">
	  	</form>
	  	</td>
	  </tr>
	</table>
</div>
</body>
</html>






