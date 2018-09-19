<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>  
<head>
<meta charset="utf-8">
<title>게시판</title>
<c:set var="root" value="<%=request.getContextPath() %>"/> 
<link href="resources/style.css" rel="stylesheet" type="text/css">
<link href="resources/a.jpg" rel="shortcut icon">
<style type="text/css">

	div#gongiwrapper{
		margin-left: 3%;
		margin-right: 3%;	
	}
	
	div#subject{
		position:relative;
		float: left;
		font-size: 20pt;
		text-align: center;
		width:70%
	}
	
	div#loginStatus{
		position:relative;
		float:left;
		width:30%;
		font-size: 10pt;
	}
	div#gongibody{
		clear: both;
		marigin: 0 auto;
		font-size: 10pt;
		width: 100%;
	}
	
	table#gongitable th{
		text-align: center;
	}
	
</style>
</head>

<body>
<div id="gongiwrapper">
	<div>
		<div id="subject">
			<h2>공지사항</h2>
		</div>
 		<div id="loginStatus">
	 		<c:if test="${id!=null}">	 
	 			<%@include file="loginOk.jsp" %>
	 		</c:if>
			<c:if test="${id==null}">
	 			<%@include file="login.jsp" %>
	 		</c:if>
 		</div>
	</div>
 


	<div id="gongibody">
		<table id="gongitable" class="table table-bordered table-striped"> 
   			<tr height="30" > 
   				<th align="center"  width="10%" ><b>번  호</b></th> 
   				<th align="center"  width="50%" ><b>제  목</b></th> 
	   			<th align="center"  width="20%" ><b>작성자</b></th>
   				<th align="center"  width="20%" ><b>작성일</b></th>     
	    	</tr>
			<c:forEach var="article" items="${list}"><!-- list에 있는것을 a가 받음 -->
			<tr>
				<td align="center">${article.articleNum}</td>
				<td align="center"><a href="${root}/shop/content.do?articlenum=${article.articleNum}">${article.title}</a></td>
				<td align="right">${article.id}</td>
				<td align="right">${article.writeDate}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>