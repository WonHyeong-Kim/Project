<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="contentWrap">
		<section class="section1 w100">
			<div class="mainVisual w1280 d_block">
				<form action="productSearch" method="get">
					<div class="searchCateWrap d_block">
						<span class="d_block ft_title bigTitle">어떤 종류의 상품을 구매하고 싶으신가요?</span>
						<select name="category_id" id="searchCate">
							<option value="0">카테고리를 선택하세요</option>
							<option value="1">디지털/가전</option>
							<option value="2">가구/인테리어</option>
							<option value="3">아동/유아도서</option>
							<option value="4">생활/가공식품</option>
							<option value="5">스포츠/레저</option>
							<option value="6">여성잡화</option>
							<option value="7">여성의류</option>
							<option value="8">남성패션</option>
							<option value="9">게임/취미</option>
							<option value="10">뷰티/미용</option>
							<option value="11">반려동물용품</option>
							<option value="12">도서/티켓/음반</option>
							<option value="13">식물</option>
							<option value="14">기타 중고물품</option>
						</select>
					</div>
					<div class="searchTownWrap d_block center">
						<span class="d_block ft_title bigTitle">어떤 상품을 구매하고 싶으신가요?</span>
						<input type="text" name="product_title" class="searchTown" placeholder="상품 검색">
						<input type="checkbox" name="allTown" value="allTown">
						<span class="checkTitle">모든동네</span>
					</div>
					<input type="submit" class="searchBtn d_block ft_title" value="검색">
				</form>
			</div>
					
		</section>
	</div>
</body>
</html>