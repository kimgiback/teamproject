<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/css/header.css" />
<link rel="stylesheet" href="resources/css/index.css">
</head>
<body>
	

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<main>
		<section class="visual">
			<div class="row">
				<img src="resources/main_img/main1.webp" alt="">
			</div>
			<form action="search" method="post">
				<input name="" value="">
				<button>검색</button>
			</form>
		</section>

		<section class="category">
			<div class="container-xl">
				<h2 class="title">원하는 숙소를 찾아보세요</h2>
				<div class="row g-0">
					<div class="col">
						<a href="category?bu_id=1"> 
							<img src="resources/main_img/main_hotel.jpg" alt="">
							<span class="view">호텔</span>
						</a>
					</div>
					<div class="col">
						<a href="category?bu_id=2">
							<img src="resources/main_img/main_motel.webp" alt="">
							<span class="view">모텔</span>
						</a>
					</div>
					<div class="col">
						<a href="category?bu_id=3">
							<img src="resources/main_img/main_pension.webp" alt="">
							<span class="view">펜션</span>
						</a>
					</div>
					<div class="col">
						<a href="category?bu_id=4">
							<img src="resources/main_img/main_resort.jpg" alt="">
							<span class="view">리조트</span>	
						</a>
					</div>
				</div>
			</div>

		</section>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>