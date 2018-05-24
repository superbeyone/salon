<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>

<!--左导航栏开始-->
		<div class="cl-sidebar" data-position="right" data-step="1" data-intro="<strong>Fixed Sidebar</strong> <br/> It adjust to your needs." >
			<div class="cl-toggle"><i class="fa fa-bars"></i></div>
			<div class="cl-navblock">
        <div class="menu-space">
          <div class="content">
            
            <ul class="cl-vnavigation">
              <li><a href="${pageContext.request.contextPath }/index.html"><i class="fa fa-home"></i><span>企业首页</span></a>
               <!--  <ul class="sub-menu">
                  <li ><a href="index.html">Version 1</a></li>
                  <li><a href="dashboard2.html"><span class="label label-primary pull-right">New</span> Version 2</a></li>
                </ul> -->
              </li>
              <li><a href="#"><i class="fa fa-smile-o"></i><span>会员管理</span></a>
                <ul class="sub-menu">
                  <li><a href="${pageContext.request.contextPath }/customer/addCustomer.html">会员信息添加</a></li>
                  <li><a href="${pageContext.request.contextPath }/customer/list.html">会员信息查询</a></li>
                  <li><a href="" data-toggle="modal" data-target="#myModal">会员信息一键导入</a></li>
                </ul>
              </li>
              <li><a href="#"><i class="fa fa-list-alt"></i><span>职员管理</span></a>
                <ul class="sub-menu">
                  <li><a href="${pageContext.request.contextPath }/worker/addWorker.html">职员信息添加</a></li>
                  <li><a href="${pageContext.request.contextPath }/worker/list.html">职员信息查询</a></li>
                  <li><a href="" data-toggle="modal" data-target="#myModal2">职员信息一键导入</a></li>

                </ul>
              </li>
              <li><a href="#"><i class="fa fa-table"></i><span>待办事项</span></a>
                <ul class="sub-menu">
                  <li><a href="">明日章程</a></li>
                  <li><a href="">代办会议</a></li>
                </ul>
              </li>              
              <li><a href="charts.html"><i class="fa fa-bar-chart-o"></i><span>报表统计</span></a>
              	 <ul class="sub-menu">
                  	<li><a href="${pageContext.request.contextPath }/customer/showCharts.html">会员信息报表</a></li>
                  	<li><a href="${pageContext.request.contextPath }/worker/workerCharts.html">职员信息报表</a></li>
                  </ul>
              </li>
              <li><a href="#"><i class="fa fa-reply-all"></i><span>回收站</span></a>
              	 <ul class="sub-menu">
                  	<li><a href="${pageContext.request.contextPath }/customer/recycleCustomer.html">会员信息</a></li>
                  	<li><a href="${pageContext.request.contextPath }/worker/recycleWorker.html">职员信息</a></li>
                  </ul>
              </li>
             
            </ul>
          </div>
        </div>
        <div class="text-right collapse-button" style="padding:7px 9px;">
          <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
        </div>
			</div>
		</div>
	<!--左导航栏结束-->
	
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					一键导入会员信息
				</h4>
			</div>
			<div class="modal-body">
			     
			      <form action="${pageContext.request.contextPath }/upload/customerInfo.action"  id="uploadCustomerForm" method="post"  enctype="multipart/form-data">
				 <div class="input-group" onclick="uploadCustomerFile()">
					<input  type="file" name="file" id="uploadCustomerInfo" Style="display: none"  > 
					<!--  -->
                	<input type="text"  id="customerSrc" class="form-control"
						placeholder="请选择excel文件" /> <label  id="uploadCustomerBtn"
						class="input-group-btn col-bg-0"> <i
						class="btn btn-primary fa fa-cloud-upload">&nbsp;&nbsp;上传文件</i></label>
                
              	</div> 
			      </form>
				
			    <div class="spacer spacer-bottom">
			    	<a href="${pageContext.request.contextPath }/download/customerTemplet.action"><button id="downloadCustomerTemplet" type="button" onclick="downloadCustomerTemplet();" class="btn btn-success btn-lg btn-rad"><i class="fa fa-cloud-download"></i> 下载模板</button></a>
			    </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button onclick="$('#uploadCustomerForm').submit()" type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabe2">
					一键导入职员信息
				</h4>
			</div>
			<div class="modal-body">
			     
			      <form action="${pageContext.request.contextPath }/upload/workerInfo.action"  id="uploadWorkerForm" method="post"  enctype="multipart/form-data">
				 <div class="input-group" onclick="uploadWorkerFile()">
					<input  type="file" name="file" id="uploadWorkerInfo" Style="display: none"  > 
					<!--  -->
                	<input type="text"  id="workerSrc" class="form-control"
						placeholder="请选择excel文件" /> <label  id="uploadWorkerBtn"
						class="input-group-btn col-bg-0"> <i
						class="btn btn-primary fa fa-cloud-upload">&nbsp;&nbsp;上传文件</i></label>
                
              	</div> 
			      </form>
				
			    <div class="spacer spacer-bottom">
			    	<a href="${pageContext.request.contextPath }/download/workerTemplet.action"><button id="downloadWorkerTemplet" type="button" onclick="downloadWorkerTemplet();" class="btn btn-success btn-lg btn-rad"><i class="fa fa-cloud-download"></i> 下载模板</button></a>
			    </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button onclick="$('#uploadWorkerForm').submit()" type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript">
