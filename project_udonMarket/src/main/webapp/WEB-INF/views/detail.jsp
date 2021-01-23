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
	document.getElementById("btnDel").onclick = chkDeleData;
	}
	function chkDeleData(){
		
		let pass = prompt("비밀번호를 입력하세요");
		location.href="delete?num=${data.num}&page=${page}&pass="+pass;
	}
</script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${msg != null}">
	<script type="text/javascript">
		(function msg(){
			alert("${msg}");
		})();
	</script>
</c:if>
<jsp:include page="../../top.jsp"></jsp:include>
<div class="container">
<h4 style="text-align: center;">* 상세보기</h4>
<table class="table" style="width: 80%">
  <tr>
  	<td>비밀번호 : ${data.pass}</td>
  	<td style="text-align: right;">
  		<a href="reply?num=${data.num}&page=${page}">
  			<img src="./resources/images/reply.gif" />
  		</a>
  		<a href="update?num=${data.num}&page=${page}">
  			<img src="./resources/images/edit.gif" />
  		</a>
  		<button id="btnDel"><img src="./resources/images/del.gif" /></button>
  		<!-- 
  		<a href="delete?num=${data.num}&page=${page}">
  			<img src="./resources/images/del.gif" />
  		</a>
  		 -->
  		<a href="list?page=${page}">
  			<img src="./resources/images/list.gif" />
  		</a>
  	</td>
  </tr>
</table>

<table border="1" style="width: 80%">
  <tr>
  	<td>
  		작성자 : <a href="mailto:${data.mail}">${data.name}</a>
  		(ip : ${data.bip})
  	</td>
  	<td>작성일 : ${data.bdate}</td>
  	<td>조회수 : ${data.readcnt}</td>
  </tr>
  <tr>
  	<td colspan="3">제목 : ${data.title}</td>
  </tr>
  <tr>
  	<td colspan="3">
  		<textarea rows="5" readonly="readonly" style="width:99%">${data.cont}</textarea>
  	</td>
  </tr>
</table>
</div>
</body>
</html>