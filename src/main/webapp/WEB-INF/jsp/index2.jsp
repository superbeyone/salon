<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="${pageContext.request.contextPath }\js\bootstrap\dist\css\bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.gritter\css\jquery.gritter.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }\fonts\font-awesome-4\css\font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http\foxythemes.net\assets\js\MS_6.js"></script>
    <script src="http\foxythemes.net\assets\js\MS_7.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.nanoscroller\nanoscroller.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.easypiechart\jquery.easy-pie-chart.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.switch\bootstrap-switch.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.datetimepicker\css\bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.select2\select2.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.slider\css\slider.css"/>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }\css\style.css" rel="stylesheet"/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
</head>

<body>

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

            <ul class="nav navbar-nav navbar-right user-nav">
                <li class="dropdown profile_menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="${pageContext.request.contextPath }/images/avatar2.jpg"/><span><c:if test="${user.nickname!=null}">${user.nickname }</c:if><c:if test="${user.nickname==null}">${user.username }</c:if></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:;" onclick="changeIframeUri('/worker/workerInfo.html')">个人信息</a></li>
                        <li><a href="javascript:;" onclick="changeIframeUri('/worker/changePwd.html')">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)" id="logout" onclick="logout()">注销</a></li>
                    </ul>
                </li>
            </ul>
            <%-- <ul class="nav navbar-nav navbar-right not-nav">
                 <li class="button dropdown">
                     <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class=" fa fa-comments"></i></a>
                     <ul class="dropdown-menu messages">
                         <li>
                             <div class="nano nscroller">
                                 <div class="content">
                                     <ul>
                                         <li>
                                             <a href="#">
                                                 <img src="${pageContext.request.contextPath }/images/avatar2.jpg" alt="avatar"/><span class="date pull-right">13 Sept.</span> <span class="name">Daniel</span> I'm following you, and I want your money!
                                             </a>
                                         </li>
                                         <li>
                                             <a href="#">
                                                 <img src="${pageContext.request.contextPath }/images/avatar_50.jpg" alt="avatar"/><span class="date pull-right">20 Oct.</span><span class="name">Adam</span> is now following you
                                             </a>
                                         </li>
                                         <li>
                                             <a href="#">
                                                 <img src="${pageContext.request.contextPath }/images/avatar4_50.jpg" alt="avatar"/><span class="date pull-right">2 Nov.</span><span class="name">Michael</span> is now following you
                                             </a>
                                         </li>
                                         <li>
                                             <a href="#">
                                                 <img src="${pageContext.request.contextPath }/images/avatar3_50.jpg" alt="avatar"/><span class="date pull-right">2 Nov.</span><span class="name">Lucy</span> is now following you
                                             </a>
                                         </li>
                                     </ul>
                                 </div>
                             </div>
                             <ul class="foot">
                                 <li><a href="#">View all messages </a></li>
                             </ul>
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
                             <ul class="foot">
                                 <li><a href="#">View all activity </a></li>
                             </ul>
                         </li>
                     </ul>
                 </li>
                 <li class="button"><a href="javascript:;" class="speech-button"><i class="fa fa-microphone"></i></a></li>
             </ul>--%>

        </div><!--/.nav-collapse animate-collapse -->
    </div>
