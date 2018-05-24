<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <h2>修改密码</h2>
</div>
<div class="cl-mcont">
    <div class="row">
        <div class="col-md-12">
            <div class="" role="tabpanel" data-example-id="togglable-tabs">

                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                        <!-- start recent activity -->
                        <div class="x_content">
                            <br/>
                            <form id="form1" data-parsley-validate class="form-horizontal form-label-left">

                                <div class="item form-group">
                                    <label for="oldLoginPassword" class="control-label col-md-3">原&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="oldLoginPassword" type="password" name="oldPassword" data-validate-length="6,18" class="form-control col-md-7 col-xs-12" required="required">
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="password" class="control-label col-md-3">新&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="password" type="password" name="password" data-validate-length="6,18" class="form-control col-md-7 col-xs-12" required="required">
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">确认密码:</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="password2" type="password" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button id="form1Btn" type="submit" class="btn btn-success">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- end recent activity -->

                    </div>


                </div>
            </div>
            <%-- <div id="editWorkerInfo" style="display: none" class="block-flat">
                 <div class="header">
                     <h3>修改个人信息</h3>
                     <button id="viewBtn" class="btn-xs btn btn-info pull-right">查看个人信息</button>
                 </div>
                 <div class="content">
                     <form id="editWorkerInfoForm" class="form-horizontal layui-form"
                           method="POST">
                         <input type="hidden" name="id" value="${worker.id}">
                         <div class="form-group">
                             <label class="col-sm-4 control-label">职员编号:</label>
                             <div class="col-sm-6">

                                 <span class="form-control">${worker.entryNo} </span>
                                &lt;%&ndash; <input type="text" id="entryNo" name="entryNo" class="form-control" required
                                        placeholder="Type something"/>&ndash;%&gt;
                             </div>
                             <span id="entryNoMsg"></span>

                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">系统账号:</label>
                             <div class="col-sm-6">
                                 <span class="form-control">${worker.username} </span>
                                 &lt;%&ndash;<input type="text" name="username" id="username" class="form-control"
                                        placeholder="Type something" required/>&ndash;%&gt;
                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                             <div class="col-sm-6">
                                 <input type="text" name="nickname" id="nickname" class="form-control"
                                       value="${worker.nickname}"/>
                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                             <div class="col-sm-6 layui-input-block">
                                 <input type="radio" name="sex" value="1" title="男" <c:if test="${worker.sex==1}">checked</c:if>>
                                 <input type="radio" name="sex" value="0" title="女" <c:if test="${worker.sex==0}">checked</c:if>>
                             </div>
                         </div>
                        &lt;%&ndash; <div class="form-group">

                             <label class="col-sm-4 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
                             <div class="col-sm-5 layui-input-block">
                                 <input type="radio" name="role" value="1" title="老板">
                                 <input type="radio" name="role" value="2" title="经理"> <input
                                     type="radio" name="role" value="3" title="职员" checked="">
                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
                             <div class="col-sm-4 layui-input-block">
                                 <input type="checkbox" name="authority" value="1" title="添加">
                                 <input type="checkbox" name="authority" value="2" title="修改">
                                 <input type="checkbox" name="authority" value="3" title="删除">
                             </div>

                         </div>&ndash;%&gt;
                         <div class="form-group">
                             <label class="col-sm-4 control-label">入职日期:</label>
                             <div class="col-sm-6 layui-input-inline">
                                 <input type="text" name="entryDateStr" id="date"
                                        lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="on"
                                        class="layui-input" value="<fmt:formatDate value="${worker.entryDate}" pattern="yyyy-MM-dd"></fmt:formatDate>" >
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
                             <div class="col-sm-6">
                                 <input type="text" name="mobile" class="form-control" required
                                        placeholder="Type something" value="${worker.mobile}"/>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">家庭住址:</label>
                             <div class="col-sm-6">
                                 <input type="text" name="address" class="form-control"
                                        placeholder="Type something" value="${worker.address}"/>
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                             <div class="col-sm-6">
                                 <input type="email" name="email" class="form-control"
                                        parsley-type="email" placeholder="Enter a valid e-mail" value="${worker.email}"/>
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">备注信息:</label>
                             <div class="col-sm-6">
                                     <textarea name="remark" placeholder="Type something"
                                               class="form-control">${worker.remark}</textarea>
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
             <div id="viewWorkerInfo" class="block-flat">
                 <div class="header">
                     <h3>查看个人信息</h3>
                     <button id="editBtn" class="btn-xs btn btn-primary pull-right">修改个人信息</button>
                 </div>
                 <div class="content">

                     <form   class="form-horizontal layui-form"
                           method="POST">
                         <div class="form-group">
                             <label class="col-sm-4 control-label">职员编号:</label>
                             <div class="col-sm-6">
                                 <span class="form-control">${worker.entryNo} </span>

                             </div>


                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">系统账号:</label>
                             <div class="col-sm-6">
                                 <span class="form-control">${worker.username} </span>

                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                             <div class="col-sm-6">
                                <span class="form-control">${worker.nickname}</span>
                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                             <div class="col-sm-6 layui-input-block">
                                 <input type="radio" name="sex" value="1" title="男" <c:if test="${worker.sex==1}">checked</c:if>>
                                 <input type="radio" name="sex" value="0" title="女" <c:if test="${worker.sex==0}">checked</c:if>>
                             </div>
                         </div>
                        &lt;%&ndash; <div class="form-group">

                             <label class="col-sm-4 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
                             <div class="col-sm-5 layui-input-block">
                                 <input type="radio" name="role" value="1" title="老板">
                                 <input type="radio" name="role" value="2" title="经理"> <input
                                     type="radio" name="role" value="3" title="职员" checked="">
                             </div>

                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
                             <div class="col-sm-4 layui-input-block">
                                 <input type="checkbox" name="authority" value="1" title="添加">
                                 <input type="checkbox" name="authority" value="2" title="修改">
                                 <input type="checkbox" name="authority" value="3" title="删除">
                             </div>

                         </div>&ndash;%&gt;
                         <div class="form-group">
                             <label class="col-sm-4 control-label">入职日期:</label>
                             <div class="col-sm-6 layui-input-inline">
                                 <span class="form-control" ><fmt:formatDate value="${worker.entryDate}" pattern="yyyy-MM-dd"></fmt:formatDate>" </span>
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
                             <div class="col-sm-6">
                                 <span class="form-control" >${worker.mobile}</span>
                             </div>
                         </div>
                         <div class="form-group">
                             <label class="col-sm-4 control-label">家庭住址:</label>
                             <div class="col-sm-6">
                                 <span class="form-control" >${worker.address}"</span>
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                             <div class="col-sm-6">
                                 <span class="form-control" >${worker.email}"</span>
                             </div>
                         </div>

                         <div class="form-group">
                             <label class="col-sm-4 control-label">备注信息:</label>
                             <div class="col-sm-6">
                                     <span class="form-control" >${worker.remark} </span>
                             </div>
                         </div>

                     </form>
                 </div>
             </div>--%>

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


<!-- layUI script end -->



<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
        src="${pageContext.request.contextPath }/js\behaviour\voice-commands.js"></script>
<script
        src="${pageContext.request.contextPath }/js\bootstrap\dist\js\bootstrap.min.js"></script>


<script type="text/javascript">
    $("#form1Btn").on("click", function (event) {
        var event = event || window.event;
        event.preventDefault();
        var oldLoginPassword = $("#oldLoginPassword").val();
        var password = $("#password").val();
        var password2 = $("#password2").val();

        if (oldLoginPassword == "") {
            layer.msg("原密码不能为空");
            return;
        }
        if (password != password2) {
            layer.msg("新密码与确认密码不匹配");
            return;
        }
        if (password == "") {
            layer.msg("新密码不能为空");
            return;
        }
        $.ajax({
            url: '/worker/updateWorkerLoginPwd.action',
            type: 'post',
            dataType: 'json',
            data: {"oldPwd": oldLoginPassword, "newPwd": password},
            success: function (data) {
                $("#oldLoginPassword").val("");
                $("#password").val("");
                $("#password2").val("");
                layer.msg(data.msg);
            }
        })

    });

</script>

</body>
</html>