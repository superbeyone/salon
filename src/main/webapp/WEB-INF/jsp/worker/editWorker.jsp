<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta charset="utf-8">


<table class="layui-table" lay-even="" lay-skin="row">
    <thead>
    <tr>
        <th colspan="4" style="text-align: center;">职员编号为【${worker.entryNo }】的信息如下:</th>
    </tr>
    </thead>
</table>
<form class="layui-form" id="editConsumer" action="${pageContext.request.contextPath }/worker/updateWorkerInfo.action" method="post">

    <input type="hidden" name="id" value="${worker.id }">

    <div class="layui-form-item">
        <label class="layui-form-label">职员编号:</label>
        <div class="layui-input-inline">
            <input type="text" id="entryNo" name="entryNo" value="${worker.entryNo }" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
        <div class="layui-input-inline">
            <input type="text" name="username" value="${worker.username }" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
        <div class="layui-input-inline">
            <input type="text" name="nickname" value="${worker.nickname }" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
        <div class="layui-input-inline">
            <%-- <input type="text" name="sex" value="${worker.sex }" required lay-verify="required"  autocomplete="off" class="layui-input"> --%>
            <input type="radio" name="sex" value="1" title="男"
                   <c:if test="${worker.sex=='1' }">checked</c:if> >
            <input type="radio" name="sex" value="0" title="女" <c:if test="${worker.sex=='0' }">checked</c:if>>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
        <div class="layui-input-inline">
            <input type="number" id="mobile" name="mobile" value="${worker.mobile }" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
        <div class="layui-input-inline">
            <input type="email" id="email" name="email" value="${worker.email }" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">入职日期:</label>
        <div class="layui-input-inline">
            <input type="text" name="entryDateStr" id="date" lay-verify="date"
                   value="<fmt:formatDate value='${worker.entryDate}' pattern="yyyy-MM-dd"/>" autocomplete="on" class="layui-input">
        </div>
        <c:if test="${fn:contains(user.role, '1') }">
            <label class="layui-form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
            <div class="layui-input-inline">
                <select name="role">
                    <option value="1" <c:if test="${worker.role=='1' }">selected</c:if>>老板</option>
                    <option value="2" <c:if test="${worker.role=='2' }">selected</c:if>>经理</option>
                    <option value="3" <c:if test="${worker.role=='3' }">selected</c:if>>职员</option>
                </select>
            </div>
        </c:if>
    </div>


    <div class="layui-form-item">
        <c:if test="${worker.id!=user.id}">
            <label class="layui-form-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
            <div class="layui-input-block">
                <input type="checkbox" name="authority" value="1" title="添加" <c:if test="${fn:contains(worker.authority,'1') }">checked</c:if>>
                <input type="checkbox" name="authority" value="2" title="修改" <c:if test="${fn:contains(worker.authority, '2')}">checked</c:if>>
                <input type="checkbox" name="authority" value="3" title="删除" <c:if test="${fn:contains(worker.authority, '3')}">checked</c:if>>
            </div>
        </c:if>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
        <div class="layui-input-block">
            <textarea name="remark" placeholder="请输入内容" cols="66" rows="4">${worker.remark }</textarea>
        </div>
    </div>
    <div class="layui-form-item ">
        <div class="layui-input-block">
            <button class="layui-btn pull-right" id="submitForm" lay-submit lay-filter="formDemo">提交</button>
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


<%--

<script type="text/javascript">

$(function(){
	window.onload=function(){
		//性别回显
        var sex = "${worker.sex}";
        //console.log(radios);
       // console.log(sex);
        //获取name为role所有的单选框
        var sexs = $("input[name='sex']");
        sexs.each(function(index,ex){
        	if(sex == $(ex).val()){
        		//$(ex).attr("checked",true);
        		console.log($(ex));
        		$(ex).next().addClass("layui-unselect layui-form-radio layui-form-radioed");
        		//$(ex).next().find("i").addClass("layui-anim layui-icon layui-anim-scaleSpring");
        		$(ex).next().empty();
        		if(sex=='1'){
        			$(ex).next().append('<i class="layui-anim layui-icon layui-anim-scaleSpring"></i><span>男</span>')
        		}
        		if(sex=='0'){
        			$(ex).next().append('<i class="layui-anim layui-icon layui-anim-scaleSpring"></i><span>女</span>')
        		}
        	}
        	
        });
	};
});
</script>
--%>


<!-- layUI script begin -->
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
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
                $("#entryNoMsg").html(data.msg);
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
                form.on('submit(editConsumer)', function (data) {
                    //$(".layui-layer layui-layer-iframe").hide();
                    return true;
                });

            });
</script>


<!-- layUI script end -->

	