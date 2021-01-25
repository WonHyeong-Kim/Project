<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src='/udon/resources/js/main.js'></script>
	<link href='/udon/resources/css/basic.css' rel='stylesheet'>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container">
		<section class="section3 w1280">
			<table  class="table">
			  <tr>
			  	<td>
			  		[<a href="productList?page=1">최근목록</a>]&nbsp;
			  		<%
		  			//AOP login check - 로그인상태인 경우에만 게시물 등록 버튼 show
		  			%>
			  		[<a href="productInsert">게시물 등록</a>]
			  	</td>
			  </tr>
			</table>
			<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="p" items="${data}">
						<li>
							<a href="productDetail?product_id=${p.product_id}&page=${page}">
								<div class="productImg">
									<img src="/udon/resource/images/${p.product_image}.png" alt="사진">
								</div>
								<dl>
									<dt class="productName">${p.product_title}</dt>
									<dd class="memAddress d_inblock">조회수 : ${p.views} / </dd>
									<dd class="memname d_inblock">작성자 : ${p.user_id}</dd>
									<dd class="price">${p.product_price}원</dd>
								</dl>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>