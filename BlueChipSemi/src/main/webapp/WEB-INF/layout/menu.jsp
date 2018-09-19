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
		<hr>
		<a href="${root}/main.do">Home_Home</a>
		&nbsp;&nbsp;&nbsp;
		<a href="${root}/shop/thro.do">사이트 소개</a>
		&nbsp;&nbsp;&nbsp;
		<a href="${root}/shop/list.do">휴게소 목록</a>
		<hr>
	</body>
</html>
