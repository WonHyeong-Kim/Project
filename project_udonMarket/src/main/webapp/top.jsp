<%@page import="pack.user.model.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네</title>
	<!-- font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- bootstrap -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- resource -->
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<% UserDto user = (UserDto) session.getAttribute("userDto");  %> <!-- session처리  -->
</head>
<body>
	<div class="headerWrap w100">
		<header class="header w1280">
			<h1 class="headerLogo ft_title">
				<a href="./index.jsp">우<span class="sm_title">리</span>동<span class="sm_title">네</span></a>
			</h1>
			<div class="headerMenu">
				<ul>
					<li><a href="boardList?page=1">동네생활</a></li>
					<li><a href="productList?page=1">우리동네 상품</a></li>
					<li><a href="location">MY LOCATION</a></li>
				</ul>
			</div>
			<div class="headerRightWrap">
				<ul class="headerRightUl">
				<li><a href="blame">신고하기</a></li>
					<%if(user == null){ %> <!-- 유저가 없으면 로그인 창이, 있으면 로그아웃 창이 뜸 -->
					<li><a href="login">LOG-IN</a></li>
					<%} else{ %>
					<li><%=user.getUser_id() %>님 반갑습니다.</li>
					<li><a href="logout">LOG-OUT</a>
					<%} %>
					<li><a href="userInsert">회원가입</a></li>
					<li><a href="userInfo"><i class="fas fa-user"></i></a></li>
					<li><a href="chat"><i class="fas fa-comments"></i></a></li>
					<li><a href="basket"><i class="fas fa-heart"></i></a></li>
				</ul>
			</div>
		</header>
	</div>
</body>
</html>