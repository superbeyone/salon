<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<table class="layui-table" lay-even="" lay-skin="row">
    <colgroup>
        <col width="120">
        <col width="200">
        <col width="120">
        <col>
    </colgroup>
    <thead>
    <tr>

        <th colspan="4" style="text-align: center;">
            【${customer.cardNo }】的详细信息
            <c:if test="${customer.deposit=='1'}">
                <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius " href="${pageContext.request.contextPath }/customer/deposit.html?id=${customer.id}">充值记录</a>
            </c:if>
            <c:if test="${customer.payDate!=null}">
                <%--<a class="layui-btn layui-btn-normal layui-btn-xs layui-btn-radius" href="${pageContext.request.contextPath }/customer/customerCharts.html?id=${customer.id}">消费详情</a>--%>
                <a class="layui-btn layui-btn-radius layui-btn-xs " href="${pageContext.request.contextPath }/customer/charts.html?id=${customer.id}">消费记录</a>
            </c:if>
        </th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>会员卡号:</td>
        <td>
            <span class="form-control">${customer.cardNo }</span>
        </td>
        <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
        <td>
            <span class="form-control">${customer.username }</span>
        </td>
    </tr>
    <tr>
        <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
        <td>
            <span class="form-control"><c:if test="${customer.sex=='1'}">男</c:if><c:if test="${customer.sex=='0'}">女</c:if></span>
        </td>
        <td>出生日期:</td>
        <td>
            <span class="form-control"><fmt:formatDate value='${customer.birthday}' pattern="yyyy-MM-dd"/></span>
        </td>
    </tr>
    <tr>
        <td>余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额:</td>
        <td>
            <span class="form-control">${customer.wallet }￥</span>
        </td>
        <td>上次消费:</td>
        <td>
            <span class="form-control">${customer.payMoney }￥</span>

        </td>
    </tr>
    <tr>
        <td>入驻时间:</td>
        <td>
            <span class="form-control"><fmt:formatDate value='${customer.createDate}' pattern="yyyy-MM-dd HH:mm:ss"/></span>
        </td>
        <td>上次消费时间:</td>
        <td>
            <span class="form-control">
                <c:if test="${customer.payDate!=null}">
                    <fmt:formatDate value='${customer.payDate}' pattern="yyyy-MM-dd HH:mm:ss"/>
                </c:if>
                <c:if test="${customer.payDate==null}">
                    暂无消费记录
                </c:if>
            </span>
        </td>
    </tr>
    <tr>
        <td>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</td>
        <td>
            <span class="form-control">${customer.mobile }</span>
        </td>
        <td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
        <td>
            <span class="form-control">${customer.email }</span>
        </td>
    </tr>
    <tr>
        <td>身份证号:</td>
        <td>
            <span class="form-control">${customer.cIdCard }</span>
        </td>
        <td>校园卡号:</td>
        <td>
            <span class="form-control">${customer.creditCard }</span>
        </td>
    </tr>
    <tr>
        <td>院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系:</td>
        <td>
            <span class="form-control">${customer.college }</span>
        </td>
        <td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:</td>
        <td>
            <span class="form-control">${customer.grade }</span>
        </td>
    </tr>


    </tbody>
</table>


<script src="${pageContext.request.contextPath }/js\jquery.js"></script>

<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>

<%--
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
--%>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--
<script
        src="${pageContext.request.contextPath }/js\behaviour\voice-commands.js"></script>
<script
        src="${pageContext.request.contextPath }/js\bootstrap\dist\js\bootstrap.min.js"></script>
--%>


<%--
<script>
    $("#customerCharts").click(function () {
        var url = "${pageContext.request.contextPath }/customer/customerCharts.html";

        var id = ${customer.id};
        $.ajax({
            url: url,
            type: "post",
            dataType: "json",
            data: {id: id},
            success: function () {
                window.location.replace("/customer/charts");
            }
        });

        href="${pageContext.request.contextPath }/customer/cuctomerCharts.html"
    });


</script>
--%>


	