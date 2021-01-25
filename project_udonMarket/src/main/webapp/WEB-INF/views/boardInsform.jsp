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
			let btnIns = document.getElementById("btnIns");
			btnIns.addEventListener("click",checkData, false);
		}
		function checkData(){
			if(frm.board_title.value === ""){
				alert("제목을 입력하세요");
				frm.board_title.focus();
				return;
			}else if(frm.board_content.value === ""){
				alert("본문내용을 입력하세요");
				frm.board_content.focus();
				return;
			}
			frm.submit();
		}
	</script>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
<h4 style="text-align: center;">* 게시물 등록</h4>
<form action="boardInsert" method="post" name="frm">
<table  class="table" style="width: 80%">
  <tr>
  	<td>제목</td>
  	<td><input type="text" name="board_title"></td>
  </tr>
  <tr>
  	<td>내용</td>
  	<td>
  		<textarea rows="5" cols="150" name="board_content" style="width: 98%"></textarea>
  	</td>
  </tr>
  <tr>
  	<td colspan="2" style="text-align: center;">
  		<input type="button" value="등록" id="btnIns">
  		<input type="hidden" name="user_id" value="${data.user_id}">
  		<!-- <input type="button" value="등록" onclick="checkData()"> -->
  		<input type="button" value="목록" onclick="location.href='boardList?page=1'">
  	</td>
  </tr>
</table>
</form>
</body>
</html>