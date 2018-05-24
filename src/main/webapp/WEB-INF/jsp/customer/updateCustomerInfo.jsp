<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../common/head.jsp"></c:import>
<c:import url="../common/menu.jsp"></c:import>

<div class="container-fluid" id="pcont">
    <div class="page-head">
        <h2>添加会员</h2>
        <ol class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li><a href="#">会员信息</a></li>
            <li class="active">修改</li>
        </ol>
    </div>
    <div class="cl-mcont">
        <div class="row">
            <div class="col-md-12">

                <div class="block-flat">
                    <div class="header">
                        <h3>修改会员</h3>
                    </div>
                    <div class="content">
                        <form action="">
                            <input type="hidden" name="cardno">
                            <input type="hidden" name="username">
                            <input type="hidden" name="wallet">
                        </form>

                        <form class="form-horizontal layui-form " id="customerForm" action="${pageContext.request.contextPath }/customer/updateCustomer.action" method="post">


                            <div class=" form-group">
                                <label class="col-sm-4 control-label">会员卡号:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="cardno" id="cardNo" class="form-control" required
                                           value="${customer.cardNo }"/>
                                    <span id="cardNoMsg"></span>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="username" class="form-control" required
                                           value="${customer.username }"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                                <div class="col-sm-6 layui-input-block">
                                    <input type="radio" name="sex" value="1" title="男">
                                    <input type="radio" name="sex" value="0" title="女">
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="wallet" class="form-control" required
                                           value="${customer.wallet }"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">出生日期:</label>
                                <div class="col-sm-6 layui-input-inline">

                                    <input type="text" name="birthdayStr" id="date" lay-verify="date"
                                           value="<fmt:formatDate value='${customer.birthday}' type='date'/>" autocomplete="on" class="layui-input">
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">身份证号:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="cIdCard" class="form-control" required
                                           value="${customer.cIdCard }"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">校园卡号:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="creditCard" class="form-control" required
                                           value="${customer.creditCard }"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="college" class="form-control" required
                                           value="${customer.college }"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:</label>
                                <div class="col-sm-6">
                                    <input type="text" name="grade" class="form-control" required
                                           value="${customer.grade }"/>
                                </div>
                            </div>
                            <div class=" form-group">
                                <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                                <div class="col-sm-6">
                                    <textarea name="remark">${customer.remark }</textarea>
                                </div>
                            </div>

                            <div class="form-group layui-form-item">
                                <label class="col-sm-4 control-label"></label>
                                <div class="col-sm-6 layui-input-block">
                                    <button class="layui-btn" lay-submit="" id="" lay-filter="demo1">提&nbsp;&nbsp;交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重&nbsp;&nbsp;置</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
        </div>

    </div>
</div>


<script type="text/javascript">

    $(function () {
        window.onload = function () {
            //性别回显
            var sex = "${customer.sex}";
            //console.log(radios);
            console.log(sex);
            //获取name为role所有的单选框
            var sexs = $("input[name='sex']");
            sexs.each(function (index, ex) {
                if (sex == $(ex).val()) {
                    //$(ex).attr("checked",true);
                    $(ex).next().addClass("layui-unselect layui-form-radio layui-form-radioed");
                    $(ex).next().find("i").addClass("layui-anim layui-icon layui-anim-scaleSpring");
                }

            });
        };
    });
</script>


<!-- layer层 -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath }/layui/css/layui.css"
      media="all">

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

                //监听提交
                form.on('submit(demo1)', function (data) {

                    return true;
                });

            });
</script>


<!-- layUI script end -->

<script>
    $("#cardNo").on("blur", function () {
        alert("------");
        if ($("#cardNo").val() == "" || $("#cardNo").val() == null || $("#cardNo").val() ==${customer.cardNo}) {
            return false;
        }
        $.ajax({
            url: '/customer/getCustomerByCardNo.action',
            type: 'post',
            dataType: 'json',
            data: {'cardNo': $("#cardNo").val()},
            success: function (data) {
                $("#cardNoMsg").html(data.msg);
                // if (data.status == 200) {
                //     $("#submitSpan").hide();
                //     $("#submitBtn").show();
                //
                // } else {
                //     $("#submitSpan").show();
                //     $("#submitBtn").hide();
                // }
            }
        })
    });
</script>
