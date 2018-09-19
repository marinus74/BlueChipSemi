<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
		<script src="http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script>
    //Infowindow는 말풍선 모양으로 원하는 텍스트 정보를 지도 위에 표시
    var infowindow = new google.maps.InfoWindow();

    function initLocation() {
        var myLoc = getLocation();
        if(myLoc == null) return false;

        myLocation(myLoc);
    }

    function getLocation() {
        if(navigator.geolocation) {
            return navigator.geolocation;
        }
        document.getElementById("disp").innerHTML = "위치정보 지원안됨";
        return null;
    }

    function myLocation(myLoc) {
    	myLoc.getCurrentPosition(function(position) {
    		
        	var lat = 36.939341;
        	var lon = 128.320788;
        	var initLoc = new google.maps.LatLng(lat, lon);
        	
               var map = new google.maps.Map(
            	   document.getElementById("map_canvas"), 
            	   {
            	       zoom : 16,
                	mapTypeId : google.maps.MapTypeId.ROADMAP
            	   }
               );

        
               map.setCenter(initLoc);
               infowindow.setContent("현재 내 위치!");
               infowindow.setPosition(initLoc);
               infowindow.open(map);
        });
    }

    window.onload = initLocation;
</script>
		
	</head> 
	<body>
		<h2 id="disp">구글맵 보기</h2>
<div id="map_canvas" style="width:100%; height:100%"></div>
		
	</body>
</html>