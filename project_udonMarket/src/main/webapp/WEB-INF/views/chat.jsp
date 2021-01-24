<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chatList>ul>li{
		
	
	}


</style>
</head>
<body> 
	<jsp:include page="../../top.jsp"></jsp:include>
	<br>
	<br>
	<br>
	
	<c:forEach var = "l" items="${list}">
		<div class="chatList">
			<ul>
				<li>${l.chat_id }</li>
				<li>${l.user_id }</li>
				<li>${l.product_id }</li>
				<li>${l.user_nickname }</li>
			</ul>
		</div>
	</c:forEach>
</body>
</html>