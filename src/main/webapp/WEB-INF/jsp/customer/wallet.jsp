<%--
  User: super
  Date: 2018/2/21
  Time: 21:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">--%>
<link href="${pageContext.request.contextPath }\js\bootstrap\dist\css\bootstrap.css" rel="stylesheet">


<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${result}" var="r">

    <div class=" alert alert-success fade in align-left">
        于<fmt:formatDate value="${r.customerWallet.payDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
        因<label style="font-style: italic;color:red">${r.customerWallet.payProperty}</label>消费&nbsp;
        <label style="font-style: initial;color:#ff149b">${r.customerWallet.payMoney}</label>&nbsp;￥,服务员: <label style="font-style: initial;color:#0a0ccc">${r.worker.nickname}</label>
        &nbsp;&nbsp;&nbsp;&nbsp;记录者: <label style="font-style: initial;color:#ff0d5e">${r.customerWallet.operator}</label>
    </div>
</c:forEach>
</body>
</html>
