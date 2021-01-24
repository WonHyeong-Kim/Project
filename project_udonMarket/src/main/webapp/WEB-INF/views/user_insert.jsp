<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우동마켓 - 회원가입</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style type="text/css">
	</style>
</head>
<body>
	<jsp:include page="../../top.jsp"></jsp:include>
	<div class="container-fluid">
		<form role="form" class="form-horizontal"
			action="userInsert" method="POST" name="myform">
			<fieldset>
				<div id="legend">
					<legend style="text-align: center;">회원가입</legend>
				</div>
				<h4>1. 로그인 정보</h4>
				<hr class="large">
				<!-- 아이디 -->
				<div class="form-group">
					<label class="control-label col-sm-3" for="orgcode">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="orgcode" style="width:300px;" name="user_id" placeholder="아이디"
							class="form-control" required>
					</div>
				</div>
				<div id="idInfo"></div>
				<hr class="middle">
				<!-- 패스워드-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="pass">패스워드</label>
					<div class="col-sm-3">
						<input type="text" id="pass" style="width:300px;" name="pass" placeholder="패스워드"
							class="form-control" minlength="4">
					</div>
				</div>
				<!-- 패스워드 확인-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="passChk">패스워드 확인</label>
					<div class="col-sm-3">
						<input type="text" id="pass" style="width:300px;" name="passChk" placeholder="패스워드 확인"
							class="form-control" minlength="4">
					</div>
					<br>
				</div>
				<br>
				<br>
				<h4>2. 개인 정보</h4>
				<hr class="large">
				<!-- 성명-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="orgname">성명</label>
					<div class="col-sm-3">
						<input type="text" id="orgname" style="width:300px;" name="user_nickname" placeholder="성명"
							class="form-control" minlength="4" required>
					</div>
				</div>
				<!-- 주소-->
				<div class="form-group">
					<label class="control-label col-sm-3" for="addr">주소</label>
					<div class="col-sm-3">
						<input type="text" id="addr" style="width:300px;" name="addr" placeholder="주소"
							class="form-control" minlength="4" required>
					</div>
				</div>
				<!-- Button -->
				<div class="form-group">
					<div class="col-sm-3"></div>
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="가입하기" class="btn btn-primary" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>