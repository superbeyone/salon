<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

<form class="layui-form form-horizontal group-border-dashed" >
    <table class="layui-table" lay-even="" lay-skin="row">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th colspan="4" style="text-align: center;">充值</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>会员卡号:${customer.cardNo }</td>
            <td>姓名: ${customer.username }</td>
        </tr>

        <tr>
            <td>余额:${customer.wallet }￥</td>
            <td>上次消费时间:<fmt:formatDate value='${customer.updateDate}' pattern="yyyy-MM-dd hh:mm:ss"/></td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="id" value="${customer.id }">
    <div class="layui-form-item form-group">
        <label class="layui-form-label">充值:</label>
        <div class="layui-input-block">
            <input data-parsley-type="number" id="money" name="money" type="text" class="form-control col-sm-4 col-lg-4 col-md-4" required placeholder="请输入充值金额"/>
            <!-- <input type="text" name="money" lay-verify="title" autocomplete="off" placeholder="请输入充值金额" class="layui-input"> -->
        </div>
    </div>
    <div class="layui-form-item form-group ">
        <label class="layui-form-label">密码:</label>
        <div class="layui-input-block">
            <input type="password" name="password" id="password" required class="form-control col-sm-4 col-lg-4 col-md-4" placeholder="请输入管理员充值密码">
            <!-- <input type="text" name="money" lay-verify="title" autocomplete="off" placeholder="请输入充值金额" class="layui-input"> -->
        </div>
    </div>
    <!-- <div class="form-group">
                  <label class="col-sm-3 control-label">Number</label>
                  <div class="col-sm-3">
                    <input data-parsley-type="number" type="text" class="form-control" required placeholder="Enter only numbers" />
                  </div>
                </div> -->
    <div class="form-group pull-right">
        <div class="col-sm-offset-2 col-sm-10">
            <button id="submitBtn" type="submit" class="btn btn-primary">充值</button>
        </div>
    </div>
</form>


<!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>


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

<script>
    $("#money").on("blur",checkMoney);


    $("#submitBtn").on("click", function (e) {
        e.preventDefault();
        var money = $("#money").val();
        var password = $("#password").val();
       if(money==""){
           layer.msg("请输入充值金额");
           return;
       }
        if(password==""){
            layer.msg("请输入充值密码");
            return;
        }

       layer.confirm('请再次确认充值用户是否正确<br/>卡号:【' + '${customer.cardNo }' + '】<br/>姓名:【' + '${customer.username }' + '】<br/>充值金额:【' + $("#money").val() + '】',function(index){
           layer.close(index);
           $.ajax({
                url:'${pageContext.request.contextPath }/customer/viDepositCustomer.action',
                type:'post',
               data:{
                    'id':'${customer.id }',
                   'money':money,
                   'password':password
               },
               success:function (data) {
                   layer.msg(data.msg);
                   $("#money").val("");
                   $("#password").val("");

               }
           });
       });

    });

    function checkMoney() {
        var money = $("#money").val();
        if (money == "")
            return;
        var exp = /^(0(\.\d*[1-9])?|[1-9]\d*(\.\d+)?)$/;
        if (!exp.test(money)) {
            layer.msg("充值金额不合法...");
            $("#money").val("");
        }
    };
</script>
  