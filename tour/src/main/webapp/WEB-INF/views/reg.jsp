<%--
  Created by IntelliJ IDEA.
  User: Innovation
  Date: 2018/5/21
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册新用户</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }
    </style>
</head>
<body>
    <form class="form-horizontal container form-actions" method="post" action="signin">
        <h2 class="text-center page-header text-info">注册新用户</h2>

        <div class="control-group">
            <div class="control-label">
                <label for="userName">用户名</label>
            </div>
            <div class="controls">
                <input type="text" id="userName" name="userName" required>
            </div>
        </div>
        <div class="control-group ">
            <div class="control-label">
                <label for="regEmail">电子邮箱</label>
            </div>
            <div class="controls">
                <input type="email" id="regEmail" name="email" required>
            </div>
        </div>
        <div class="control-group">
            <div class="control-label">
                <label for="passWord">密码</label>
            </div>
            <div class="controls">
                <input type="password" id="passWord" name="passWord" required>
            </div>
        </div>
        <div class="control-group">
            <div class="control-label">
                <label for="rePassWord">重复密码</label>
            </div>
            <div class="controls">
                <input type="password" id="rePassWord" required>
            </div>
        </div>
        <div class="control-group">
            <div class="control-label">
                <label for="captcha">验证码</label>
            </div>
            <div class="controls">
                <input type="text" id="captcha" name="captcha" required>
                <img id="captchaPicture" src="captcha"/>
                ${info}
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <button class="btn btn-info" type="submit">注册</button>
                <a class="help-inline" href="login">我已经有账号，现在登录</a>
            </div>
        </div>
        <hr/>

    </form>


    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <%--<script src="js/bootstrap.min.js" type="text/javascript"></script>--%>
    <%--<script src="js/user.js" type="text/javascript"></script>--%>

    <script type="text/javascript">
        $("#captchaPicture").click(
            function(){
                $(this).attr("src","<%=request.getContextPath()%>/captcha");
                $("#captcha").val("");
            }
        );
    </script>
</body>
</html>
