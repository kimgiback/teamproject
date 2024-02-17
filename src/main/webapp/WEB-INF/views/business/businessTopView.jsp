<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function clicked(n){
			
		}
	</script>
</head>
<body>
	<div align="center">
		<input type="button" value="객실등록" onclick="location.href='addRoom_form'">
		<input type="button" value="객실정보" onclick="location.href='roomList_form'">
		<input type="button" value="예약확인" onclick="location.href='reservation_form'">
		<input type="button" value="체크인" onclick="location.href='checkIn_form'">
		<input type="button" value="체크아웃" onclick="location.href='checkOut_form'">
		<input type="button" value="리뷰" onclick="location.href='review_form'">
	</div>	
</body>
</html>