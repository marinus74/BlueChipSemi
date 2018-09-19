<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<c:set var="root" value="<%=request.getContextPath() %>"/> 
		<style type="text/css">
			div#loginOK{
				text-align: center;
				width: 100%;
				height: 100%;
				font-size: 10pt;
			}
		</style>
	</head> 
	<body>
	<div id="loginOK">
		<table id="logintalbe" class="table">
			<tr>
				<td>
					<form action="${root}/shop/logout.do" method="post">		 
					${id}님...환영합니다 <button id="logout">로그아웃</button>
					</form>
				</td>
			</tr>
			<tr>
    			<td align="center" >
       				<a href="${root}/shop/writeForm.do">글쓰기</a>
    			</td>
  			</tr>
		</table>
	</div>
</body>
</html>
