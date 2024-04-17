<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common.css" type ="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	input[name="id"]{
		width :70%;
	}
</style>
</head>
<body>
	<h3>회원가입</h3>
	
	<hr/>
	<form action="join" method = "post">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="id"/>
					<input type="button" value="중복체크" onclick="overlay()" />
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw"/></td>
			</tr>
			<tr>
				<th>관리자여부</th>
				<td><input type = "checkbox"  name ="auth" >관리자 여부</td>			
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>AGE</th>
				<td><input type="text" name="age"/></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>
					<input type="radio" name="gender" value="남"/>남자
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여"/>여자
				</td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td><input type="text" name="email"/></td>
			</tr>
			<tr>
				<th colspan="2"><button>회원가입</button></th>
			</tr>
		</table>
	</form>
	${msg}
</body>
<script>
	var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
	if(msg != ''){
		alert(msg);
	}
	
	function overlay(){
		var id =$('input[name="id"]').val();
		// ajax 를 이용한 비동기 통신
		$.ajax({
			type:'post',            //metjod 방식
			url:'overlay.do',          //요청할 주소
			data:{'id':id},             // 파라메터
			success:function(data){ //통신 성공시
				console.log(data);
			// ajax에서 XmlHttpRequest 객체를 통해 대신 받아와서
			// 여기에 뿌려줌
			if(data.use >0){
				alert('이미 사용중인 아이디 입니다.');
				var id =$('input[name="id"]').val();
			}else{
			 alert('사용가능한 아이디 입니다.');	
			}
			},
			error:function(error){
				console.log(error);	
			}
		});
	}
	
</script>
</html>