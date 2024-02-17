<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
<script src="resources/js/HttpRequest.js"></script>
<script>

function send(f){
  
    //f.submit();
    let m_email = f.m_email.value;
    let ro_num =f.ro_num.value;
	let rev_num = f.rev_num.value;
	let content = f.content.value;
	let score = f.score.value;
	let content_reply = f.content_reply.value;
	let report = f.report.value;
	
    let url ="review";
    let param ="rev_num="+rev_num+
    			"&ro_num="+ro_num+
    			"&m_email="+m_email+
    			"&content="+content+
    			"&score="+score+
    			"&content_reply="+content_reply+
    			"&report="+report;
    
    sendRequest(url, param, resultFn, "get");
}

function resultFn() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        let data = xhr.responseText;
        let json = eval(data); // JSON 형식의 응답 데이터를 JavaScript 배열로 변환
           
            // 서버로부터 받은 데이터를 확인하여 팝업 창을 닫거나 다른 동작을 수행합니다.
            if (json[0].result == "success") {
                // 서버에서 처리가 성공했을 경우
                alert("등록이 완료되었습니다.");
                window.close(); // 팝업 창을 닫습니다.
            } else if (json[0].result == "fail") {
                // 서버에서 처리가 실패했을 경우
                alert("등록에 실패하였습니다.");
            }
        }
    }


</script>


</head>
<body>
<form name="f">
<c:forEach var ="dto" items="${list }">
		<input type="hidden" name="m_email" value="${dto.m_email }">
		<input type="hidden" name="content_reply" value="대댓글">
		<input type="hidden" name="report" value="신고중">
		<input type="hidden" name="rev_num" value="2">
		<input type="hidden" name="ro_num" value="0">
         <div align="center">
            <img src="resources/upload/${dto.filename }" width="300" height="200">
         </div>
         
         <div class="score space-x-4 mx-auto">
            <input type="radio" id="1-score" name="score" value="1" v-model="ratings" />
               <label for="1-score" class="score">★</label>
            <input type="radio" id="2-score" name="score" value="2" v-model="ratings"/>
               <label for="2-score" class="score">★</label>
            <input type="radio" id="3-score" name="score" value="3" v-model="ratings"/>
               <label for="3-score" class="score">★</label>
            <input type="radio" id="4-score" name="score" value="4" v-model="ratings"/>
               <label for="4-score" class="score">★</label>
            <input type="radio" id="5-score" name="score" value="5" v-model="ratings"/>
               <label for="5-score" class="score">★</label>   
         </div>
         
         <div class="content_box" align="center">
         <textarea row="5" cols="50" name="content" style=" margin-top:20px; resize:none; width:300px; height:200px;"wrap="on"></textarea>
         </div>
         
         <div align="center">
            <input type="button" value="리뷰 등록하기" onclick="send(this.form)">
         
         
         </div>
         </c:forEach>
 </form>
         