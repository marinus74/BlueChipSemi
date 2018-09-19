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
		table{border: 0px solid gray; font-size: 10pt;}
		tr,td,th{border:0px dotted gray;}
		div#comment{
			width: 100%;
			align-items: center;
		}
		th{
			text-align: center;
		}
	</style>
	<script type="text/javascript">
	function validSubmit(){
		if (document.commentform.commentcontent.value == ""){
			alert ( "내용을 입력해 주세요" );
			document.commentform.commentcontent.focus();
			return false;
		}
		if (document.commentform.pyeong.value == "-"){
			alert ( "평점을 선택해 주세요" );
			return false;
		}
		alert ( "감사합니다" );
		return true;
	}
	
	</script>

</head> 
<body>
	<div class="container">
		<div>
			<a href ="${root}/shop/list.do?pageNum=${pageNum}" ><input type = "button" value="목록으로"></a>
			<a href="${root}/main.do"><input type = "button" value="메인으로"></a>
		</div>
	
		<%-- <c:if test = "${totalCount==0}">
			<b>저장된 휴게소 정보가 없습니다.</b>
		</c:if>
		<c:if test = "${totalCount>0}">
			<b>총  ${totalCount}개의 휴게소가 저장되어 있습니다.</b>
		</c:if> --%>
		<hr>
		

		
	<div>		
		<table class='table table-striped table-hover table-bordered'>
			<caption>
			<b>대표음식 목록</b>
			</caption>
			<tr>
				<th width = "100">번호</th>
				<th width = "150">휴게소</th>
				<th width = "150">메뉴이름</th>
				<th width = "150">가격</th>
				
			</tr>
			<c:if test = "${list2.menu==null}">
			<tr>
				<td>${list4.hugenum }</td>
				<td>${list4.irum }</td>
				<td colspan = "2">대표메뉴가 없음 여기 오지마세용 ㅠ</td>
			</tr>
			</c:if>
			<c:if test = "${list2.menu!=null}">
				<tr>
					<td align = "center">${list2.menunum}</td>
					<td align = "center">${list2.hugeirum}</td>
					<td align = "center">${list2.menu}</td>
					<td align = "center">${list2.price}</td>
				</tr>
			</c:if>
		</table>
	</div>
		
	<div id="comment">
	<form name="commentform" action="read2.do" onsubmit="return validSubmit()">
	<input type="hidden" value="${list2.hugeirum}" name="commentirum">
	
	<table style="width:100%; border: 0px solid gray;" >
		<tr>
			<td style="width: 80%;" rowspan = "2">
				<textarea style="width:100%;"rows="3" cols="70" name="commentcontent"></textarea>
			</td>
			<td style="width: 20%; text-align: right">
				<select size="1" name="pyeong">
					<option value="-">평가해주세요</option>
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5">5점</option>							
				</select>	
			 </td>
		</tr>
		<tr>
			<td style="text-align: right "> 
				<c:if test="${list2.menu == null}">
					<input type="submit" value="comment 쓰기" disabled="disabled">
				</c:if> 
				<c:if test="${list2.menu != null}">
					<input type="submit" value="comment 쓰기">
				</c:if>
				</td>
				</tr>
 			</table>
 		</form>
	</div>
	
	<div class="commentlist">
	<table class='table table-striped table-hover table-bordered'>
	<caption>
		<b>코멘트 목록</b>
		</caption>
		<tr>
			<th width = "100">번호</th>
			<th width = "150">코멘트내용</th>
			<th width = "150">평점</th>
			<th width = "150">삭제</th>
			
		</tr>
		<c:if test = "${list2.menu==null}">
		<tr>
			<td colspan = "4">메뉴가 없어서 코멘트를 달수 없어용 ㅠ</td>
		</tr>
		</c:if>
		<c:if test = "${list2.menu!=null}">
		<c:forEach var="a" items="${list3}" varStatus="i">
				<tr>
					<td align = "center">${i.count}</td>
					<td align = "center">${a.commentcontent}</td>
					<td align = "center">${a.pyeong}</td>
					<td align = "center"><a href="${root}/shop/commentdelete.do?commentnum=${a.commentnum}&irum=${list4.irum}">삭제하기</a></td>
				
				</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
	</body>
</html>