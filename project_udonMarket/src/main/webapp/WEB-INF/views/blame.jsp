<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../top.jsp"></jsp:include>
**신고하기
<form action="blame" method="post">
신고번호:<input type="text" name="blame_id"><br>
상품번호:<input type="text" name="product_id"><br>
사용자이름:<input type="text" name="user_id"><br>
신고 내용:<input type="text" name="declaration_detail"><br>
신고이유를 선택해주세요.
<select name="declaration_reason">
	<option value="상품 불량">상품 불량</option>
	<option value="상품 불량">판매자 신고</option>
	<option value="상품 불량">거래 미처리</option>
</select>
<br>
<input type="submit" value="등록">
</form>
</body>
</html>