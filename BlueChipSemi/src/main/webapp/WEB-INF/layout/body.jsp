<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
<title>Insert title here</title>
	<!-- <link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" /> -->
	<style type="text/css">
	div#leftwrap{
		position:relative;
		float:left;
		width: 49%;
	}
	div#rightwrap{
		position:relative;
		float:left;
		width: 49%;
	}
	div#searchbox{
		width: 98%;
		font-size:10pt;
		margin: 3px;
		padding: 3px;
	}
	div#list{
		align-content:center;
		width:98%;
		font-size:10pt; 
		margin: 3px;
		padding: 3px;
	}
	div#googlemap{
		border: 2px solid red;
		width: 98%;
		height: 1000px;
		margin: 3px;
	}
	
</style>

<script src="http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
<script>
    //Infowindow는 말풍선 모양으로 원하는 텍스트 정보를 지도 위에 표시
    var infowindow = new google.maps.InfoWindow();
	var lat,lon;
	var myLoc;
    function initLocation() {
        myLoc = getLocation();
        if(myLoc == null) return false;

        myLocation();
    }

    function getLocation() {
        if(navigator.geolocation) {
            return navigator.geolocation;
        }
        document.getElementById("disp").innerHTML = "위치정보 지원안됨";
        return null;
    }

   /*  function myloc(currlat,currlon){
    	lat=currlat;
    	lon=currlon;
    	myLocation();
    	location.reload();
    } */
    function myLocation() {
    	
    	myLoc.getCurrentPosition(function(position) {
        	lat = position.coords.latitude;
        	lon = position.coords.longitude;
        	var initLoc = new google.maps.LatLng(lat, lon);
               var map = new google.maps.Map(
            	   document.getElementById("googlemap"), 
            	   {
            	       zoom : 15,
                	mapTypeId : google.maps.MapTypeId.ROADMAP
            	   }
               );
				
               map.setCenter(initLoc);
               
               var marker = new google.maps.Marker({
                   map: map,
                   position: initLoc,
                   label : {text:'현재 내 위치', color:'blue'}
                 });
                             
               infowindow.open(marker);
        });
    }

    window.onload = initLocation;
</script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

function list(pageNum) {
	
	$.ajax({
		type:"get",
		url:"한국도로공사_휴게소정보_20171114.xml",
		dataType:"xml",
		
		success:function(data){
			var start = (pageNum-1)*20+1;
			var end = pageNum*20;
			$("#list").empty();
			n=0;
			str ="<table class='table table-striped table-hover table-bordered'> <thead> <tr><td>번호</td><td>휴게소명</td><td>노선명</td><td>전화번호</td><td>정보확인</td></tr></thead><tbody>"
			$(data).find("Row").each(function(){
				var a=$(this);//my 태그 전체
				++n;
				if(n>=start && n<=end){
					var irum=a.find("휴게소명").text();
					var nosun=a.find("도로노선번호").text();
					var noirum=a.find("도로노선명").text();
					var wido=a.find("위도").text();
					var gyungdo=a.find("경도").text();
					var tel=a.find("휴게소전화번호").text();

					str += "<tr><td>"+n+"</td>";
					str += "<td>"+irum+"</td>";
					str += "<td>"+noirum+"</td>";
					str += "<td>"+tel+"</td>";
					str += "<td><input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='대표메뉴'>";
					str += " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'></td></tr>";
				}
			});
			str += "</tbody></table>";
			$("#list").append(str);
		},
		statusCode:{
			404:function(){
				alert("파일을 찾을수 없어요!!");
			},
			500:function(){
				alert("서버 파일 오류..오타확인하세요");
			}
		}					
	});//ajax 함수끝	
}



