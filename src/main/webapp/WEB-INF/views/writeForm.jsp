<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"href="resources/common.css"type="text/css">
<style>
</style>
</head>
<body>
	<!-- post 방식으로 보낼것, form-data 가 여러 파트로 구성되어 있다고 알릴것 -->
	<form action="write.do" method = "post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목</th>
			<td><input type ="text" name = "subject" value="${member.subject}"/></td>
		</tr>	
		<tr>
			<th>작성자</th>
			<td>${sessionScope.loginId}<input type ="hidden" name = "user_name" value="${sessionScope.loginId}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name = "content">${member.content}</textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="photos" multiple="multiple"/></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type= button onclick="location.href='./list'" value="취소"/>
				<button>저장</button>
			</th>
		</tr>
	</table>
	</form>
</body>
<script>
</script>
</html>