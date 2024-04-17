<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type ="text/css">
<style>
</style>
</head>
<body>
	게시판 리스트
	<hr/>
	<button onclick="del()">선택 삭제</button>
<table>
	<thead>
	<tr>
		<th><input type="checkbox" id="all"/></th>		
		<th>글번호</th>
		<th>이미지</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	</thead>
	<tbody id= "list">
		
	</tbody>
	<%--<c:forEach items="${list}" var="item">
		<tr>
			<td><input type="checkbox" name = "del"  value="${item}"/></td>
			<td>${item.idx}</td>
			<td>
			<c:if test="${item.img_cnt>0}"><img class = "icon" src="resources/img/image.png"/></c:if>
			<c:if test="${item.img_cnt==0}"><img class="icon" src="resources/img/no_image.png"/></c:if>
			</td>
			<td>${item.subject}</td>
			<td>${item.user_name}</td>
			<td>${item.bHit}</td>
			<td>${item.reg_date}</td>
		</tr>
	</c:forEach> --%>
</table>
</body>
<script>
// 	$(document).ready(funtion(){    //ready = html 문서가 모두 읽히고나면(준비되면) 다음 내용을 실행 해라
// 		listCall();
// 	});

listCall();
	function del(){    // 체크 표시된 값을 delArr 에 담기.
		var delArr = [];
	$('input[name="del"]').each(function(idx,item){
		if($(item).is(":checked")){
			var val = $(this).val();
			delArr.push(val);
		}
	});
	console.log('delArr :',delArr);
	$.ajax({
		type:'post',
		url:'./del',
		data:{delList:delArr},
		dataType:'JSON',
		success:function(data){
			if(data.cnt > 0){
				alert('선택한'+data.cnt+'개의 글이 삭제되었습니다.');
				$('#list').empty();
			}
		},
		error:function(error){
			console.log(error);
		}
	})
	}

	var msg ='${msg}';
	if(msg != ''){
		alert(msg);
	}
	
	function listCall(){
		$.ajax({
			type:'get',
			url:'./list.do',
			data:{},
			dataType:'json',
		success:function(data){
			drawList(data.list);
		},error:function(error){
			console.log(error);
		}
		});
		
	}

		
		function drawList(list){
			var content ='';
			for(item of list){
				//console.log(item);
				content +='<tr>';
				content +='<td><input type="checkbox" name = "del"  value="'+item.idx+'"/></td>';
				content +='<td>'+item.idx+'</td>';
				content +='<td>';
				
				var img = item.img_cnt > 0 ? 'image.png' : 'no_image.png';				
				content +='<img class = "icon" src="resources/img/'+img+'"/>';

				content +='</td>';
				content +='<td>'+item.subject+'</td>';
				content +='<td>'+item.user_name+'</td>';
				content +='<td>'+item.bHit+'</td>';
				//java.sql Date 는 javascript 에서는 밀리세컨드로 변환하여 표시한다.
				// 방법 1. Back-end : [BoardDTO 의 반환 날짜 타입을 문자열로 변경]
								
				// 방법 2. Fornt-end js에서 직접 변환
				var date = new Date(item.reg_date);
				var dateStr = date.toLocaleDateString("ko-KR"); // 한국 
				//var dateStr = date.toLocaleDateString("en-US"); // en-us							
				content +='<td>'+dateStr+'</td>';		
				content +='</tr>';
			}			
			$('#list').html(content);
		
		}
		

	$('#all').on('click',function(){
		
		var $chk = $('input[name="del"]');

		
		// attr : 정적 속성 : 처음부터 그려져 있거나 jsp에서 그린 내용
		// prop : 동적 속성 : 자바스크립트로 나중에 그려진 내용
		if($(this).is(":checked")){
			$chk.attr('checked',true);	
		}else{
			$chk.attr('checked',false);
		};
		
		
	})
		
</script>
</html>