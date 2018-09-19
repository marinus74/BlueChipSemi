<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<c:set var="root" value="<%=request.getContextPath() %>"/> 
	</head> 
	<body>
		패스워드 틀렸다...다시 돌아가자 <br/>
<a href="${root}/shop/logout.do">다시 로그인 해주세요</a>
	</body>
</html>
