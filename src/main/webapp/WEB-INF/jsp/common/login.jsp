<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link href="${pageContext.request.contextPath }/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/font-awesome-4/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.gritter/css/jquery.gritter.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.nanoscroller/nanoscroller.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.easypiechart/jquery.easy-pie-chart.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.switch/bootstrap-switch.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.slider/css/slider.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js\dropzone\css\dropzone.css"/>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet"/>


</head>

<body class="texture">

<div id="cl-wrapper" class="login-container">

    <div class="middle-login">
        <div class="block-flat">
            <div class="header">
                <h3 class="text-center">后台登录</h3>
            </div>
            <div>
                <form id="loginForm" style="margin-bottom: 0px !important;" class="form-horizontal" method="post">
                    <div class="content">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" placeholder="账号" id="username" name="username" required="required" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="password" placeholder="密码" id="password" name="password" required="required" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6 col-xs-6">
                                <div class="input-group ">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <input type="text" placeholder="验证码" id="verifyCode" name="verifyCode" class="form-control">

                                </div>
                            </div>
                            <div class="col-sm-6 col-xs-6">
                                <%-- <jsp:include page="${pageContext.request.contextPath }/common/code.html"></jsp:include> --%>
                                <%--  <iframe src="${pageContext.request.contextPath }/common/code.html"></iframe>  --%>
                                <a href="javascript:;" onclick="refreshImgCode()">
                                    <img id="verifyCodeImg" alt="验证码" width="80" height="40"/>
                                </a>
                            </div>
                        </div>


                    </div>
                    <div class="foot">

                        <button class="btn btn-primary" data-dismiss="modal" id="login">登录</button>
                    </div>

                </form>

            </div>
        </div>
        <div class="text-center out-links"><a href="#">&copy; 2018 superbeyone</a></div>
    </div>

</div>

<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/behaviour/general.js"></script>

</body>
</html>


<script src="${pageContext.request.contextPath }/js\jquery.js"></script>

<script
        src="${pageContext.request.contextPath }/js\jquery.select2\select2.min.js"
        type="text/javascript"></script>
<script
        src="${pageContext.request.contextPath }/js\bootstrap.slider\js\bootstrap-slider.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js\jquery.nanoscroller\jquery.nanoscroller.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js\jquery.nestable\jquery.nestable.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js\behaviour\general.js"></script>
<script
        src="${pageContext.request.contextPath }/js\jquery.ui\jquery-ui.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js\bootstrap.switch\bootstrap-switch.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/js\bootstrap.datetimepicker\js\bootstrap-datetimepicker.min.js"></script>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
        src="${pageContext.request.contextPath }/js\behaviour\voice-commands.js"></script>
<script
        src="${pageContext.request.contextPath }/js\bootstrap\dist\js\bootstrap.min.js"></script>
<!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>

<script type="text/javascript">
    $(function () {
        refreshImgCode();
    });


    $("#login").on("click", function (event) {
        var event = event || window.event;
        event.preventDefault(); // 兼容标准浏览器
        var url = "/do_login.action";
        //这是使用ajax的方式提交
        $.ajax({
            type: 'post',
            url: url,
            dataType: 'json',
            data: {
                'username': $("#username").val(),
                'password': $("#password").val(),
                'verifyCode': $("#verifyCode").val()
            },

            cache: false,
            success: function (data) {

                if (data.status == 200) {
                    layer.msg(data.msg);
                    window.location.href = "${pageContext.request.contextPath}/index.html";
                } else {
                    layer.msg(data.msg);
                    refreshImgCode();

                    $("#verifyCode").val("").focus(); // 清空并获得焦点
                }



            },
            error: function (result) {
                console.log(result + "error");
            }


        });
    });


    function refreshImgCode() {
        $("#verifyCodeImg").attr("src", "${pageContext.request.contextPath}/verifyCode.action?time=" + new Date().getTime());
    };

</script>
