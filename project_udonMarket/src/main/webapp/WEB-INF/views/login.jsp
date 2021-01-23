<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	h2, .loginWrqp{
		font-family: 'Quicksand', sans-serif;
	}
	.loginBox{
		padding-top:30px;
		width:500px;
		height:400px;
		margin:auto;
		background:#465568;
		border-radius:15px;
	}
	
	.loginBox h2{
		display:block;
		text-align:center;
		padding:20px;
		color: #80d3f3;
	}
	
	.loginBox input, .loginBox button{
		position:relative;
		display:inline-block;
		margin:auto;
		text-align:center;
	}
	
	.loginId, .loginPw{
		background:none;
		outline:none;
		border:none;
		border-bottom:1px solid #cdcdcd;
		margin-bottom:16px;
		color: white;
	}
	
	.loginBox input::before{
		position:absolute;
		content:'';
		height:10px;
		width:1px;
		background:#000;
		left:0;bottom:0;
	}
	
	.loginBox input::after{
		position:absolute;
		content:'';
		height:10px;
		width:1px;
		background:#000;
		right:0;bottom:0;
	}
	.btnLogin{
		background-color: #80d3f3;
		width: 260px;
		height: 40px;
		color: #465568;
	}
	.imgLogin, .imgLock{
		width:30px;
		height: 30px;
		align-content: center;
		display: inline-block;
	}
	input::placeholder {
 	 	color: white;
  		font-style: italic;
	}
	.idWrap, .passWrap, .checkWrqp, .loginWrqp, .insertWrap{
		display: block;
		margin: auto;
		text-align: center;
	}
	.text{
		color: white;
	}
	.userInsert{
		color: white;
	}
</style>
</head>

<body>
<jsp:include page="../../top.jsp"></jsp:include>
<% 
		
		Cookie[] cookies =  request.getCookies();
		String id="";
		boolean checked = false;
		String str = "checked='checked'";
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("id")){ // id cookie를 가져와 String id에 넣는다.
					id = cookies[i].getValue();
					checked = true;
				}
			}
		}
	%>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="loginBox">
			<h2>Member Login</h2>
			<form name="login_frm" action="login" method="post">
				<div class="idWrap"><img class="imgLogin" src="/udon/resources/images/login2.png"><input type="text" placeholder="Username" class="loginId" value="<%= id %>"></input></div>
				<div class="passWrap"><img class="imgLock" src="/udon/resources/images/lock.png"><input type="password" class="loginPw"></input></div><br>
				<div class="checkWrqp"><input type="checkbox" name="id_save" id="id_save" value="T"<% if(checked==true){%>
				<%=str %><%}%>/>&nbsp;<span class="text">아이디저장</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="userInsert" href="userInsert">회원가입</a></div><br>
				<div class="loginWrqp"><input type="submit" class="btnLogin" value="Login"></div>
			</form>
			<div class="insertWrap"></div>
		</div>
		
	
</body>
</html>