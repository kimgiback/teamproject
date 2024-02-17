<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 개인정보</title>
</head>
<body>
    <h2 align="center">나의 개인정보</h2>
    
    <%-- 회원 정보가 있는 경우에만 테이블로 출력 --%>
    <c:if test="${not empty info}">
        <table border="1" width="400" height="200" align="center">
            <tr>
                <th>이메일</th>
                <td>${info.m_email}</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>${info.m_pwd}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${info.m_name}</td>
            </tr>
            <tr>
                <th>휴대폰 번호</th>
                <td>${info.tel}</td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="button" value="수정하기" onclick="location.href='log_update'">
                    <input type="button" value="탈퇴하기" onclick="">
                </td>
            </tr>
        </table>
    </c:if>
</body>
</html>