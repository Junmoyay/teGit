<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type ="text/css">
<style>
</style>
</head>
<body>
	${loginBox}

	<a href="./list">리스트 보기</a>
<table>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>이메일</th>
		<th>삭제</th>		
	</tr>
	<c:if test = "${list.size()<1}">
		<tr><td colspan="5">회원이 없습니다.</td></tr>
	</c:if>
	<c:forEach items="${list}" var="member">
		<tr>
			<td>${member.id}</td>
			<td><a href="member_detail?id=${member.id}">${member.name}</a></td>
			<td>${member.gender}</td>
			<td>${member.email}</td>	
			<td><a href="member_del?id=${bbs.id}">삭제</a></td>
		</tr>
	</c:forEach>
</table>
</body>
<script>
	var msg ='${msg}';
	if(msg != ''){
		alert(msg);
	}
</script>
</html>