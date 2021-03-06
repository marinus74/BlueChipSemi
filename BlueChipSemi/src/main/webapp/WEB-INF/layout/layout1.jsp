<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<title>Welcome</title>
		<style type = "text/css">
			div{
			border: 0px solid grey; 
			font-size: 15pt;
			}
			div#wrapperall {
				width: 90%;
				padding: 5px;
				margin: 0 auto;
			}
			div#top{
				width : 100%;
				text-align: center;
				margin-bottom: 10px;
			}
			div#menu{
				width : 100%;
				text-align: center;
				margin-bottom: 10px;
			}
			div#body{
				width : 100%;
				text-align: center;
				margin-bottom: 10px;
			}
			div#bottom{
				clear: both;
				width : 100%;
				text-align: center;
			}
			
			
		</style>
	</head> 
	<body >
		<div id= "wrapperall" class="container">
			<div id = "top">
				<tiles:insertAttribute name = "header"></tiles:insertAttribute>
			</div>
			<div id = "menu">
				<tiles:insertAttribute name = "menu"></tiles:insertAttribute>
			</div>
			<div id = "body">
				<tiles:insertAttribute name = "body"></tiles:insertAttribute>
			</div>
			<div id = "bottom">
				<tiles:insertAttribute name = "footer"></tiles:insertAttribute>
			</div>
		</div>
	</body>
</html>