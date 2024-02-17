<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
h2{
   margin-top: 150px;
}
table{ border-collapse:collapse;
      margin-top: 50px;
}



</style>

<script type="text/javascript">
function modify(f) {
	let m_email = document.getElementsByName("m_email")[0].value;
	let m_pwd = document.getElementsByName("m_pwd")[0].value;
	let m_name = document.getElementsByName("m_name")[0].value;
	let m_tel = document.getElementsByName("m_tel")[0].value;
	
	if(m_email =='') {
		alert("이메일을 입력해주세요")
		return;
	}
	if(m_pwd =='') {
		alert("비밀번호를 입력해주세요")
		return;
	}
	if(m_name =='') {
		alert("이름을 입력해주세요")
		return;
	}
	if(m_tel =='') {
		alert("전화번호를 입력해주세요")
		return;
	}
	
	f.action = "modify";
	f.method = "post";
	f.submit();
}




</script>

</head>
<body>
<form>
   <table border="1" width="400" height="200" align="center" >
   <tr>
   <h2 align="center">개인정보 변경하기</h2>
   </tr>
   
   
   <tr>   
      <th>이메일</th>
      <td><input name="m_email">${dto.m_email }</td>
      <td><input type="hidden" name="m_email" value="${dto.email }">
   </tr>
   <tr>   
      <th>비밀번호</th>
      <td><input name="m_pwd" type="password">${dto.m_pwd }</td>
      
   </tr>   
   <tr>
      <th>이름</th>
      <td><input name="m_name">${dto.m_name }</td>
   </tr>
   <tr>
      <th>휴대폰 번호</th>
      <td><input name="m_tel" >${dto.m_tel }</td>
   </tr>   
   <tr>
      <td colspan="2" align="right">
         <input type="button" value="수정하기" onclick="modify(this.form)">
      </td>
   </tr>      
   </table>
  </form>
</body>
</html>