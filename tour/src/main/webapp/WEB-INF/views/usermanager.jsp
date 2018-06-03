<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/29
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.innovation.entity.User"%>
<jsp:useBean id="user" class="com.innovation.entity.User" scope="application"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>

<head>
    <title>Administrator</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="../../statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../statics/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../statics/css/adminstyle.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../../statics/css/adminmain.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">

</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="#"><img src="../../statics/images/logo-dark.png" alt="Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <form class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" value="" class="form-control" placeholder="Search ......">
                    <span class="input-group-btn"><button type="button" class="btn btn-primary">Go</button></span>
                </div>
            </form>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="../../statics/images/cat.jpg" class="img-circle" alt="Avatar"> <span>Inverseli</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
                            <li><a href="#"><i class="lnr lnr-envelope"></i> <span>我的邮件</span></a></li>
                            <li><a href="#"><i class="lnr lnr-cog"></i> <span>设置</span></a></li>
                            <li><a href="#"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="#" class=""><i class="lnr lnr-user"></i> <span>管理用户</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-pencil"></i> <span>修改密码</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-chart-bars"></i> <span>管理游记</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-cog"></i> <span>管理网站信息</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-alarm"></i> <span>审核团游申请</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-dice"></i> <span>查询功能</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-pointer-right"></i> <span>解冻用户</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <!-- MAIN CONTENT -->

    <div class="main">
        <div class="table-responsive">
            <table
                    class="table table-bordered table-striped table-hover table-condensed">
                <tr>
                    <td>用户id</td>
                    <td>用户名</td>
                    <td>邮箱</td>
                    <td>手机号</td>
                    <td>年龄</td>
                    <td>注册时间</td>
                    <td>状态码</td>
                    <td>可执行操作</td>
                </tr>
                <!-- items要进行迭代的集合，var迭代参数的名称 -->
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.userName}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.phone}" /></td>
                        <td><c:out value="${user.age}" /></td>
                        <td><c:out value="${user.regTime}" /></td>
                        <td><c:out value="${user.status}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/deleteById?id=${user.id}"/><input type="button" value="删除" class="btn btn-default"/></a>
                            <input type="button" value="修改" class="btn btn-default" onclick="test(${user.id})"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="../../statics/js/jquery.min.js"></script>
<script src="../../statics/js/bootstrap.min.js"></script>
</body>

</html>