<!--

//-->

/* $("#uploadWorkerFile").addEventListener('change',readFle,false);
$("#uploadWorkerBtn").click(function(){
	$("#uploadWorkerFile").click();
	var file = this.files[0];
	var reader = new FileReader(); 
	  	  reader.readAsDataURL(file); 
	    
	  	  reader.onload = function(e){ 
		  var arr = input.value.split('\\');
		  document.getElementById('workerSrc').value = arr[arr.length-1]; //取数组最后部分
	  	
	  }
}); */
</script>

<!-- 上传会员信息 -->
 <script type="text/javascript"> 
  var inputc = document.getElementById("uploadCustomerInfo"); 

  inputc.addEventListener('change',readFile,false); 
 function uploadCustomerFile(){ 
  document.getElementById('uploadCustomerInfo').click(); //打开<input type="file" id="uploadWorkerInfo" /> 
  }    
 
 function readFile(){ 
	  var file = this.files[0]; 
	  if(!/application\/\w+/.test(file.type)){ 
		   alert("请确保文件为Excel类型"); 
		   return false; 
		  }
	  var reader = new FileReader();
		console.log("file="+file);
		//alert("fileName="+file.name);
	  reader.readAsBinaryString(file); 
	  reader.onload = function(e){ 
	   var arr = input.value.split('\\'); //分割路径 
	   //alert(arr);
	   //document.getElementById('customerSrc').value = arr[arr.length-1]; //取数组最后部分 -文件名
	   document.getElementById('customerSrc').value = file.name; //取数组最后部分 -文件名
	  //$("#uploadWorkerForm").submit();
	   var fileName = file.name.split('.');
	   var extName = fileName[fileName.length-1];
	   console.log(extName);
	   //alert(e.target.result);

	  } 
	 }
 
 
</script>
 

<!-- 上传职员信息 -->
 <script type="text/javascript"> 
  var input = document.getElementById("uploadWorkerInfo"); 

  input.addEventListener('change',readFile,false); 
 function uploadWorkerFile(){ 
  document.getElementById('uploadWorkerInfo').click(); //打开<input type="file" id="uploadWorkerInfo" /> 
  }    
 
 function readFile(){ 
  var file = this.files[0]; 
  if(!/application\/\w+/.test(file.type)){ 
	   alert("请确保文件为Excel类型"); 
	   return false; 
	  }
  var reader = new FileReader();
	console.log(file);
  reader.readAsBinaryString(file); 
  reader.onload = function(e){ 
   var arr = input.value.split('\\'); //分割路径 
   document.getElementById('workerSrc').value = arr[arr.length-1]; //取数组最后部分 -文件名
  //$("#uploadWorkerForm").submit();
   var fileName = file.name.split('.');
   var extName = fileName[fileName.length-1];
   console.log(extName);
   //alert(e.target.result);

  } 
 } 
 function uploadWorker(){
	 $.post("${pageContext.request.contextPath }/upload/workerInfo.action",$("#uploadWorkerForm").serialize(),function(data){
			if(data.status == 200){
				$.message.alert("提示","职员添加成功!");
			}else{
				$.message.alert("警告","职员添加失败!");
			}
		});
 }
 
 
</script>
 
 

    
    
    <!-- layer层 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.mobile.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
    