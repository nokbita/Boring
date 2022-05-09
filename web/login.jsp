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
    <style>
        input {
            width: 100%;
        }
    </style>
    <script src="./js/kong.js"></script>
</head>
<body>
<div>测试账号为：005，密码：123</div>
<form name="loginForm">
    <table>
        <caption>登录</caption>
        <tr><td colspan="2"><input type="text" name="no" placeholder="账号"></td></tr>
        <tr><td colspan="2"><input type="password" name="password" placeholder="密码"></td></tr>
        <tr>
            <td><input type="text" name="verifyCode" placeholder="验证码"></td>
            <td><img id="verifyImg" src="./verify_code_img.jsp" alt="验证码加载失败" width="100" height="20" onclick="refresh()"></td>
        </tr>
        <tr><td colspan="2"><input type="button" value="登录" onclick="login()"></td></tr>
        <tr><td colspan="2" id="tip"></td></tr>
    </table>
</form>
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
            },1000);
        }
    })();

    function login() {
        document.loginForm.action = "<%=request.getContextPath()%>/VerifyCode.do";
        document.loginForm.method = "post";
        document.loginForm.submit();
    }

    function refresh() {
        document.getElementById("verifyImg").src = "./verify_code_img.jsp?r" + Math.random();
    }
</script>
</body>
</html>
