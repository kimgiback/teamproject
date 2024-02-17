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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />
<link rel="stylesheet" href="resources/css/header.css" />
</head>
<body>


	<header class="header">
		<div class="container g-0">
			<div class="row d-flex justify-content-between">
				<div class="col d-flex align-items-center">
					<h1 class="logo">
						<a href="index">여행갈래?</a>
					</h1>
				</div>
				<div class="info col d-flex justify-content-end">
					<ul class="gnb d-flex align-items-center">
						<li><a href="">지도검색</a></li>
						<li><a href="rev_list">예약내역</a></li>

						<c:choose>
							<c:when test="${empty m_email}">
								<li><a href="login_form">로그인<i class="bi bi-person-circle"></i></a></li>
							</c:when>
							<c:otherwise>
								<input type="button" value="로그아웃"
									onclick="location.href='logout'">
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>