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
        *{ margin:0; padding: 0;}
        li{ list-style:none; color:black;}
        ul{ width:150px; margin-left: 20px; }
        
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
    </style>
    
    <script>

   function popup() {
      window.open("popup","예약정보","width=400, height=600, left=100, top=50");
   }
   
   function rev_del() {
	   window.open("del","예약취소","width=400, height=600, left=100, top=50");
	   }


</script>
</head>
<body>

<div id="box">
    <div style=" align-items: center;">
        <ul>
            <li style="padding-top:75px;"><input type="button" value="예약내역" style="width:150px; height:50px;"onclick="location.href='rev_info'"></li>
            <li><input type="button" value="내정보관리" style="width:150px; height:50px;" onclick="location.href='my_info'"></li>
            <li><input type="button" value="내가 작성한리뷰" style="width:150px; height:50px;" onclick="location.href='MyReview'"></li>
            <li><input type="button" value="찜한숙소" style="width:150px; height:50px;" onclick="location.href='zzim'"></li>
        </ul>
    </div>
     
     <div id="button" align="center">
        <input type="button" style="width:172px; height:50px;" class="div2" value="예약 완료" onclick="location.href='rev_list'"  >
        <input type="button" style="width:172px; height:50px;" class="div2" value="예약 취소" onclick="location.href='rev_del'" >
        <input type="button" style="width:172px; height:50px;" class="div2" value="이용 완료" onclick="location.href='usingwon'" >
    </div>
    <form>
    <c:forEach var="dto" items="${list }">
    <div id="photo_box">
            <div class="photo_type">
                <img src="${dto.filename }" width="300" height="200">
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
           </c:forEach>  
          
              <tr>
                 <td align="center">
                    <input type="button" value="예약 정보" onclick="popup()">
                 </td>
              </tr>   
        </table>
    </div>
     </form> 
</div>

</body>
</html> 