</div>
<div id="cl-wrapper">
    <div class="cl-sidebar" data-position="right" data-step="1" data-intro="<strong>Fixed Sidebar</strong> <br/> It adjust to your needs.">
        <div class="cl-toggle"><i class="fa fa-bars"></i></div>
        <div class="cl-navblock">
            <div class="menu-space">
                <div class="content">


                    <ul class="cl-vnavigation">
                        <li><a href="${pageContext.request.contextPath }/index.html"><i class="fa fa-home"></i><span>企业首页</span></a>
                            <!--  <ul class="sub-menu">
                               <li ><a href="index.html">Version 1</a></li>
                               <li><a href="dashboard2.html"><span class="label label-primary pull-right">New</span> Version 2</a></li>
                             </ul> -->
                        </li>

                        <li><a href="#"><i class="fa fa-smile-o"></i><span>会员管理</span></a>
                            <ul class="sub-menu">
                                <c:if test="${fn:contains(user.authority, '1')}">
                                    <li><a href="javascript:;" onclick="changeIframeUri('/customer/addCustomer.html')">会员信息添加</a></li>
                                </c:if>
                                <li><a href="javascript:;" onclick="changeIframeUri('/customer/list.html')">会员信息查询</a></li>
                                <c:if test="${fn:contains(user.authority, '1')}">
                                    <li><a href="javascript:;" data-toggle="modal" data-target="#myModal">会员信息一键导入</a></li>
                                </c:if>
                            </ul>
                        </li>
                        <c:if test="${fn:contains(user.role, '1') || fn:contains(user.role, '2')}">
                            <li><a href="#"><i class="fa fa-list-alt"></i><span>职员管理</span></a>
                                <ul class="sub-menu">

                                    <li><a href="javascript:;" onclick="changeIframeUri('/worker/addWorker.html')">职员信息添加</a></li>
                                    <li><a href="javascript:;" onclick="changeIframeUri('worker/list.html')">职员信息查询</a></li>
                                    <li><a href="" data-toggle="modal" data-target="#myModal2">职员信息一键导入</a></li>

                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${fn:contains(user.role, '1') }">
                            <li><a href="#"><i class="fa fa-table"></i><span>财务管理</span></a>
                                <ul class="sub-menu">
                                    <li><a href="javascript:;" onclick="changeIframeUri('/coffer/getCoffer.html')">收入详情</a></li>
                                </ul>
                            </li>
                        </c:if>

                        <c:if test="${fn:contains(user.role, '1') }">
                            <li><a href="#"><i class="fa fa-reply-all"></i><span>回收站</span></a>
                                <ul class="sub-menu">
                                    <li><a href="javascript:;" onclick="changeIframeUri('/customer/recycleCustomer.html')">会员信息</a></li>
                                    <li><a href="javascript:;" onclick="changeIframeUri('/worker/recycleWorker.html')">职员信息</a></li>
                                </ul>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
            <div class="text-right collapse-button" style="padding:7px 9px;">
                <%--<input type="text" class="form-control search" placeholder="Search..."/>--%>
                <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
            </div>
        </div>
    </div>

    <%--<div class="container-fluid" id="pcont">
            <div class="page-head">
                <h2>Blank Page</h2>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Category</a></li>
                    <li class="active">Sub Category</li>
                </ol>
            </div>
            <div class="cl-mcont">
                <h3 class="text-center">Content goes here!</h3>
            </div>
        </div>--%>
    <div class="container-fluid" id="pcont">
        <iframe id="myIframe" src="/customer/search.html" scrolling="yes" noresize height="100%" width="100%" frameborder="0" onload="setIframeHeight(this)"></iframe>
    </div>
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    一键导入会员信息
                </h4>
            </div>
            <div class="modal-body">

                <form action="${pageContext.request.contextPath }/upload/customerInfo.action" id="uploadCustomerForm" method="post" enctype="multipart/form-data">
                    <div class="input-group" onclick="uploadCustomerFile()">
                        <input type="file" name="file" id="uploadCustomerInfo" Style="display: none">
                        <!-- -->
                        <input type="text" id="customerSrc" class="form-control"
                               placeholder="请选择excel文件"/> <label id="uploadCustomerBtn"
                                                                 class="input-group-btn col-bg-0"> <i
                            class="btn btn-primary fa fa-cloud-upload">&nbsp;&nbsp;上传文件</i></label>

                    </div>
                </form>

                <div class="spacer spacer-bottom">
                    <a href="${pageContext.request.contextPath }/download/customerTemplet.action">
                        <button id="downloadCustomerTemplet" type="button" onclick="downloadCustomerTemplet();" class="btn btn-success btn-lg btn-rad"><i class="fa fa-cloud-download"></i> 下载模板</button>
                    </a>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button onclick="$('#uploadCustomerForm').submit()" type="button" class="btn btn-primary">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabe2">
                    一键导入职员信息
                </h4>
            </div>
            <div class="modal-body">

                <form action="${pageContext.request.contextPath }/upload/workerInfo.action" id="uploadWorkerForm" method="post" enctype="multipart/form-data">
                    <div class="input-group" onclick="uploadWorkerFile()">
                        <input type="file" name="file" id="uploadWorkerInfo" Style="display: none">
                        <!-- -->
                        <input type="text" id="workerSrc" class="form-control"
                               placeholder="请选择excel文件"/> <label id="uploadWorkerBtn"
                                                                 class="input-group-btn col-bg-0"> <i
                            class="btn btn-primary fa fa-cloud-upload">&nbsp;&nbsp;上传文件</i></label>

                    </div>
                </form>

                <div class="spacer spacer-bottom">
                    <a href="${pageContext.request.contextPath }/download/workerTemplet.action">
                        <button id="downloadWorkerTemplet" type="button" onclick="downloadWorkerTemplet();" class="btn btn-success btn-lg btn-rad"><i class="fa fa-cloud-download"></i> 下载模板</button>
                    </a>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button onclick="$('#uploadWorkerForm').submit()" type="button" class="btn btn-primary">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.gritter/js/jquery.gritter.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour/general.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nestable/jquery.nestable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.select2/select2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/skycons/skycons.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/behaviour\voice-commands.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap\dist\js\bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js\jquery.flot\jquery.flot.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flot\jquery.flot.pie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flot\jquery.flot.resize.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flot\jquery.flot.labels.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        //initialize the javascript
        App.init({
            nanoScroller: false
        });

        App.dashBoard();

        // introJs().setOption('showBullets', false).start();

    });
