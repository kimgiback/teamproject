<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#reviewBox{
		width: 800px;
		height: 200px;
		margin: auto;
		margin-top: 20px;
	}
	#reviewStar{
		margin-left: 5px;
		margin-top: 5px;
		display: flex;
	}
	
	h3{
		margin-top: 0px;
		margin-left: 5px;
		margin-bottom: 5px;
	}
	
	hr{
		margin-bottom: 0px;
		margin-top: 0px;
	}
	
	#date{
		margin-top: 5px;
		margin-bottom: 0px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	
	<div id="reviewBox" align="center">
		<hr>
		<div align="left" id="review">
			<p align="right" id="date">작성 날짜</p>
			<h3 style="display: inline;" align="left">리뷰</h3>
			<p id="reviewStar" align="left">*****</p>
			<p>작성자 - 객실 정보...</p>
		</div>	
	</div>
	
</body>
</html>