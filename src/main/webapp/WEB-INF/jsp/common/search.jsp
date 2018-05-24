<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style>
    .layui-table-view select[lay-ignore] {
        height: 26px!important;
        line-height: 20px!important;
    }

</style>
<div class="cl-mcont">
    <div class="main-app">
        <div class="head">
            <h3>Search</h3>
            <!-- <form action="" id="searchForm" method="post"> -->
            <div class="input-group">
                <input id="searchItem" type="text" class="form-control"
                       placeholder="请输入会员卡号或者姓名或者手机号信息..."/> <label
                    class="input-group-btn col-bg-0"> <i
                    class="btn btn-primary fa fa-search" id="searchBtn"></i></label>
            </div>
            <!-- </form> -->
            <div class="pagination"></div>
        </div>
        <br> <br>
        <div class="col-md-11" style="display: none">
            <div class="block-flat" id="block-flat"></div>
        </div>
        <div class="col-md-12" style="display: none">
            <div class="block-flat">
                <div class="header">
                    <h3>会员详情</h3>
                </div>
                <div class="content">
                    <div>
                        <!-- 	 <table class="table table-bordered" id="mytable">
                        </table>
                        <div id="mypage"></div>
                        <hr>
                        <hr>
                        <hr>
                        <hr> -->
                        <div class="layui-btn-group demoTable">
                            <button class="layui-btn" id="checkDemo" data-type="getCheckData">导出</button>
                        </div>
                        <table class="layui-hide" id="customer" lay-filter="customer">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nanoscroller\jquery.nanoscroller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.sparkline\jquery.sparkline.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easypiechart\jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/behaviour\general.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui\jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.nestable\jquery.nestable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.switch\bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.datetimepicker\js\bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.select2\select2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.slider\js\bootstrap-slider.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.gritter\js\jquery.gritter.js"></script>
