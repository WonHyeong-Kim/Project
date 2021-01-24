<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
**신고 리스트<p/>
<table border="1">
	<tr>
		<th>신고번호</th><th>상품번호</th><th>사용자아이디</th><th>신고내용</th><th>신고이유</th><th>등록날짜</th>
		<c:forEach var="i" items="${list }">
			<tr>
				<td>${i.blame_id }</td>
				<td>${i.product_id }</td>
				<td>${i.user_id }</td>
				<td><a href="detail?blame_id=${i.blame_id }">${i.declaration_detail }</a></td>
				<td>${i.declaration_reason }</td>
				<td>${i.blame_date }</td>
			</tr>
		
		</c:forEach>
	</tr>
</table>
</body>
</html>