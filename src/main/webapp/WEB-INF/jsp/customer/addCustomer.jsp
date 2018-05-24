<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<c:import url="../common/head.jsp"></c:import>
<c:import url="../common/menu.jsp"></c:import>--%>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }\js\bootstrap\dist\css\bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.gritter\css\jquery.gritter.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }\fonts\font-awesome-4\css\font-awesome.min.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="http\foxythemes.net\assets\js\MS_6.js"></script>
<script src="http\foxythemes.net\assets\js\MS_7.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.nanoscroller\nanoscroller.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.easypiechart\jquery.easy-pie-chart.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.switch\bootstrap-switch.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.datetimepicker\css\bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\jquery.select2\select2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }\js\bootstrap.slider\css\slider.css" />
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }\css\style.css" rel="stylesheet" />

    <div class="page-head">
        <h2>添加会员</h2>
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">会员信息</a></li>
            <li class="active">新增</li>
        </ol>
    </div>
    <div class="cl-mcont">
        <div class="row">
            <div class="col-md-12">

                <div class="block-flat">
                    <div class="header">
                        <h3>新增会员</h3>
                    </div>
                    <div class="content">
                        <form action="">
                            <input type="hidden" name="cardNo">
                            <input type="hidden" name="username">
                            <input type="hidden" name="wallet">
                        </form>

                        <form class="form-horizontal layui-form " id="customerForm" method="post">


                            <div class=" form-group">
                                <label class="col-sm-4 control-label">会员卡号:*</label>
                                <div class="col-sm-6">
                                    <input type="text" name="cardNo" class="form-control" id="cardNo" required
                                           placeholder="请在此输入会员卡号..." lay-verify="required"/>
                                </div>
                                <span id="cardNoMsg"></span>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:*</label>
                                <div class="col-sm-6">
                                    <input type="text" name="username" id="username" class="form-control" required
                                           placeholder="请在此输入姓名..." lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                                <div class="col-sm-6 layui-input-block">
                                    <input type="radio" name="sex" value="1" title="男" checked="">
                                    <input type="radio" name="sex" value="0" title="女">
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:*</label>
                                <div class="col-sm-6">
                                    <input type="text" name="mobile" id="mobile" class="form-control" required
                                           placeholder="请在此输入手机号..." lay-verify="required"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                                <div class="col-sm-6">
                                    <input type="email" id="email" name="email" class="form-control" required
                                           placeholder="请在此输入邮箱地址..." />
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额:</label>
                                <div class="col-sm-6">
                                    <input type="number" id="wallet" name="wallet" class="form-control" required
                                           placeholder="请在此输入余额金额..." />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">出生日期:</label>
                                <div class="col-sm-6 layui-input-inline">
                                    <input type="text" name="birthdayStr" id="date" required lay-verify="date"
                                           placeholder="请在此选择出生日期..." autocomplete="on" class="layui-input">
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">身份证号:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="cIdCard" class="form-control" required
                                           placeholder="请在此输入身份证号..."/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">校园卡号:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="creditCard" class="form-control" required
                                           placeholder="请在此输入校园卡号..." />
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="college" class="form-control" required
                                           placeholder="请在此输入院系..."/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="grade" class="form-control" required
                                           placeholder="请在此输入年级..."/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                                <div class="col-sm-6">
									<textarea name="remark" placeholder="请在此输入备注信息..."
                                              class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="form-group layui-form-item">
                                <label class="col-sm-4 control-label"></label>
                                <div class="col-sm-6 layui-input-block">
                                    <span class="layui-btn" style="display: none" id="submitSpan" lay-filter="demo1">提&nbsp;&nbsp;交</span>
                                    <button class="layui-btn" lay-submit="" id="submitBtn" lay-filter="demo1">提&nbsp;&nbsp;交</button>
                                    <button type="reset" id="formReset" class="layui-btn layui-btn-primary">重&nbsp;&nbsp;置</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
        </div>

    </div>



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


<!-- layUI script begin -->
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui
        .use(
            ['form', 'layedit', 'laydate'],
            function () {
                var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

                //日期
                laydate.render({
                    elem: '#date'
                });
                laydate.render({
                    elem: '#date1'
                });


                //自定义验证规则
                form.verify({
                    title: function (value) {
                        if (value.length < 5) {
                            return '标题至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    content: function (value) {
                        layedit.sync(editIndex);
                    }
                });

                //监听指定开关
                form.on('switch(switchTest)', function (data) {
                    layer.msg('开关checked：'
                        + (this.checked ? 'true' : 'false'), {
                        offset: '6px'
                    });
                    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
                        data.othis)
                });

                //监听提交
                form.on('submit(demo1)', function (data) {

                    return true;
                });

            });
</script>


<!-- layUI script end -->
<script type="text/javascript">
    $("#cardNo").on("blur", function () {
        if($("#cardNo").val()=="" || $("#cardNo").val()==null){
            return false;
        }
        $.ajax({
            url: '/customer/getCustomerByCardNo.action',
            type: 'post',
            dataType: 'json',
            data: {'cardNo': $("#cardNo").val()},
            success: function (data) {
                $("#cardNoMsg").html(data.msg);
                if (data.status == 200) {
                    $("#submitSpan").hide();
                    $("#submitBtn").show();

                } else {
                    $("#submitSpan").show();
                    $("#submitBtn").hide();
                }
            }
        })
    });


    $("#submitBtn").on("click", function (event) {
         var event = event || window.event;
         event.preventDefault(); // 兼容标准浏览器
        if($("#cardNo").val()=='' || $("#username").val()=='' || $("#mobile").val()=='' ) {
            layer.msg("请先填写关键信息...");
            return false;
        }
            $.ajax({
                url: '/customer/validateCustomer.action',
                type: 'post',
                dataType: 'json',
                data: $("#customerForm").serialize(),
                success: function (data) {
                    layer.confirm(data.msg + ',您接下来的操作是？', {
                        btn: ['继续添加', '查看添加信息'] //按钮
                    }, function () {
                        $("#formReset").click();
                        $("#cardNoMsg").html("");
                        layer.closeAll();

                    }, function () {
                        window.location.href = "/customer/list.html";
                        layer.closeAll();

                    });

                }
            });



    });
</script>
<script>
    $("#mobile").on("blur",function () {
        var mobile = $("#mobile").val();
        if(mobile == "")
            return;
        var  exp=/^[1][3,4,5,7,8][0-9]{9}$/;
        if(!exp.test(mobile)){
            layer.msg("手机号码不合法...");
            $("#mobile").val("");
        }
    });
    $("#email").on("blur",function () {
        var email = $("#email").val();
        var  exp=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if(email == "")
            return;
        if(!exp.test(email)){
            layer.msg("邮箱不合法...");
            $("#email").val("");
        }
    });
    $("#wallet").on("blur",function () {
        var wallet = $("#wallet").val();
        var  exp=/^(0(\.\d*[1-9])?|[1-9]\d*(\.\d+)?)$/;
        if(wallet == "")
            return;
        if(!exp.test(wallet)){
            layer.msg("余额不合法...");
            $("#wallet").val("");
        }
    })
</script>