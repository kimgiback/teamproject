<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="dto" items="${list}">
		<div align="center" id="">
			<img src="resources/room_img/room1.jpg" align="left">
			<h2 id="roomName" align="center">${dto.ro_name}</h2>
			<p align="center">이용인원 : ${dto.ro_count}</p>
			<h2 align="center">${dto.ro_price}</h2>
		</div>
	</c:forEach>




</body>
</html>