<!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/pagination/pagination.css" media="all">
<script src="${pageContext.request.contextPath }/pagination/jquery.pagination.js"></script>
<script>
    $("#searchBtn").click(getLayTables);

    function getLayTables() {
        var txt = $("#searchItem").val();
//alert("txt="+txt);
        layui.use('table', function (data) {
            var table = layui.table;
//alert(data);
// console.log("data="+data.code);
            var updatedate = 'updatedate';
            table.render({
                elem: '#customer'
                , filter: 'customer'
                , url: '/customer/searchCustomerPage.action'
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , page: true
                , where: {
                    search: txt
                }
                , cols: [[
                    {checkbox: true}
                    , {field: 'cardNo', width: 100, title: '会员卡号', sort: true}
                    , {field: 'username', width: 100, title: '姓名'}
                    , {
                        field: 'sex', width: 80, title: '性别',
                        templet: '#sex'
                    }
                    , {field: 'mobile', width: 120, title: '手机'}
                    , {field: 'wallet', width: 100, title: '余额', templet: '<div><b style="color: #0a0ccc;">{{d.wallet}}</b>￥</div>'}
                    , {
                        field: 'payMoney', width: 90, title: '上次消费',
                        templet: '<div><span style="color: #cc080a;">{{d.payMoney}}</span>￥</div>'
                    }
//,{field:updateDate,  id:'time',width:100, title: '上次消费时间'}
                    , {title: '操作', width: 230, align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
                ]]
                , response: {
                    statusCode: '200'
                }
                , done: function (data) {
                    if (data.code == 200) {
//alert(data);
                        $(".col-md-11").hide();
                        $(".col-md-12").show();
                    }
                }
            });
//监听表格复选框选择
            table.on('checkbox(customer)', function (obj) {
            });
//监听工具条
            table.on('tool(customer)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'detail') { //查看
//do somehing
//layer.msg('ID：'+ data.id + ' 的查看操作');
                    var uri = '${pageContext.request.contextPath}/customer/viewCustomer.action?id=' + data.id;
                    layer.open({
                        type: 2,
                        title: '会员卡号为【' + data.cardNo + '】的详细信息如下:',
                        area: ['700px', '550px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: uri,
                        btn: ['关闭'] //只是为了演示
                        , btn1: function () {
                            layer.closeAll();
                        }
                        , zIndex: layer.zIndex //重点1
                        , success: function (layero) {
                            layer.setTop(layero); //重点2
                        }
                    });
                } else if (layEvent === 'del') { //删除
                    layer.confirm('真的删除行么', function (index) {
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
//向服务端发送删除指令
                        var uri = '${pageContext.request.contextPath}/customer/deleteCustomer.action';
                        var id = data.id;
                        $.ajax({
                            url: uri,
                            type: 'post',
                            dataType: 'json',
                            data: {id: id}
                        });
                    });
                } else if (layEvent === 'edit') { //编辑
//do something
                    var uri = '${pageContext.request.contextPath}/customer/editCustomer.action?id=' + data.id;
                    layer.open({
                        title: '修改会员卡号为【' + data.cardNo + '】的信息:',
                        type: 2,
                        area: ['700px', '500px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: uri
                        /*  ,btn: ['提交'] //只是为了演示
                        ,btn1: function(data){
                        console.log("data="+data);
                        layer.closeAll();
                        }
                        ,zIndex: layer.zIndex //重点1
                        ,success: function(layero){
                        console.log("data2="+data);
                        //alert("data="+data);
                        layer.setTop(layero); //重点2
                        } */
                    });
                } else if (layEvent === 'deposit') { //充值
                    var uri = '${pageContext.request.contextPath}/customer/showDepositCustomer.action?id=' + data.id;
                    layer.open({
                        title: '会员卡号为【' + data.cardNo + '】的详细信息如下:',
                        type: 2,
                        area: ['700px', '500px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: uri
                    });
                } else if (layEvent === 'consume') { //消费
                    var uri = '${pageContext.request.contextPath}/customer/showConsumeCustomer.action?id=' + data.id;
                    layer.open({
                        title: '会员卡号为【' + data.cardNo + '】的详细信息如下:',
                        type: 2,
                        area: ['700px', '500px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: uri
                    });
                }
            });
            /*   var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
            var checkStatus = table.checkStatus('idTest')
            ,data = checkStatus.data;
            layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
            var checkStatus = table.checkStatus('idTest')
            ,data = checkStatus.data;
            layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
            var checkStatus = table.checkStatus('idTest');
            layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
            }; */
            /*  $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
            });
            */
            var $ = layui.$, active = {
                getCheckData: function () { //获取选中数据
                    var checkStatus = table.checkStatus('customer')
                        , data = checkStatus.data;
                    var array = "";
                    if (data.length <= 0) {
                        layer.alert("请选择所要导出的数据...");
                        return;
                    }
                    for (var i = 0; i < data.length; i++) {
                        array += data[i].id + ",";
                    }
//var json = JSON.stringify(data[0].id);
                    $.ajax({
                        url: '/exportCustomerIds.action',
                        type: 'post',
                        data: {'customerIds': array},
                        success: function (result) {
                            if (result.status == 200) {
                                layer.alert('导出成功...<br><a href="/download/exportCustomers.action" class="layui-btn  layui-btn-normal layui-btn-sm">下 载</a>', {
                                    skin: 'layui-layer-molv' //样式类名
                                    , closeBtn: 0
                                });
                            } else {
                                layer.alert("系统繁忙,导出失败,请稍后重试...");
                            }
                        }
                    })
// layer.alert(array);
                }
            };
            $('#checkDemo').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    }
</script>
<!--
<a class="label label-primary" lay-event="detail" title="修改"><i class="fa fa-pencil"></i></a>
<a class="label label-success" lay-event="edit" title="修改"><i class="fa fa-info-circle"></i></a>
<a class="label label-danger" lay-event="del" title="修改"><i class="fa fa-trash-o"></i></a>
-->
<script type="text/html" id="barDemo">
    <div class="layui-btn-group">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id='detail1'>查看</a>
        <c:if test="${fn:contains(user.authority, '2')}">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        </c:if>
        <c:if test="${fn:contains(user.authority, '3')}">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </c:if>
    </div>
    <div class="layui-btn-group">
        <a class="layui-btn layui-btn-warm layui-btn-radius layui-btn-xs" lay-event="deposit" id='detail'>充值</a>
        <a class="layui-btn layui-btn-radius layui-btn-normal layui-btn-xs" lay-event="consume">消费</a>
    </div>
    <!-- 这里同样支持 laytpl 语法，如： -->
    {{#  if(d.auth > 2){ }}
    <a class="layui-btn layui-btn-mini" lay-event="check">审核</a>
    {{#  } }}
</script>
<script>
</script>
<!-- pagination -->
<!-- <script type="text/javascript">
function pageselectCallback(page_index, jq){
var txt = $("#searchItem").val();
$.ajax({
url : '/salon/customer/searchCustomer.action?page'+page_index,
type : 'post',
dataType : 'json',
data : {
search : txt
}});
alert(page_index);
}
$(document).ready(function pagination(){
$(".pagination").pagination(36, {
callback: pageselectCallback,
//link_to : 'index.html?',
num_edge_entries: 1,
});
});
</script> -->
<script type="text/html" id="sex">
    {{#  if(d.sex == 1){ }}
    <span style="color: #0a0ccc;">男</span>
    {{#  } else { }}
    <span style="color: #c00;">女</span>
    {{#  } }}
</script>