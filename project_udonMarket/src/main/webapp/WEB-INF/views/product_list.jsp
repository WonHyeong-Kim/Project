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
	
	<section class="section3 w1280">
		<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="a" begin="1" end="8">
						<li>
							<a href="product_detail?board_no=${b.board_no}&page=${page}">
								<div class="productImg">
									<img src="img/keyboard.png" alt="">
								</div>
								<dl>
									<dt class="productName">키스킨 싸게 팔아염</dt>
									<dd class="memAddress d_inblock">송파구 삼전동</dd>
									<dd class="memname d_inblock">사기꾼 님</dd>
									<dd class="price">200,000원</dd>
								</dl>
							</a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</section>
</body>
</html>