<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	#roomList{
		border: solid 1px green;
		width: 600px;
		height: 183px;
		margin: auto;
		margin-top: 30px;
	}
	p{
		margin: 0px;
	}
	
	img{
		width: 275px;
		height: 183px;
	}
	
	
</style>
<script type="text/javascript">	

	function detail(f){
		f.action = "detail";
		f.method = "post";
		f.submit();
	}	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	
	<c:forEach var="dto" items="${list}">
	<form action="modify_form" action="post">
	<div align="center" id="roomList">
		<input type="hidden" name="ro_num" value="${dto.ro_num}">
		<input type="hidden" name="ro_name" value="${dto.ro_name}">
		<img src="resources/room_img/${dto.ro_name}/${dto.ro_picture}" align="left">
		<p align="right">
			<input type="button" value="상세보기" onclick="detail(this.form)">
		</p>
		<h2 id="roomName" align="center" style="margin: 0px;">${dto.ro_name}</h2>
		<p align="center">이용인원 : ${dto.ro_count}</p>
		<p align="center"  >체크인시간 : ${dto.checkin}</p>
		<p align="center">체크아웃시간 : ${dto.checkout}</p>
		<h2 align="center" style="margin-top:5px;">${dto.ro_price}원</h2>
	</div>
	</form>
	</c:forEach>
</body>
</html>