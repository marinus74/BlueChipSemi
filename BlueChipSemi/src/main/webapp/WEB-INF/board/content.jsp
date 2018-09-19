<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>글읽기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
table {
	width: 100%;
	border: 1px solid gray;
}

table tr td {
	border: 1px solid gray;
	font-size: 10pt;
}

table thead th {
	border: 1px solid gray;
	font-size: 10pt;
}

div#wapperall {
	margin: 0 auto;
	width: 100%;
	padding: 5%;
}

a{
	text-decoration: none;
}
</style>	
</head>
<body>
	<div id="wapperall" class="container">
		<table class="table table-bordered">
			<tr>
				<td width="20%">글쓴이 </td>
				<td width="79%">${dto.id}</td>
			</tr>
			<tr>
				<td>제목 </td>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<td>날짜 </td>
				<td>${dto.writeDate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content }</td>
			</tr>			
			<tr>
				<c:if test="${id !=null}">
					<td colspan="4" align="right">
						<c:if test="${id ==dto.id}">
							<input type="button" value="수정하기"	onclick="location.href='update.do?articleNum=${dto.articleNum}'">
							<input type="button" value="삭제하기"	onclick="location.href='delete.do?articleNum=${dto.articleNum}'">
						</c:if>
						<input type="button" value="목록으로" onclick="location.href='gongji.do'">
					</td>
				</c:if>

				<c:if test="${id ==null}">
					<td colspan="4" align="right">
					 <input type="button" value="수정하기" disabled="disabled">
					 <input type="button" value="삭제하기" disabled="disabled">
					 <input type="button" value="목록으로" onclick="location.href='gongji.do'">
					</td>
				</c:if>
			</tr>			
		</table>
</body>
</html>