<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/super.ico">

    <title>Salon</title>
 
  			 
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/font-awesome-4/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
   <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.gritter/css/jquery.gritter.css" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.nanoscroller/nanoscroller.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.easypiechart/jquery.easy-pie-chart.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js\dropzone\css\dropzone.css" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />
  



	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/></head>


  <!-- Fixed navbar -->
  <div id="head-nav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="fa fa-gear"></span>
        </button>
        <a class="navbar-brand" href="#"><span>会员管理后台</span></a>
      </div>
      <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav">   
          <li class="active"><a href="#">常用</a></li>
          <li><a href="#about">我的面板</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">设置 <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">Action</a></li>
              <li><a href="#">Another action</a></li>
              <li><a href="#">Something else here</a></li>
      <li class="dropdown-submenu"><a href="#"></a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          </ul>
      </li>              
      </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">模块<b class="caret"></b></a>
      <ul class="dropdown-menu col-menu-2">
        <li class="col-sm-6 no-padding">
          <ul>
          <li class="dropdown-header"><i class="fa fa-group"></i>Users</li>
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="dropdown-header"><i class="fa fa-gear"></i>Config</li>
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li> 
          </ul>
        </li>
        <li  class="col-sm-6 no-padding">
          <ul>
          <li class="dropdown-header"><i class="fa fa-legal"></i>Sales</li>
          <li><a href="#">New sale</a></li>
          <li><a href="#">Register a product</a></li>
          <li><a href="#">Register a client</a></li> 
          <li><a href="#">Month sales</a></li>
          <li><a href="#">Delivered orders</a></li>
          </ul>
        </li>
      </ul>
          </li>
        </ul>
    <ul class="nav navbar-nav navbar-right user-nav">
      <li class="dropdown profile_menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="${pageContext.request.contextPath }/images/avatar2.jpg" /><span>${user.username }</span> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">My Account</a></li>
          <li><a href="#">Profile</a></li>
          <li><a href="#">Messages</a></li>
          <li class="divider"></li>
          <li><a href="javascript:void(0)" id="logout" onclick="logout()">注销</a></li>
        </ul>
      </li>
    </ul>			
    <ul class="nav navbar-nav navbar-right not-nav" >
      <li class="button dropdown">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class=" fa fa-comments"></i></a>
        <ul class="dropdown-menu messages">
          <li>
            <div class="nano nscroller">
              <div class="content">
                <ul>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath }/images/avatar2.jpg" alt="avatar" /><span class="date pull-right">13 Sept.</span> <span class="name">Daniel</span> I'm following you, and I want your money! 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath }/images/avatar_50.jpg" alt="avatar" /><span class="date pull-right">20 Oct.</span><span class="name">Adam</span> is now following you 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath }/images/avatar4_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Michael</span> is now following you 
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="${pageContext.request.contextPath }/images/avatar3_50.jpg" alt="avatar" /><span class="date pull-right">2 Nov.</span><span class="name">Lucy</span> is now following you 
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <ul class="foot"><li><a href="#">View all messages </a></li></ul>           
          </li>
        </ul>
      </li>
      <li class="button dropdown">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i><span class="bubble">56</span></a>
        <ul class="dropdown-menu">
          <li>
            <div class="nano nscroller">
              <div class="content">
                <ul>
                  <li><a href="#"><i class="fa fa-cloud-upload info"></i><b>Daniel</b> is now following you <span class="date">2 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-male success"></i> <b>Michael</b> is now following you <span class="date">15 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-bug warning"></i> <b>Mia</b> commented on post <span class="date">30 minutes ago.</span></a></li>
                  <li><a href="#"><i class="fa fa-credit-card danger"></i> <b>Andrew</b> killed someone <span class="date">1 hour ago.</span></a></li>
                </ul>
              </div>
            </div>
            <ul class="foot"><li><a href="#">View all activity </a></li></ul>           
          </li>
        </ul>
      </li>
      <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-microphone"></i></a></li>				
    </ul>

      </div><!--/.nav-collapse animate-collapse -->
    </div>
  </div>
  <div id="cl-wrapper" class="fixed-menu">
  </div>
  <script>
  function logout(){
	  layer.confirm('确定要退出登录吗?', function(index){
		  var uri ='${pageContext.request.contextPath }/logout.action';
				
			  layer.close(index);
			  //向服务端发送删除指令
			  
				$.ajax({url:uri,success:function(result){
					window.location.reload(); //刷新当前页面
    }});
				
			});
  }


  </script>
<!-- layer层 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
    <script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>