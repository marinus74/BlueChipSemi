<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<title>글쓰기</title>
</head>
<body>
<script type="text/javascript">
function goBack(){
	window.history.back();
}
</script>

<div class="container">
<form action="write.do" method="post">		
	<table class="table table-bordered" style="font-size: 10pt">  
		<tr>
 			 <td width="30%">글쓴이 :</td>
 			 <td width="70%" align="left">${id}</td>
 		</tr>
 		<tr>	 
		 <td>제목 : </td>
		 <td colspan="2" align="left"><input type="text" name="title"></td>			 
		</tr>
		<tr>
		  <td colspan="2">
		  <pre><textarea name="content" rows="10" cols="60" style="width: 100%"></textarea>
		  </pre>
		  </td>
	    </tr>	
	    <tr>
	      <td colspan="2">
	      	<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<input type="reset" value="글쓰기취소">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<input type="button" value="목록" onclick="goBack();">
	      </td>      	 
	    </tr>		
	</table> 		
</form>
</div>

</body>
</html>
