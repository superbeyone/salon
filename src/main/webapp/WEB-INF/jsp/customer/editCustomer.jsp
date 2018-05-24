<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta charset="utf-8">




<table class="layui-table" lay-even="" lay-skin="row">
<thead>
	  <tr>
	  	<th colspan="4" style="text-align: center;">会员卡号为【${customer.cardNo }】的信息如下:<button id="updateCustomerPwdBtn" class="layui-btn layui-btn-normal layui-btn-xs layui-btn-radius">修改支付密码</button>
            <button id="editCustomerBtn" style="display: none" class="layui-btn layui-btn-normal layui-btn-xs layui-btn-radius">修改基本信息</button>
        </th>
	  </tr>
  </thead>
 </table>
<form id="updateCustomerPwd" style="display: none;" class="layui-form"  method="post">
	<input type="hidden" name="id" value="${customer.id }">

	<div class="layui-form-item">
		<label class="layui-form-label">原&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
		<div class="layui-input-block">
			<input type="password" name="oldPwd" id="oldPwd"  required lay-verify="required" placeholder="请输入原密码..." autocomplete="off" class="layui-input">
		</div>

	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">新&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
		<div class="layui-input-block">
			<input type="password" name="newPwd" id="newPwd"  lay-verify="required" placeholder="请输入新密码..." autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">确认密码:</label>
		<div class="layui-input-block">
			<input type="password" name="reNewPwd" id="reNewPwd"  lay-verify="required" placeholder="请输入确认密码..." autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" id="submitPwd" lay-submit >立即提交</button>
		</div>
	</div>

</form>
  	<form class="layui-form" id="editConsumer" action="${pageContext.request.contextPath }/customer/updateCustomer.action" method="post">

   <input type="hidden" name="id" value="${customer.id }">

	  <div class="layui-form-item">
	    <label class="layui-form-label">会员卡号:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="cardNo" id="cardNo" value="${customer.cardNo }" required lay-verify="required" placeholder="请输入会员卡号" autocomplete="off" class="layui-input">
			<span id="cardNoMsg"></span>
	    </div>
	    <label class="layui-form-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="username" value="${customer.username }" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
	    <div class="layui-input-inline">
	      <%-- <input type="text" name="sex" value="${customer.sex }" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"> --%>
			<input type="radio" name="sex" value="1" title="男" <c:if test="${customer.sex=='1'}">checked</c:if> >
			<input type="radio" name="sex" value="0" title="女" <c:if test="${customer.sex=='0'}">checked</c:if>>
	    </div>
	    <label class="layui-form-label">出生日期:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="birthdayStr" id="date" lay-verify="date"
										value="<fmt:formatDate value='${customer.birthday}' pattern="yyyy-MM-dd"/>" autocomplete="on" class="layui-input">
	    </div>
	  </div>

	  <div class="layui-form-item">
	    <label class="layui-form-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
	    <div class="layui-input-inline">
	      <input type="text" id="mobile" name="mobile" value="${customer.mobile }" required lay-verify="required" placeholder="请输入手机" autocomplete="off" class="layui-input">
	    </div>
	    <label class="layui-form-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
	    <div class="layui-input-inline">
	      <input type="text" id="email" name="email" value="${customer.email }"  placeholder="请输入邮箱" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">身份证号:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="cIdCard" value="${customer.cIdCard }"  placeholder="请输入身份证号" autocomplete="off" class="layui-input">
	    </div>
	    <label class="layui-form-label">校园卡号:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="creditCard" value="${customer.creditCard }"  placeholder="请输入校园卡号" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="college" value="${customer.college }"  placeholder="请输入院系" autocomplete="off" class="layui-input">
	    </div>
	    <label class="layui-form-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:</label>
	    <div class="layui-input-inline">
	      <input type="text" name="grade" value="${customer.grade }"  placeholder="请输入年级" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
    <div class="layui-input-block">
      <textarea name="remark" placeholder="请输入备注"  cols="66" rows="4" >${customer.remark }</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
   <!--  <input id="submitForm" type="submit" value="提交"> -->
      <button class="layui-btn" id="submitForm" lay-submit lay-filter="formDemo">立即提交</button>
      <span class="layui-btn" id="submitSpan" style="display: none" lay-submit lay-filter="formDemo">立即提交</span>
     <!--  <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
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



<!-- layUI script begin -->
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
	layui
			.use(
					[ 'form', 'layedit', 'laydate' ],
					function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

						//日期
						laydate.render({
							elem : '#date'
						});
						laydate.render({
							elem : '#date1'
						});

						//创建一个编辑器
						var editIndex = layedit.build('LAY_demo_editor');

						//自定义验证规则
						form.verify({
							title : function(value) {
								if (value.length < 5) {
									return '标题至少得5个字符啊';
								}
							},
							pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
							content : function(value) {
								layedit.sync(editIndex);
							}
						});

						//监听指定开关
						form.on('switch(switchTest)', function(data) {
							layer.msg('开关checked：'
									+ (this.checked ? 'true' : 'false'), {
								offset : '6px'
							});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
									data.othis)
						});

						//监听提交
						form.on('submit(editConsumer)', function(data) {
							//$(".layui-layer layui-layer-iframe").hide();
							return true;
						});

					});
</script>


<!-- layUI script end -->
<script type="text/javascript">
    $("#cardNo").on("blur", function () {
        var cardNo = "${customer.cardNo}";

        if($("#cardNo").val()=="" || $("#cardNo").val()==cardNo){
            $("#cardNoMsg").html("");
            $("#submitSpan").hide();
            $("#submitForm").show();
            return;
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
                    $("#submitForm").show();

                } else {
                    $("#submitSpan").show();
                    $("#submitForm").hide();
                }
            }
        })
    });

    $("#submitPwd").click(function(e){
        e.preventDefault();
        var oldPwd = $("#oldPwd").val();
        var newPwd = $("#newPwd").val();
        var reNewPwd = $("#reNewPwd").val();
        if(oldPwd == ""){
            layer.msg("原密码不能为空");
            return;
        }
        if(newPwd == ""){
            layer.msg("新密码不能为空");
            return;
        }
        if(newPwd != reNewPwd){
            layer.msg("新密码和确认密码不一致");
            return;
        }

        $.ajax({
            url:'/customer/updateCustomerPayPwd.action',
            type:'post',
            dataType:'json',
            data:{"id":${customer.id},
                "oldPwd":oldPwd,
                "newPwd":newPwd
            },
            success:function (data) {
                layer.msg(data.msg);
                $("#oldPwd").val("");
                $("#newPwd").val("");
                $("#reNewPwd").val("");
                if(data.status == 200){

                    $("#editConsumer").show();
                    $("#updateCustomerPwd").hide();
                    $("#editCustomerBtn").hide();
                    $("#updateCustomerPwdBtn").show();
                }
            }
        })
    });


    $("#editCustomerBtn").on("click",function changeBtn() {


            $("#editConsumer").show();
            $("#updateCustomerPwd").hide();
            $("#editCustomerBtn").hide();
            $("#updateCustomerPwdBtn").show();



    });
    $("#updateCustomerPwdBtn").on("click",function changeBtn() {

            $("#editConsumer").hide();
            $("#updateCustomerPwd").show();
            $("#editCustomerBtn").show();
            $("#updateCustomerPwdBtn").hide();

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

</script>
	