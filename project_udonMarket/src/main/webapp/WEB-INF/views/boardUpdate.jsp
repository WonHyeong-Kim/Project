<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	document.getElementById("btnUp").onclick = chkUpData;
	}
	function chkUpData(){
		/* if(upFrm.pass.value === ""){
			upFrm.pass.focus();
			alert("비밀번호를 입력하세요");
			return;
		} */
		if(confirm("저장하시겠습니까?")){
			upFrm.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
	<script type="text/javascript">
		(function msg(){
			alert("${msg}");
		})();
		location.href="list?page=${page}";
	</script>
</c:if>
<div class="container">
<h4 style="text-align: center;">- 수정 -</h4>
<form action="update" method="post" name="upFrm">
	<input type="hidden" name="board_no" value="${data.board_no}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="user_id" value="${data.user_id}">
	<table class="table" style="width: 80%">
	  <tr>
	  	<td>제목</td>
	  	<td><input type="text" name="board_title" value="${data.board_title}"></td>
	  </tr>
	  <tr>
	  	<td>내용</td>
	  	<td>
	  		<textarea rows="5" cols="50" name="board_content">${data.board_content}</textarea>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="2" style="text-align: center;">
	  		<input type="button" value="수정" id="btnUp">
	  		<input type="button" value="목록" onclick="location.href='list?page=${page}'">
	  	</td>
	  </tr>
	</table>
</form>
</div>
</body>
</html>