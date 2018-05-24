<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/font-awesome-4/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
   <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.gritter/css/jquery.gritter.css" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.nanoscroller/nanoscroller.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.easypiechart/jquery.easy-pie-chart.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.switch/bootstrap-switch.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.select2/select2.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/bootstrap.slider/css/slider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js\dropzone\css\dropzone.css" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />
  
  <form class="layui-form form-horizontal group-border-dashed" >
<table class="layui-table" lay-even="" lay-skin="row">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
	  <tr>
	  	<th colspan="4" style="text-align: center;">消费</th>
	  </tr>
  </thead>
  <tbody>
	  <tr>
	  	<td>会员卡号:${customer.cardNo }</td>
	  	<td>姓名: ${customer.username }</td>
	  </tr>
	 
	  <tr>
	  	<td>余额:${customer.wallet }￥</td>
	  	<td>上次消费时间:
	  	<c:if test="${customer.payDate==null}">
	  	暂无消费记录
	  	</c:if>
	  	<c:if test="${customer.payDate!=null}">
	  	 <fmt:formatDate value='${customer.payDate}' pattern="yyyy-MM-dd HH:mm:ss"/></td>
	  	</c:if>
	  </tr>
	  
	  <tr>
	  	<td>消费类型:<input  name="payProperty" id="payProperty" type="text" class="form-control" required placeholder="请输入消费类型" value="理发"/></td>
	  	<td>操作人:
	  	<select name="workerId" id="workerId">
		  	<c:forEach items="${worker }" var="w">
	             <option  value="${w.id}" >${w.nickname }</option>
		  	</c:forEach>
                     
        </select>
	  	<!-- <input data-parsley-type="number" name="paymoney" type="text" class="form-control" required placeholder="Enter only numbers" />
	  	 -->
	  		</td>
	  	</tr>
	  	<tr>
		  	<td>消费金额:<input data-parsley-type="number" id="payMoney" name="payMoney" type="text" class="form-control" required placeholder="请输入消费金额" /></td>
		  	<td>支付密码:<input type="password" name="password" id="password" required class="form-control"  placeholder="请输入支付密码"></td>
	  	</tr>
	  
  </tbody>
  </table>
  <input type="hidden" name="id" value="${customer.id }">

              <div class="form-group pull-right">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" id="submitBtn" class="btn btn-primary">提交</button>
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
    $("#payMoney").on("blur",function () {
        var money = $("#payMoney").val();
        if(money=="")
            return;
        var  exp=/^(0(\.\d*[1-9])?|[1-9]\d*(\.\d+)?)$/;
        if(!exp.test(money)){
            layer.msg("消费金额不合法...");
            $("#payMoney").val("");
        }
    });

    $("#submitBtn").on("click", function (e) {
        e.preventDefault();
        var money = $("#payMoney").val();
        var password = $("#password").val();
        if(money==""){
            layer.msg("请输入消费金额");
            return;
        }
        if(password==""){
            layer.msg("请输入支付密码");
            return;
        }

        layer.confirm('请再次确认消费用户是否正确<br/>卡号:【' + '${customer.cardNo }' + '】<br/>姓名:【' + '${customer.username }' + '】<br/>消费金额:【' + $("#payMoney").val() + '】',function(index){
            layer.close(index);
            var workerId = $("select").val();
//action="${pageContext.request.contextPath }/customer/viConsumeCustomer.action" method="post"
            $.ajax({
                url:'${pageContext.request.contextPath }/customer/viConsumeCustomer.action',
                type:'post',
                data:{
                    'id':'${customer.id}',
					'payProperty':$("#payProperty").val(),
					'workerId':workerId,
					'payMoney':money,
					'password':password

                },
                success:function (data) {
                    layer.msg(data.msg);
                    $("#payMoney").val("");
                    $("#password").val("");

                }
            });
        });

    });
</script>

  