<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 페이지</title>
</head>
<body>
<form action="/mypage/test?${_csrf.parameterName }=${_csrf.token}" method="post">
<input type="password" name="memberPw"  id="memberPw" value="member" />

<input type="submit" value="인증 완료"/>
<sec:csrfInput/>
</form>
</body>
</html>