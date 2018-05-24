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
            <span class="layui-input">${worker.entryNo }</span>
            <%--<input type="text" name="entryNo" value="${worker.entryNo }" required lay-verify="required" autocomplete="off" class="layui-input">--%>
        </div>
        <label class="layui-form-label">帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
        <div class="layui-input-inline">
            <span class="layui-input ">${worker.username }</span>
        </div>
    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
        <div class="layui-input-inline">
            <span class="layui-input ">${worker.nickname }</span>
        </div>
        <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
        <div class="layui-input-inline">
            <c:if test="${worker.sex=='1' }"><span class="layui-input ">男</span></c:if>
            <c:if test="${worker.sex=='0' }"><span class="layui-input ">女</span></c:if>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
        <div class="layui-input-inline">
            <span class="layui-input ">${worker.mobile }</span>
        </div>
        <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
        <div class="layui-input-inline">
            <span class="layui-input ">${worker.email }</span>
        </div>
    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">入职日期:</label>
        <div class="layui-input-inline">
            <span class="layui-input "><fmt:formatDate value='${worker.entryDate}' pattern="yyyy-MM-dd"/> </span>
        </div>
        <label class="layui-form-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
        <div class="layui-input-inline">
                <span class="layui-input ">
                <c:if test="${worker.role=='1' }">老板</c:if>
                <c:if test="${worker.role=='2' }">经理</c:if>
                <c:if test="${worker.role=='3' }">职员</c:if>
                </span>
        </div>
    </div>


    <div class="layui-form-item">

        <label class="layui-form-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
        <div class="layui-input-inline">
            <p class="layui-input ">
                <c:if test="${fn:contains(worker.authority,'1') }"><span class=" btn btn-xs btn-primary layui-btn-radius">添加</span></c:if>
                <c:if test="${fn:contains(worker.authority,'2') }"> <span class="btn btn-xs btn-info layui-btn-radius">修改</span></c:if>
                <c:if test="${fn:contains(worker.authority,'3') }"> <span class="btn btn-xs btn-danger layui-btn-radius">删除</span></c:if>
            </p>
        </div>


    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
        <div class="layui-input-block">
            <textarea cols="66" rows="4">${worker.remark }</textarea>
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