</script>
<script>
    function logout() {
        layer.confirm('确定要退出登录吗?', function (index) {
            var uri = '${pageContext.request.contextPath }/logout.action';

            layer.close(index);
            //向服务端发送删除指令

            $.ajax({
                url: uri, success: function (result) {
                    window.location.reload(); //刷新当前页面
                }
            });

        });
    };

    function setIframeHeight(iframe) {
        if (iframe) {
            var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if (iframeWin.document.body) {
                iframe.height = 0;
                iframe.height = iframeWin.document.documentElement.scrollHeight + 300 || iframeWin.document.body.scrollHeight + 300;
            }
        }
    };

    window.onload = function () {
        setIframeHeight(document.getElementById('myIframe'));
    };

    function changeIframeUri(uri) {
        var url = $("#myIframe").attr("src");
        $("#myIframe").attr("src", uri);
    }


</script>
<!-- 上传会员信息 -->
<script type="text/javascript">
    var inputc = document.getElementById("uploadCustomerInfo");

    inputc.addEventListener('change', readFile, false);

    function uploadCustomerFile() {
        document.getElementById('uploadCustomerInfo').click(); //打开<input type="file" id="uploadWorkerInfo" />
    }

    function readFile() {
        var file = this.files[0];
        if (!/application\/\w+/.test(file.type)) {
            alert("请确保文件为Excel类型");
            return false;
        }
        var reader = new FileReader();
        console.log("file=" + file);
        //alert("fileName="+file.name);
        reader.readAsBinaryString(file);
        reader.onload = function (e) {
            var arr = input.value.split('\\'); //分割路径
            //alert(arr);
            //document.getElementById('customerSrc').value = arr[arr.length-1]; //取数组最后部分 -文件名
            document.getElementById('customerSrc').value = file.name; //取数组最后部分 -文件名
            //$("#uploadWorkerForm").submit();
            var fileName = file.name.split('.');
            var extName = fileName[fileName.length - 1];
            console.log(extName);
            //alert(e.target.result);

        }
    }


</script>


<!-- 上传职员信息 -->
<script type="text/javascript">
    var input = document.getElementById("uploadWorkerInfo");

    input.addEventListener('change', readFile, false);

    function uploadWorkerFile() {
        document.getElementById('uploadWorkerInfo').click(); //打开<input type="file" id="uploadWorkerInfo" />
    }

    function readFile() {
        var file = this.files[0];
        if (!/application\/\w+/.test(file.type)) {
            alert("请确保文件为Excel类型");
            return false;
        }
        var reader = new FileReader();
        console.log(file);
        reader.readAsBinaryString(file);
        reader.onload = function (e) {
            var arr = input.value.split('\\'); //分割路径
            document.getElementById('workerSrc').value = arr[arr.length - 1]; //取数组最后部分 -文件名
            //$("#uploadWorkerForm").submit();
            var fileName = file.name.split('.');
            var extName = fileName[fileName.length - 1];
            console.log(extName);
            //alert(e.target.result);

        }
    }

    function uploadWorker() {
        $.post("${pageContext.request.contextPath }/upload/workerInfo.action", $("#uploadWorkerForm").serialize(), function (data) {
            if (data.status == 200) {
                $.message.alert("提示", "职员添加成功!");
            } else {
                $.message.alert("警告", "职员添加失败!");
            }
        });
    }


</script>


<!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>


</body>

</html>
