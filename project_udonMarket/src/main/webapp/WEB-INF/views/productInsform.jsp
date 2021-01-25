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
			if(frm.name.value === ""){
				alert("작성자를 입력하세요");
				frm.name.focus();
				return;
			}else if(frm.pass.value === ""){
				alert("비밀번호를 입력하세요");
				frm.name.focus();
				return;
			}
			frm.submit();
		}
	</script>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container">
		<h4 style="text-align: center;">* 게시물 등록</h4>
		<form action="insert" method="post" name="frm">
		<table  class="table" style="width: 80%">
		  <tr>
		  	<td>제목</td>
		  	<td><input type="text" name="product_title"></td>
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
		  	<td><input type="text" name="title"></td>
		  </tr>
		  <tr>
		  	<td>내용</td>
		  	<td>
		  		<textarea rows="5" cols="50" name="cont"></textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan="2" style="text-align: center;">
		  		<input type="hidden" name="bip" value="<%=request.getRemoteAddr()%>">
		  		<input type="button" value="등록" id="btnIns">
		  		<!-- <input type="button" value="등록" onclick="checkData()"> -->
		  		<input type="button" value="목록" onclick="location.href='list?page=1'">
		  	</td>
		  </tr>
		</table>
		</form>
 	</div>
</body>
</html>