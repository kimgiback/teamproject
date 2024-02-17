<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/header.css" />
<style type="text/css">
#roomList {
	border: solid 1px green;
	width: 600px;
	height: 183px;
	margin: auto;
	margin-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<c:forEach var="dto" items="${list}">
		<form action="room_view" method="post">
			<input type="hidden" name ="bu_email" value ="${dto.bu_email}">
			<%-- <a href = "room_view?bu_email=${dto.bu_email}">테스트 해보기</a> --%>
			<!-- <button>테스트 해보기2</button> -->
			<button>
			<div align="center" id="">
				<img src="resources/room_img/room1.jpg" align="left">
				<h2 id="roomName" align="center">${dto.bu_title}</h2>
				<p align="center">이용인원 : 3</p>
				<h2 align="center">30,000원</h2>
			</div>
			</button>
		</form>
	</c:forEach>




</body>
</html>