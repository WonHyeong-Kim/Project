<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		document.getElementById("btnReply").onclick = chk;
	}
	function chk(){
		if(reFrm.name.value === ""){
			alert("작성자 이름을 입력하세요");
			reFrm.name.focus();
		}
		// 입력자료 오류 검사
		reFrm.submit();
	}
	</script>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<h4 style="text-align: center;">* 댓글 쓰기</h4>
<form action="reply" method="post" name="reFrm">
<input type="hidden" name="num" value="${data.num}">
<input type="hidden" name="page" value="${page}">
<input type="hidden" name="gnum" value="${data.gnum}">
<input type="hidden" name="onum" value="${data.onum}">
<input type="hidden" name="nested" value="${data.nested}">
<input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>">

<table class="table" style="width: 80%">
  <tr>
  	<td>이름</td>
  	<td><input type="text" name="name"></td>
  </tr>
  <tr>
  	<td>암호</td>
  	<td><input type="text" name="pass"></td>
  </tr>
  <tr>
  	<td>메일</td>
  	<td><input type="text" name="mail"></td>
  </tr>
  <tr>
  	<td>제목</td>
  	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<c:set var="title" value="${data.title}"/>
  	<td><input type="text" name="title" value="[Re]:${fn:substring(title,0,8)}"></td>
  </tr>
  <tr>
  	<td>내용</td>
  	<td>
  		<textarea rows="5" style="width:99%" name="cont"></textarea>
  	</td>
  </tr>
  <tr>
  	<td colspan="2" style="text-align: center;">
  		<input type="button" value="작성" id="btnReply">
  		<input type="button" value="목록" onclick="location.href='list?page=${page}'">
  	</td>
  </tr>
</table>
</form>
</body>
</html>