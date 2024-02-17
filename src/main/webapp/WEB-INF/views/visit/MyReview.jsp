<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>

<style>
 .score {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 7em;
  margin: 0 auto;
}
 
.score input {
  display: none;
}
 
.score label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.score :checked ~ label {
  -webkit-text-fill-color: gold;
}
</style>
<script type="text/javascript">
/* function send(f){
  
    //f.submit();
    let ro_num = f.ro_num.value;
    let m_email = f.m_email.value;
	let rev_num = f.rev_num.value;
	let content = f.content.value;
	let score = f.score.value;
	let content_reply = f.content_reply.value;
	let report = f.report.value;
	
    let url ="/MyreviewInsert";
    let param ={
    	ro_num : ro_num,
    	rev_num:rev_num,
    	m_email : m_email,
		content : content,
		score :score,
		content_reply :content_reply,
		report :report
    }	
    	
    
    fetch(url,{
    	method:'POST',
    	header:{
    		"Content-Type" : "application/json"
    	},
    	body: JSON.stringify(param)
    }).then(response=> resultFn(response))
    
    
    //sendRequest(url, param, resultFn, "post");
} */
/* 
function resultFn(data) {
		console.log(data);
        //let data = xhr.responseText;
        let json = eval(data); // JSON 형식의 응답 데이터를 JavaScript 배열로 변환
           
            // 서버로부터 받은 데이터를 확인하여 팝업 창을 닫거나 다른 동작을 수행합니다.
            if (json[0].result == "success") {
                // 서버에서 처리가 성공했을 경우
                alert("등록이 완료되었습니다.");
              
            } else if (json[0].result == "fail") {
                // 서버에서 처리가 실패했을 경우
                alert("등록에 실패하였습니다.");
            }
    } */
</script>

</head>
<body>


<h1>리뷰</h1>
<form name="f">

<div style=" align-items: center;">
        <ul>
            <li style="padding-top:75px;"><input type="button" value="예약내역" style="width:150px; height:50px;"onclick="location.href='rev_info'"></li>
            <li><input type="button" value="내정보관리" style="width:150px; height:50px;" onclick="location.href='my_info'"></li>
            <li><input type="button" value="내가 작성한리뷰" style="width:150px; height:50px;" onclick="location.href='MyReview'"></li>
            <li><input type="button" value="찜한숙소" style="width:150px; height:50px;" onclick="location.href='zzim'"></li>
        </ul>
    </div>
<c:if test="${not empty info}">
<c:forEach var ="dto" items="${list }">
		<input type="hidden" name="ro_num" value="${dto.ro_num }">
		<input type="hidden" name="m_email" value="${dto.m_email }">
		<input type="hidden" name="content_reply" value="${dto.content_reply }">
		<input type="hidden" name="report" value="${dto.report }">
		<input type="hidden" name="rev_num" value="${dto.rev_num }">
		
		
         <table border="1" align="left">
         	<tr>
         		<th>숙박업체이름(누르면 갈수도있게끔)</th>
         		<th>작성자이름</th>
         		<th>별점</th>
         		<th>작성시간</th>
         		<th>리뷰내용</th>
         	</tr>
         	<tr>
         	<td>${dto.ro_num }</td>
         	<td>${dto.m_name }</td>
         	<td>
         		<div class="score space-x-4 mx-auto">
    				<c:if test="${dto.score == 1 }">
    				★
    				</c:if>
    				<c:if test="${dto.score == 2 }">
    				★★
    				</c:if>
    				<c:if test="${dto.score == 3 }">
    				★★★
    				</c:if>
    				<c:if test="${dto.score == 4 }">
    				★★★★
    				</c:if>
    				<c:if test="${dto.score == 5 }">
    				★★★★★
    				</c:if>
				</div>
			</td>
         	<td>${dto.regidate }</td>
         	<td>${dto.content }</td>
         </tr>
         </c:forEach>
         </table>
 </c:if> 
 </form>
         
</body>
</html>