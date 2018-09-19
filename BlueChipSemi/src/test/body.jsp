<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
<title>Insert title here</title>
	<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
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
            	       zoom : 8,
                	mapTypeId : google.maps.MapTypeId.ROADMAP
            	   }
               );
				
               map.setCenter(initLoc);
               
               var marker = new google.maps.Marker({
                   map: map,
                   position: initLoc,
                   title: '현재 내 위치!!'
                 });
                             
               infowindow.open(marker);
        });
    }

    window.onload = initLocation;
</script>
<style type="text/css">
	div {position: absolute;}
	h6 {position: absolute;}
	
	div#searchbox{top: 1%; width:50%; height:20%; font-size:10pt;}
	div#list{top: 15%; width:50%; height:79%; font-size: 10pt; overflow: auto;}
	h6#disp{top: 1%; left: 52%; width:47%; height:15%;}
	div#googlemap{top: 15%; left: 52%; width:47%; height:84%;}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		type:"get",
		url:"한국도로공사_휴게소정보_20171114.xml",
		dataType:"xml",
		
		success:function(data){
			n=0;
			$(data).find("Row").each(function(){
				var a=$(this);//my 태그 전체
				
				var irum=a.find("휴게소명").text();
				var nosun=a.find("도로노선번호").text();
				var noirum=a.find("도로노선명").text();
				var wido=a.find("위도").text();
				var gyungdo=a.find("경도").text();
				var tel=a.find("휴게소전화번호").text();
				
				str = ++n;
				str += " || 휴게소 : "+irum;
				str+= " || 노선번호 : "+nosun;
				str+= " || 노선명 : "+noirum;
				/* str+= "위도:"+wido;
				str+= "경도:"+gyungdo; */
				str+= " || 전화번호 : "+tel;
				str+= " || <input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='자세히'>";
				str+= " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'>";
				
				
				str+="<br>";
				$("#list").append(str);
			});
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
				$(data).find("Row").each(function(){
					var a=$(this);//my 태그 전체
					
					var irum=a.find("휴게소명").text();
					var nosun=a.find("도로노선번호").text();
					var noirum=a.find("도로노선명").text();
					var wido=a.find("위도").text();
					var gyungdo=a.find("경도").text();
					var tel=a.find("휴게소전화번호").text();
					++n;	
					
					if(myhuge == irum && mynoirum == noirum){
						str = n;
						str += " || 휴게소 : "+irum;
						str+= " || 노선번호 : "+nosun;
						str+= " || 노선명 : "+noirum;
						/* str+= "|| 경도:"+gyungdo;
						str+= "|| 위도:"+wido; */
						str+= " || 전화번호 : "+tel;
						
						str+= " || <input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='자세히'>";
						str+= " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'>";
							
						
						str+="<br>";
						$("#list").append(str);
						}
					else if(myhuge == irum){
					str = n;
					str += " || 휴게소 : "+irum;
					str+= " || 노선번호 : "+nosun;
					str+= " || 노선명 : "+noirum;
					/* str+= "|| 경도:"+gyungdo;
					str+= "|| 위도:"+wido; */
					str+= " || 전화번호 : "+tel;
					
					str+= " || <input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='자세히'>";
					str+= " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'>";
						
					
					str+="<br>";
					$("#list").append(str);
					}
					else if(mynoirum == noirum){
						str = n;
						str += " || 휴게소 : "+irum;
						str+= " || 노선번호 : "+nosun;
						str+= " || 노선명 : "+noirum;
						/* str+= "|| 경도:"+gyungdo;
						str+= "|| 위도:"+wido; */
						str+= " || 전화번호 : "+tel;
						
						str+= " || <input type='button' id='link"+n+"' style='width=50px; fontsize=10pt' value='자세히'>";
						str+= " <input type='button' id='gps"+n+"' style='width=50px; fontsize=10pt' value='위치표시'>";
							
						
						str+="<br>";
						$("#list").append(str);
						}
					
				});
								

				$("#name").val("");
				$("#nosun").val("");
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
				                   title: irum
				                 });
				                             
				               infowindow.open(marker);
				        });
						

						
						
						}
				
					
				});
								

				$("#name").val("");
				$("#nosun").val("");
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
		 
		 
		 function callAjax() {
			    var AjaxHTML = $.ajax({
			        url: "http://localhost:8081/BlueChipSemi/shop/list.do", 
			        type: "POST",
			        dataType: "html",
			        async: false
			     }).responseText;

			     $("#link<%=i%>").html(AjaxHTML);
			} 

	});
	<%}%>
	
});//function끝

</script>

</head> 
<body>
<div id="searchbox">
	<form action="#">
		<fieldset class="happy">
			<legend>검색창</legend>
			<table>
				<tr>
					<td width="100" fontsize="10pt">휴게소</td>
					<td width="200">
						<input type="text" id="name" 
						  style="width: 80px;">
					</td>
					<td lowspan="2">
						<input type="button" id="btnRead" value="검색">
					</td>
				</tr>
				<tr>
					<td width="100">노선명</td>
					<td width="200">
						<input type="text" id="noirum" 
						  style="width: 80px;">
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</div>


<div id="list"></div>
<div id="googlemap">
	<h6 id="disp">구글맵 보기</h6>
</div>


</body>
</html>