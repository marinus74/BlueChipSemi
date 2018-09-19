<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>수정하기</title>
<c:set var="root" value="<%=request.getContextPath() %>"/> 
</head>
<body>
<script type="text/javascript">
function goBack(){
	window.history.back();
}
</script>
<div class="container">
	<form action="${root}/shop/update2.do" method="post">
		<input type="hidden" name="articleNum" value="${dto.articleNum}">
	<%-- 	<input type="hidden" name="pageNum" value="${pageNum}"> --%>
		<table class="table table-bordered" style="margin:0 auto;font-size: 10pt;">
			<tr>
				<td width="30%">글쓴이 :</td>
				<td width="70%">${id}</td>
			</tr>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" value="${dto.title}"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="50" rows="20" name="content" style="width: 100%;">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"></td>
				<td><input type="button" value="수정하기 취소" onclick="goBack();"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>












