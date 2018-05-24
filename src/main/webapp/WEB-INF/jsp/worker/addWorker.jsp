<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:import url="../common/head.jsp"></c:import>
<c:import url="../common/menu.jsp"></c:import>--%>
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
<div class="page-head">
    <h2>添加职员</h2>
    <ol class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">职员信息</a></li>
        <li class="active">新增</li>
    </ol>
</div>
<div class="cl-mcont">
    <div class="row">
        <div class="col-md-12">

            <div class="block-flat">
                <div class="header">
                    <h3>新增职员</h3>
                </div>
                <div class="content">
                    <form id="addWorkerInfoForm" class="form-horizontal layui-form"
                          method="POST">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">职员编号:*</label>
                            <div class="col-sm-6">
                                <input type="text" id="entryNo" name="entryNo" class="form-control" required
                                       placeholder="请输入职员编号..."/>
                            </div>
                            <span id="entryNoMsg"></span>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名:*</label>
                            <div class="col-sm-6">
                                <input type="text" name="username" id="username" class="form-control"
                                       placeholder="请输入用户名..." required/>
                            </div>
                            <span id="usernameMsg"></span>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                            <div class="col-sm-6">
                                <input type="text" name="nickname" id="nickname" class="form-control"
                                       placeholder="请输入姓名..."/>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                            <div class="col-sm-6 layui-input-block">
                                <input type="radio" name="sex" value="1" title="男" checked="">
                                <input type="radio" name="sex" value="0" title="女">
                            </div>
                        </div>


                        <%--   <div class="form-group">
                               <label class="col-sm-4 control-label">登录密码:</label>
                               <div class="col-sm-3">
                                   <input type="password" name="password" id="pass2"
                                          class="form-control" placeholder="Password" required/>
                               </div>
                               <div class="col-sm-3">
                                   <input type="password" class="form-control" id="pass3"
                                          data-parsley-equalto="#pass2" placeholder="Re-Type Password"
                                          required/>
                               </div>
                           </div>
                        --%>

                        <div class="form-group">

                            <label class="col-sm-4 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
                            <div class="col-sm-5 layui-input-block">
                                <c:if test="${fn:contains(user.role, '1') }">
                                    <input type="radio" name="role" value="1" title="老板">
                                    <input type="radio" name="role" value="2" title="经理">
                                </c:if>
                                <input type="radio" name="role" value="3" title="职员" checked="">

                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
                            <div class="col-sm-4 layui-input-block">
                                <input type="checkbox" name="authority" value="1" title="添加">
                                <input type="checkbox" name="authority" value="2" title="修改">
                                <input type="checkbox" name="authority" value="3" title="删除">
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">入职日期:</label>
                            <div class="col-sm-6 layui-input-inline">
                                <input type="text" name="entryDateStr" id="date"
                                       lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="on"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
                            <div class="col-sm-6">
                                <input type="text" id="mobile" name="mobile" class="form-control" required
                                       placeholder="请输入手机号..."/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                            <div class="col-sm-6">
                                <input type="email" id="email" name="email" class="form-control"
                                       parsley-type="email" placeholder="请输入邮箱..."/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">家庭住址:</label>
                            <div class="col-sm-6">
                                <input type="text" name="address" class="form-control"
                                       placeholder="请输入家庭地址..."/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-4 control-label">备注信息:</label>
                            <div class="col-sm-6">
    <textarea name="remark" placeholder="请输入备注信息..."
              class="form-control"></textarea>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label"></label>
                            <div class="col-sm-6 layui-input-block">
                                <span class="layui-btn" style="display: none;" id="submitSpan">提&nbsp;&nbsp;交</span>
                                <button class="layui-btn" id="submitBtn">提&nbsp;&nbsp;交</button>
                                <button type="reset" id="formReset" class="layui-btn layui-btn-primary">重&nbsp;&nbsp;置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

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


<!-- layUI层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
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

                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');

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

            });
</script>


<!-- layUI script end -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
        src="${pageContext.request.contextPath }/js\behaviour\voice-commands.js"></script>
<script
        src="${pageContext.request.contextPath }/js\bootstrap\dist\js\bootstrap.min.js"></script>

<script type="text/javascript">
    var entryNoResult;
    var usernameResult;
    $("#entryNo").on("blur", function () {
        if ($("#entryNo").val() == null || $("#entryNo").val() == "") {
            $("#entryNoMsg").html("");
            $("#submitSpan").show();
            $("#submitBtn").hide();

            return false;
        }
        $.ajax({
            url: '/worker/getWorkerByEntryNo.action',
            type: 'post',
            dataType: 'json',
            data: {'entryNo': $("#entryNo").val()},
            success: function (data) {
                entryNoResult = data.status;
                $("#entryNoMsg").html(data.msg);
                checkResult();
            }
        })
    });
    $("#username").on("blur", function () {
        if ($("#username").val() == null || $("#username").val() == "") {
            $("#usernameMsg").html("");
            $("#submitSpan").show();
            $("#submitBtn").hide();

            return false;
        }
        $.ajax({
            url: '/worker/getWorkerByUsername.action',
            type: 'post',
            dataType: 'json',
            data: {'username': $("#username").val()},
            success: function (data) {
                usernameResult = data.status;
                $("#usernameMsg").html(data.msg);
                checkResult();
            }
        })
    });

    function checkResult() {
        if (entryNoResult == 200 && usernameResult == 200) {
            $("#submitSpan").hide();
            $("#submitBtn").show();
        } else {
            $("#submitSpan").show();
            $("#submitBtn").hide();
        }
    }
</script>

<script type="text/javascript">
    $("#submitBtn").on("click", function (event) {
        var event = event || window.event;
        event.preventDefault(); // 兼容标准浏览器
        if ($("#entryNo").val() == null || $("#entryNo").val() == "" || $("#username").val() == "") {
            layer.msg("请先填写关键信息...");
            return false;
        }

        $.ajax({
            url: '/worker/addValidateWorker.action',
            type: 'post',
            dataType: 'json',
            data: $("#addWorkerInfoForm").serialize(),
            success: function (data) {
                layer.confirm(data.msg + ',您接下来的操作是？', {
                    btn: ['继续添加', '查看添加信息'] //按钮
                }, function () {
                    $("#formReset").click();
                    $("#entryNoMsg").html("");
                    layer.closeAll();

                }, function () {
                    window.location.href = "/worker/list.html";
                    layer.closeAll();

                });
            }
        });
    });

    $("#mobile").on("blur", function () {
        var mobile = $("#mobile").val();
        if (mobile == "")
            return;
        var exp = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!exp.test(mobile)) {
            layer.msg("手机号码不合法...");
            $("#mobile").val("");
        }
    });
    $("#email").on("blur", function () {
        var email = $("#email").val();
        var exp = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if (email == "")
            return;
        if (!exp.test(email)) {
            layer.msg("邮箱不合法...");
            $("#email").val("");
        }
    });
</script>

</body>
</html>