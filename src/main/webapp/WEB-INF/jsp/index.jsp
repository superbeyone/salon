<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="common/head.jsp"></jsp:include>
<jsp:include page="common/menu.jsp"></jsp:include>
<jsp:include page="common/search.jsp"></jsp:include>






<!-- js引用 -->



<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.gritter/js/jquery.gritter.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/behaviour/general.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.nestable/jquery.nestable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.switch/bootstrap-switch.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.select2/select2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/skycons/skycons.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.slider/js/bootstrap-slider.js"
	type="text/javascript"></script>



<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript">
      $(document).ready(function(){
        //initialize the javascript
        App.init({
          nanoScroller: false
        });
        
        App.dashBoard();        
        
          //introJs().setOption('showBullets', false).start();

      });
    </script>


<script src="${pageContext.request.contextPath }/js/behaviour/voice-commands.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.flot/jquery.flot.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.flot/jquery.flot.pie.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.flot/jquery.flot.resize.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.flot/jquery.flot.labels.js"></script>
	
	
    