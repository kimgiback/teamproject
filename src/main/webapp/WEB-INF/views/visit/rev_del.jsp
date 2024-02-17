<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 팝업창</title>
<script src="resources/js/HttpRequest.js"></script>
<style type="text/css">
    table {
            width: 300px;
            border-collapse: collapse; 
        }

        table, th, td {
            border: 1px solid black; 
        }

        th, td {
            padding: 8px; 
            text-align: center; 
        }


</style>

<script type="text/javascript">


	function del() {
		let m_email = document.getElementsByName("m_email")[0].value;
		
	if(!confirm('취소하시겠습니까?')){
			return;
		}
	
		 
		let url ="visit_view";
		let param = m_email;
		sendRequest(url, param, delCheck, "post");
			
		}
	
	function delCheck() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			let data = xhr.responseText;
			
			let json = (new Function('return'+data))();
			if(json[0].res == 'no'){
				alert("삭제 실패");
				return;

			} else {
				alert("삭제 성공");
				
				location.href="rev_list";
				window.close();
			}
		}
	}	
	
	

	
	
</script>
</head>
<body>
<form>
         <div align="center">대충 로고랑 숙박업체 들어갈 예정</div>
         <div align="center">대충 숙소 사이즈 들어갈 예정 안들어갈 수도?</div>
         <hr>
         <p align="left">객실 기본정보</p>
      
      <table border="1">
      <c:forEach var ="dto" items="${list }">
      <input type="hidden" name="m_email" value="${dto.m_email}">
      <tr>
         <td colspan="2">체크인</td>
         <td> ${dto.checkin_date }</td>
      </tr>
      <tr>      
         <td colspan="2">체크아웃</td>
         <td> ${dto.checkout_date }</td>   
      </tr>
      <tr>   
         <td colspan="2">예약번호</td>
         <td>${dto.re_num }</td>   
      </tr>
      <tr>   
         <td colspan="2">예약자이름</td>
         <td>김철수(바꿔야 함)</td>
      </tr>
      <tr>
         <td colspan="2">전화번호</td>
         <td>010-111-2222(바꿔야 함)</td>   
      </tr>
      </c:forEach>
      </table>
      <p align="left">결제 정보</p>
      <table border="1">
      <c:forEach var ="dto" items="${list }">
      <tr>
         <td colspan="2">결제수단</td>
         <td> ${dto.payment }</td>
      </tr>
      <tr>
         <td colspan="2">환불금액</td>
         <td> ${dto.price }</td>
      </tr>
      <tr>
      <td><input type="button" value="예약 취소하기" onclick="del()"></td>
      </tr>
      </c:forEach>
      </table>
   </form>
</body>
</html>