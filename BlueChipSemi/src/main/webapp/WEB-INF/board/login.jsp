<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<title>로그인</title>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<style type="text/css">
div#login{
	width: 100%;
	height: 100%;
	font-size: 10pt;
}

</style>

</head>
<body>
	<div id="login">
		<form action="${root}/shop/gongjiprocess.do" method="post" id="loginform">
			<table class="table table-sm">
				<tr>
					<td>
						I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D :
					</td>
					<td>
						<input type="text" name="id" id="id" size="20px">
					</td>
				</tr>
				<tr>
					<td>
						PASS :
					</td>
					<td>
						<input type="text" name="pass" id="pass" size="20px">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인">&nbsp;<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
	$(function(){
		$("input[type=submit]").on("click",function(){
			let id = $("#id").val().trim();			
			let pass = $("#pass").val().trim();
			if(id ==null || id.length==0){
				alert("아이디를 입력하세요");
				return false;
			}
			
// 			if(pass ==null || pass.length==0 || pass.length <8){
// 				alert("패스워드가 입력되지 않았거나 정책에 어긋납니다");
// 				return false;
// 			}

			if(pass ==null || pass.length==0){
				alert("패스워드가 입력되지 않았거나 정책에 어긋납니다");
				return false;
			}
			return true;
		});
		
		
	});
	
</script>
</body>
</html>