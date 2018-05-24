<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <jsp:include page="../common/head.jsp"></jsp:include> --%>
<%-- <jsp:include page="../common/menu.jsp"></jsp:include> --%>
<c:import url="../common/head.jsp"></c:import>
<c:import url="../common/menu.jsp"></c:import>
<div class="container-fluid" id="pcont">
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
						<h3>修改职员信息</h3>
					</div>
					<div class="content">
						<form id="addWorkerInfoForm"
							class="form-horizontal group-border-dashed layui-form" method="POST">

							<div class="form-group">
								<label class="col-sm-3 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
								<div class="col-sm-6">
									<input type="text" name="username" class="form-control"
										value="${worker.username }" />
								</div>
							</div>
							<div class="form-group">
								<div class="form-group">
								<label class="col-sm-3 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
								<div class="col-sm-6 layui-input-block">
									<input type="radio" name="sex" value="1" title="男" >
									<input type="radio" name="sex" value="0" title="女"> 
								</div>
							</div>

							</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
						<div class="col-sm-6">
							<input type="text" name="nickname" class="form-control"
								value="${worker.nickname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">原密码:</label>
						<div class="col-sm-6">
							<input type="password" name="password" id="pass2"
								class="form-control" />
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-3 control-label">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</label>
									<div class="col-sm-5 layui-input-block">
									<input type="radio" name="role" value="1" title="老板" >
									<input type="radio" name="role" value="2" title="经理"> 
									<input type="radio" name="role" value="3" title="职员"> 
									</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限:</label>
									<div class="col-sm-4 layui-input-block">
										<input type="checkbox" name="authority" value="1" title="添加"> 
										<input type="checkbox" name="authority" value="2" title="修改" > 
										<input	type="checkbox" name="authority" value="3" title="删除">
									</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">家庭住址:</label>
						<div class="col-sm-6">
							<input type="text" name="address" class="form-control"
								value="${worker.address }" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
						<div class="col-sm-6">
							<input type="text" name="mobile" class="form-control"
								value="${worker.mobile }" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
						<div class="col-sm-6">
							<input type="email" name="email" class="form-control"
								parsley-type="email" value="${worker.email }" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">备注信息:</label>
						<div class="col-sm-6">
							<textarea name="remark"
								class="form-control">${worker.remark }</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button class="btn btn-primary" onclick="submitForm()">提&nbsp;&nbsp;交</button>
							<button class="btn btn-default">取&nbsp;&nbsp;消</button>
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
$(function(){
    
    //当页面加载完成的时候，自动调用该方法
    window.onload=function(){
        //获得所要回显的值，
        var checkeds = "${worker.authority}";
        console.log(checkeds);
        //拆分为字符串数组
        var checkArray =checkeds.split(",");
        //获得所有的复选框对象
        var checkBoxAll = $("input[name='authority']");
      //  alert("--------"+checkeds+"===="+checkBoxAll+'-=-=-=-='+checkArray);
        //获得所有复选框（新闻,微信,论坛，问答，博客，平媒）的value值，然后，用checkArray中的值和他们比较，如果有，则说明该复选框被选中
        for(var i=0;i<checkArray.length;i++){
            //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
            $.each(checkBoxAll,function(j,checkbox){
                //获取复选框的value属性
                var checkValue=$(checkbox).val();
                if(checkArray[i]==checkValue){
                    //$(checkbox).attr("checked",true);
                    $(checkbox).next().addClass("layui-unselect layui-form-checkbox layui-form-checked");
                    
                }
            })
        }
        
        
        //职位单选框的回显
        var role = "${worker.role}";
        //console.log(radios);
        //获取name为role所有的单选框
        var roles = $("input[name='role']");
        roles.each(function(index,ex){
        	if(role == $(ex).val()){
        		$(ex).attr("checked",true);
        	}
        	
        });
        //性别回显
        var sex = "${worker.sex}";
        //console.log(radios);
        //获取name为role所有的单选框
        var sexs = $("input[name='sex']");
        sexs.each(function(index,ex){
        	if(sex == $(ex).val()){
        		alert(sex);
        		$(ex).attr("checked",true);
        		//	layui-unselect layui-form-radio layui-form-radioed
        		//	layui-anim layui-icon layui-anim-scaleSpring
        		//$(ex).prev().addClass("layui-unselect layui-form-radio");
        		//$(ex).prev().find("i").addClass("layui-anim layui-icon");
        		$(ex).next().addClass("layui-unselect layui-form-radio layui-form-radioed");
        		$(ex).next().find("i").addClass("layui-anim layui-icon layui-anim-scaleSpring");
        	}
        	
        });

        
    };
});
</script>


    <!-- layUI层 -->
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
</body>
</html>