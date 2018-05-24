<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images\favicon.png">


	<!-- Bootstrap core CSS -->
	<link href="${pageContext.request.contextPath}/js\bootstrap\dist\css\bootstrap.css" rel="stylesheet">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts\font-awesome-4\css\font-awesome.min.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="http\foxythemes.net\assets\js\MS_6.js"></script>
	  <script src="http\foxythemes.net\assets\js\MS_7.js"></script>
	<![endif]-->

	<!-- Custom styles for this template -->
	<link href="${pageContext.request.contextPath}/css\style.css" rel="stylesheet" />	

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta></head>

<body class="texture">

<div id="cl-wrapper" class="error-container">
	<div class="page-error">
		
		<h2 class="description text-center">${result.msg }</h2>
		<c:if test="${result.status==200}">
			<h3 class="text-center"> <i class="fa fa-smile-o fa-4x"></i></h3>
		</c:if>
		<c:if test="${result.status!=200}">
			<h3 class="text-center"> <i class="fa fa-meh-o fa-4x"></i></h3>
		</c:if>
	</div>
	 <c:if test="${result.status==200 && result.data.cardNo!=null}">
	 	<div class="text-center copy">卡号:【${result.data.cardNo }】的当前余额为:${result.data.wallet }￥</div>
	 </c:if>
	
	
</div>

<script src="${pageContext.request.contextPath}/js\jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js\behaviour\general.js"></script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
  <script src="${pageContext.request.contextPath}/js\behaviour\voice-commands.js"></script>
  <script src="${pageContext.request.contextPath}/js\bootstrap\dist\js\bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js\jquery.flot\jquery.flot.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js\jquery.flot\jquery.flot.pie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js\jquery.flot\jquery.flot.resize.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js\jquery.flot\jquery.flot.labels.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
</body>
</html>
