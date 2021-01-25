<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><!-- spring tag 사용 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function showData(){
			form1.submit();
			opener.document.frm.product_image.value = document.form1.file.value;
			close();
		}
	</script>
</head>
<body>
	<h2>* 파일 업로드/다운로드</h2>
	<form:form action="upload" enctype="multipart/form-data" name="form1" method="post">
	업로드할 파일 선택 : <br>
	<input type="file" name="file" size="200"><br>
	<form:errors path="file" cssStyle="color:red" />
	<input type="submit" value="전송">
	<input type="button" value="전송" onclick="showData()">
	</form:form>
</body>
</html>