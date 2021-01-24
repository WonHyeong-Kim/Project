<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동 | 우리동네</title>
	<!-- font -->
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
</head>

<body>
	<!-- top -->
	<jsp:include page="./top.jsp"></jsp:include>
	<div class="contentWrap">
		<!-- search -->
		<jsp:include page="./search.jsp"></jsp:include>
		<section class="section2 w1280">
			<h2 class="ft_title center">
				최근 등록된 상품
			</h2>
			<h4 class="ft_title center">
				<a href="productList">더보기 <b></b></a> <!-- 배열 최신순서로 링크 -->
			</h4>
			<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="a" begin="1" end="8">
						<li>
							<a href="#">
								<div class="productImg">
									<img src="/udon/resources/images/keyboard.png" alt="">
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

		<section class="section3 w1280">
			<h2 class="ft_title center">
				우리동네 상품
			</h2>
			<h4 class="ft_title center">
				<a href="productList">더보기 <b>></b></a>
			</h4>

			<div class="productNew">
				<ul class="productNewUl">
					<c:forEach var="a" begin="1" end="8">
						<li>
							<a href="javascript:void(0)">
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
	</div>


	<div class="footerWrap w100">
		<footer class="footer w1280">
		
			<h1 class="headerLogo ft_title">
				<a href="./index.jsp">우<span class="sm_title">리</span>동<span class="sm_title">네</span></a>
			</h1>
			<div class="footerMenuWrap">
				<ul class="footerMenuUl">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">청소년보호방침</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>

			<div class="footersnsWrap">
				<ul class="footersnsUl">
					<li><a href="#"><i class="fab fa-facebook"></i></a></li>
					<li><a href="#"><i class="fab fa-instagram"></i></a></li>
					<li><a href="#"><i class="fas fa-comments"></i></a></li>
				</ul>
			</div>
			
			<div class="copy">
				<p>Copyright WooDong 2020</p>
			</div>
		</footer>
	</div>

</body>
</html>