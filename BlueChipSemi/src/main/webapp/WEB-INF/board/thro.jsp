<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<style type="text/css">
			div#intro{
				align-content: center;
			}
		</style>
	</head> 
	 <body>
	 	<div id="intro">
			<c:set var = "root" value = "<%=request.getContextPath() %>"/>
			<img src = "${root}/shop/hugeso_bg.png" width="100%">
		</div>
	</body>
</html>