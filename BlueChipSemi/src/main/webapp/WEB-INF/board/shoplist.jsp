<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<c:set var="root" value="<%=request.getContextPath() %>"/>
		<style type = "text/css">
			table{border: 3px solid gray; font-size: 10pt;}
			tr,td,th{border:1px dotted gray;}
		</style>
	</head> 
	<body>
		<c:if test = "${totalCount==0}">
			<b>저장된 휴게소 정보가 없습니다.</b>
		</c:if>
		<c:if test = "${totalCount>0}">
			<b>총  ${totalCount}개의 휴게소가 저장되어 있습니다.</b>
		</c:if>
		<hr>
		<div class="container">
		<table class="table table-striped table-hover table-bordered">
			<caption>
			<b>휴게소 목록</b>
			</caption>
			<tr align="center">
				<th style="width: 10%; text-align: center;">번호</th>
				<th style="width: 30%; text-align: center;">휴게소</th>
				<th style="width: 10%; text-align: center;">노선번호</th>
				<th style="width: 20%; text-align: center;">노선명</th>
				<th style="width: 30%; text-align: center;">전화번호</th>
			</tr>
			<c:forEach var="a" items="${list}" varStatus="i">
				<tr>

					<td align = "center">${a.hugenum}</td>
					<td align = "center"><a href="${root}/shop/list2.do?hugeirum=${a.irum}&commentirum=${a.irum}&irum=${a.irum}&pageNum=${pageNum}">${a.irum}</a></td>
					<td align = "center">${a.nosun}</td>
					<td align = "center">${a.noirum}</td>
					<td align = "center">${a.tel}</td>
				</tr>
			</c:forEach>
				
			
		</table>
		
	</div>
	
	<div class="text-center" style="width:100%; text-align:center;">
		<ul class="pagination">
			<c:if test="${startPage > 1}"> <!-- 첫페이지가 1보다 크면 1페이지가 아니니까 이전버튼 활성화 -->
			<li><a href="list.do?pageNum=${startPage-1}">[이전]</a></li> 
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li><a href="list.do?pageNum=${i}">${i}</a></li>
			</c:forEach> 
			<c:if test="${endPage < totalPage}"> 
			<li><a href="list.do?pageNum=${endPage+1}">[다음]</a></li>
			</c:if>  
		</ul>
	</div>	
	</body>
</html>