$(function(){
	
	list(1);
	
	//버튼 이벤트
	$("#btnRead").click(function(){
		myhuge=$("#name").val();
		mynoirum=$("#noirum").val();
		if(myhuge=="" && mynoirum==""){
			alert("조건을 입력해주세요");
			return false;
		}
		
		$.ajax({
			type:"get",
			url:"한국도로공사_휴게소정보_20171114.xml",
			dataType:"xml",
			success:function(data){
				$("#list").empty();
				
				n=0;
				str ="<table class='table table-striped table-hover table-bordered'><thead> <tr><td>번호</td><td>휴게소명</td><td>노선명</td><td>전화번호</td><td>정보확인</td></tr></thead><tbody>";
				$(data).find("Row").each(function(){
					
					var a=$(this);//my 태그 전체
					
					var irum=a.find("휴게소명").text();
					var nosun=a.find("도로노선번호").text();
					var noirum=a.find("도로노선명").text();
					var wido=a.find("위도").text();
					var gyungdo=a.find("경도").text();
					var tel=a.find("휴게소전화번호").text();
					++n;
					
					if(irum.search(myhuge)>=0 && noirum.search(mynoirum)>=0){
						
						str += "<tr><td>"+n+"</td>";
						str += "<td>"+irum+"</td>";
						str += "<td>"+noirum+"</td>";
						str += "<td>"+tel+"</td>";
						str += "<td><input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='대표메뉴'>";
						str += " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'></td></tr>";
					}else if(irum.search(myhuge)>=0 && noirum==""){
						
						str += "<tr><td>"+n+"</td>";
						str += "<td>"+irum+"</td>";
						str += "<td>"+noirum+"</td>";
						str += "<td>"+tel+"</td>";
						str += "<td><input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='대표메뉴'>";
						str += " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'></td></tr>";
					}else if(noirum.search(mynoirum)>=0 && irum==""){
						
						str += "<tr><td>"+n+"</td>";
						str += "<td>"+irum+"</td>";
						str += "<td>"+noirum+"</td>";
						str += "<td>"+tel+"</td>";
						str += "<td><input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='대표메뉴'>";
						str += " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'></td></tr>";
					}
				});
				str += "</tbody></table>";  
				$("#list").append(str);
				
				$("#name").val("");
				$("#noirum").val("");
				$("#name").focus();
				
				$("#listpaging").empty();
			},
			statusCode:{
				404:function(){
					alert("파일을 찾을수 없어요!!");
				},
				500:function(){
					alert("서버 파일 오류..오타확인하세요");
				}
			}					
		});//ajax 함수끝	
	});
	
	<% for(int i=1; i<=190; i++)
	{%>
	$(document).on("click","#gps<%=i%>",function(){
		<%-- alert(<%=i%>); --%>
		
		$.ajax({
			type:"get",
			url:"한국도로공사_휴게소정보_20171114.xml",
			dataType:"xml",
			success:function(data){
				
				
				n=0;
				$(data).find("Row").each(function(){
					var a=$(this);//my 태그 전체
					
					var irum=a.find("휴게소명").text();					
					var wido=a.find("위도").text();
					var gyungdo=a.find("경도").text();
					
					++n;	
					
					if(n == <%= i%>){
											
						
						myLoc.getCurrentPosition(function(position) {
				        	lat = wido;
				        	lon = gyungdo;
				        	var initLoc = new google.maps.LatLng(lat, lon);
				               var map = new google.maps.Map(
				            	   document.getElementById("googlemap"), 
				            	   {
				            	       zoom : 8,
				                	mapTypeId : google.maps.MapTypeId.ROADMAP
				            	   }
				               );

				               map.setCenter(initLoc);
				               var marker = new google.maps.Marker({
				                   map: map,
				                   position: initLoc,
				                   	label : {text:irum+'휴게소', color:'blue'}
				                 });
				                             
				               infowindow.open(marker);
				        });
						}
				});

				$("#name").val("");
				$("#noirum").val("");
				$("#name").focus();
			},
			statusCode:{
				404:function(){
					alert("파일을 찾을수 없어요!!");
				},
				500:function(){
					alert("서버 파일 오류..오타확인하세요");
				}
			}					
		});//ajax 함수끝	
	});
	<%}%>
	
	<% for(int i=1; i<=190; i++)
	{%>
	$(document).on("click","#link<%=i%>",function(){
		 <%-- alert(<%=i%>); --%> 
		 
		 $.ajax({
				type:"get",
				url:"한국도로공사_휴게소정보_20171114.xml",
				dataType:"xml",
				success:function(data){
					
					
					n=0;
					$(data).find("Row").each(function(){
						var a=$(this);//my 태그 전체
						
						var irum=a.find("휴게소명").text();					
						++n;	
						var url = "${root}/BlueChipSemi/shop/list2.do?hugeirum="+irum+"&commentirum="+irum+"&irum="+irum+"&pageNum="+
						Math.ceil(n/10);	
						if(n == <%= i%>){
							window.location.href = url;					
						}
		 
						
					});
				}
		 });
	});
	<%}%>
	
});//function끝
</script>


</head> 
<body>

<div id=leftwrap>
<div id="searchbox">
	<form action="#">
			<h3 align="center">검색창</h3>
			<table class="table table-bordered">
				<tr>
					<td width="20%" fontsize="10pt">휴게소</td>
					<td width="60%" align="left">
						<input type="text" id="name" style="width: 90%;">
					</td>
					<td width="20%" align="center" rowspan="2">
						<br>
						<input type="button" id="btnRead" value="검색" >
					</td>
				</tr>
				<tr>
					<td >노선명</td>
					<td align="left">
						<input type="text" id="noirum" style="width: 90%;">
					</td>
				</tr>
			</table>
	</form>
</div>
<div id="list"></div>
<div id="listpaging" class="text-center">
	<ul class="pagination">
		<li><a href="javascript:list(1)">1</a></li>
		<li><a href="javascript:list(2)">2</a></li>
		<li><a href="javascript:list(3)">3</a></li>
		<li><a href="javascript:list(4)">4</a></li>
		<li><a href="javascript:list(5)">5</a></li>
		<li><a href="javascript:list(6)">6</a></li>
		<li><a href="javascript:list(7)">7</a></li>
		<li><a href="javascript:list(8)">8</a></li>
		<li><a href="javascript:list(9)">9</a></li>
		<li><a href="javascript:list(10)">10</a></li>
	</ul>
</div>
</div>
<div id="rightwrap">
<h3 id="disp">구글맵 보기</h3>
<div id="googlemap"></div>
</div>

</body>
</html>