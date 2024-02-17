<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function checkin(n){
		if(!confirm("예약번호 "+n+"의 예약 상태를 변경하시겠습니까?")){
			return;
		}
		
		var url ="checkIn";
		var param = "num="+n;
		
		sendRequest(url,param,CheckIn_Check,"post");
	}
	
	function CheckIn_Check(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = (new Function('return' + data))();
			
			if(json[0].result == 'yes'){
				alert("변경 성공")
				location.href='checkIn_form';
			} else {
				alert('변경 실패')
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	
	<div id="b_checkin" style="display: inline-block;" align="center">
	<h1>입실 전</h1>
	<table border="1" style="display: inline-block;" >
		  <tr>
		    <th>객실</th>
		    <th>이용인원수</th>
		    <th>체크인</th>
		    <th>체크아웃</th>
		    <th>핸드폰번호</th>
		    <th>Email</th>
		    <th>예약상태</th>
		  </tr>
		  <c:forEach items="${list}" var="dto">
		  <c:if test="${dto.status ne '입실완료' && dto.status ne '이용완료'}">
		  	<tr>
			    <td>${dto.ro_name}</td>
			    <td>${dto.re_people}</td>
			    <td>${dto.checkin_date}</td>
			    <td>${dto.checkout_date}</td>
			    <td>${dto.m_tel}</td>
			    <td>${dto.m_email}</td>
			    <td><input type="button" value="체크 인" onclick="checkin(${dto.re_num})"></td>
			  </tr>
		  </c:if>			  
		  </c:forEach>
		</table>
	</div>
		
	<div id="a_checkin" style="display: inline-block;" align="center">
	<h1>입실 후</h1>
	<table border="1" style="display: inline-block;">
		<tr>
			<th>객실</th>
		    <th>이용인원수</th>
		    <th>체크인</th>
		    <th>체크아웃</th>
		    <th>핸드폰번호</th>
		    <th>Email</th>
		    <th>예약상태</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<c:if test="${dto.status eq '입실완료'}">
		  	<tr>
			    <td>${dto.ro_name}</td>
			    <td>${dto.re_people}</td>
			    <td>${dto.checkin_date}</td>
			    <td>${dto.checkout_date}</td>
			    <td>${dto.m_tel}</td>
			    <td>${dto.m_email}</td>
			    <td>${dto.status}</td>
			  </tr>
		  </c:if>
		</c:forEach>
	</table>
	</div>
</body>
</html>