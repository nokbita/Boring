<%--
  Created by IntelliJ IDEA.
  User: nokbita
  Date: 2022/5/5
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理员登陆页面</title>
    <script src="./js/kong.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/master.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/login.css">
</head>
<body>
<div>测试账号为：001，密码：321</div>

<div class="wrapper">
    <h2>管理员登录</h2>
<%--    <p>让生活充满&nbsp;<b style="/*font-size: 22px;*/">活动</b>&nbsp;的精彩&nbsp;&nbsp;&nbsp;&nbsp;٩(๑❛ᴗ❛๑)۶</p>--%>
    <div class="login-box">
        <div class="left"></div>
        <div class="right">
            <form name="loginForm" class="form">
                <input type="text" name="no" placeholder="账号">
                <input type="password" name="password" placeholder="密码">
                <div class="verify">
                    <input type="text" name="verifyCode" placeholder="验证码">
                    <img id="verifyImg" src="${pageContext.servletContext.contextPath}/verify_code_img.jsp" alt="验证码加载失败" onclick="refresh()">
                </div>
                <div id="tip"></div>
                <input type="button" value="登录" onclick="login()">
                <div class="tip">
                    <a href="#">注册</a>
                    <a href="#">忘记密码？</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    (function () {
        let urlObj = urlParam2Obj(window.location.search);
        if (urlObj) {
            let tip = document.getElementById("tip");
            let htmlSpanElement = document.createElement("span");
            htmlSpanElement.innerText = decodeURI(urlObj.text);
            htmlSpanElement.style.color = urlObj.color;
            tip.appendChild(htmlSpanElement);
            setTimeout(function () {
                document.getElementById("tip").innerHTML = "";
            },2000);
        }
    })();

    function login() {
        document.loginForm.action = "${pageContext.servletContext.contextPath}/VerifyCode.do";
        document.loginForm.method = "post";
        document.loginForm.submit();
    }

    function refresh() {
        document.getElementById("verifyImg").src = "./verify_code_img.jsp?r" + Math.random();
    }
</script>
</body>
</html>
