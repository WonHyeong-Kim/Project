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
		if(reFrm.board_title.value === ""){
			alert("제목을 입력하세요");
			reFrm.board_title.focus();
		}
		// 입력자료 오류 검사
		reFrm.submit();
	}
	</script>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<h4 style="text-align: center;">* 덧글 쓰기</h4>
<form action="reply" method="post" name="reFrm">
	<input type="hidden" name="board_no" value="${data.board_no}">
	<input type="hidden" name="user_id" value="${data.user_id}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="group_number" value="${data.group_number}">
	<input type="hidden" name="order_number" value="${data.order_number}">
	<input type="hidden" name="indent" value="${data.indent}">
	<%-- <input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>"> --%>
	
	<table class="table" style="width: 80%">
	  <tr>
	  	<td>제목</td>
	  	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	  	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  	<c:set var="board_title" value="${data.board_title}"/>
	  	<td><input type="text" name="board_title" value="[Re]:${fn:substring(board_title,0,8)}"></td>
	  </tr>
	  <tr>
	  	<td>내용</td>
	  	<td>
	  		<textarea rows="15" style="width:99%" name="board_content"></textarea>
	  	</td>
	  </tr>
	  <tr>
	  	<td colspan="2" style="text-align: center;">
	  		<input type="button" value="작성" id="btnReply">
	  		<input type="button" value="목록" onclick="location.href='boardList?page=${page}'">
	  	</td>
	  </tr>
	</table>
</form>
</body>
</html>