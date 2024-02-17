<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="resources/js/HttpRequest.js"></script>
<script src="https://kit.fontawesome.com/6c6e52b436.js" crossorigin="anonymous"></script>
    <style>
    <style>
        *{ margin:0; padding: 0;}
        li{ list-style:none; color:black;}
        ul{ width:150px; margin-left: 20px; }
        li a{    
            display:block;
            font-size: 19px;
            background:none;
            text-decoration: none;
            color:black;
        }
        #photo_box{ 
            margin:15px auto;
            width:500px;
            height:250px;
            border:1px solid black;
            padding:10px;
            overflow:auto; 
            position: relative;
            border-collapse:collapse;
        }
        .photo_type{ 
            width:300px;
            height:200px;
            border:1px solid green;
            float:left;
            margin:10px;
            position: relative;
        }       
         
         .div2 { 
            width:170px; 
            height:50px;
            margin-right:-6px;
            border-collapse:collapse;
            margin-bottom: -30px;
            
        }
        table,tr,td{
       
       position: relative;
           top: 3px;
        border:none;
        padding:4px;
        }
        .photo_type .zzim {
        
        position: absolute;
        top: 10px;
        left : 255px;
        width :28px;
        border:none;
        }
          
          .box .zzim_lodging {
           position: relative;
           top: 10px;
           left : 270px;
          }
          
          .heart-button {
      position: absolute;
      top: 10px;
      right: 10px;
      background: none;
      border: none;
      cursor: pointer;
    }
    </style>

    
    <script type="text/javascript">
   function send(f) {
      f.action = "upload";
      f.submit();
      
   }
   
   function usingwon() {
	   window.open("usingwon","리뷰남기기","width=400, height=600, left=100, top=50");
   }

   function wish(f) {
	 	let zzim_num = f.zzim_num.value;
	    let m_email = f.m_email.value;
		let ro_num = f.ro_num.value;
		let bu_email = f.bu_email.value;
		
		
	    let url ="wish";
	    let param ="m_email="+m_email+
	    			"zzim_num="+zzim_num+
	    			"&ro_num="+ro_num+
	    			"&bu_email="+bu_email;
	    			
	    
	    sendRequest(url, param, resultFn, "get");
	   
  }
  
  function resultFn() {
	   if (xhr.readyState == 4 && xhr.status == 200) {
	        let data = xhr.responseText;
	        let json = eval(data); // JSON 형식의 응답 데이터를 JavaScript 배열로 변환
	           
	            // 서버로부터 받은 데이터를 확인하여 팝업 창을 닫거나 다른 동작을 수행합니다.
	        if (json[0].result == "1") {
	            alert("찜에 성공하셨습니다.");
	            document.querySelector('.heart-button i').classList.remove('fa-regular');
	            document.querySelector('.heart-button i').classList.add('fa-solid');
	        } else if (json[0].result == "0") {
	            alert("찜을 취소하셨습니다.");
	            document.querySelector('.heart-button i').classList.remove('fa-solid');
	            document.querySelector('.heart-button i').classList.add('fa-regular');
	        } else if(json[0].result == "2") {
	        	alert("로그인을 해주시기 바랍니다.")
	        	return;
	        }
	    }
	    }	   

   
</script>
</head>
<body>


   <form>
<div id="box">
    <div style=" align-items: center;">
        <ul>
             <li style="padding-top:75px;"><input type="button" value="예약내역" style="width:150px; height:50px;"onclick="location.href='rev_info'"></li>
            <li><input type="button" value="내정보관리" style="width:150px; height:50px;" onclick="location.href='my_info'"></li>
            <li><input type="button" value="내가 작성한리뷰" style="width:150px; height:50px;" onclick="location.href='MyReview'"></li>
            <li><input type="button" value="찜한숙소" style="width:150px; height:50px;" onclick="location.href='zzim'"></li>
        </ul>
    </div>
   
     
  <c:if test="${m_email == null}">
  
  </c:if>
  
  <c:if test="${m_email != null }">
  <div id="photo_box">
        <c:forEach var="dto" items="${list }">
            <div class="photo_type">
                <img src="${dto.filename }" width="300" height="200">  
                <div>
        			<button type="button" class="heart-button" onclick="wish(this.form)">
    					<i class="fa
        					<c:choose>
            					<c:when test="${not empty dto.zzim_num}">
               						 fa-regular
           				 		</c:when>
          						<c:otherwise>
              						fa-solid
          						</c:otherwise>
        					</c:choose>
    					fa-heart"></i>
					</button>
     			<input type="hidden" name="m_email" value="${dto.m_email }">
     			<input type="hidden" name="ro_num" value="${dto.ro_num }">
     			<input type="hidden" name="bu_email" value="${dto.bu_email }">
     			<input type="hidden" name="zzim_num" value="${dto.zzim_num }">
     		
    			</div>  
            </div>  
        	<table border="1" width="170" >
    
              <tr>
                 <td>${dto.bu_title }</td>
              </tr>
              <tr>   
                 <td>숙소 사이즈</td>
              </tr>
              <tr>
                 <td>${dto.checkin_date }~${dto.checkout_date }</td>
              </tr>
              <tr>
                 <td>${dto.price }</td>
              </tr>
              <tr>
                 <td>${dto.payment }</td>
              </tr>
            
              <tr>
                 <td colspan="2" align="center">
                    <input type="button" value="숙소 정보" onclick="">
                    <input type="button" value="후기 보기 " onclick="location.href='usingwon'">
                 </td>
              </tr>    
        </table>
       </c:forEach>
    </div>
  
  </c:if>
    
</div>
     </form> 
</body>
</html>