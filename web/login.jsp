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
</head>
<body>
<script>
    function login() {

        return true;
    }
</script>
<div>${param.tip}</div>
<form action="<%=request.getContextPath()%>/VerifyCode.do" method="post" onsubmit="return login()">
    <table>
        <caption>登录，测试账号为：005，密码：123，用户名为竹修</caption>
        <tr><td colspan="2"><input type="text" name="no" placeholder="账号"></td></tr>
        <tr><td colspan="2"><input type="password" name="password" placeholder="密码"></td></tr>
        <tr>
            <td><input type="text" name="verifyCode" placeholder="验证码"></td>
            <td><img id="verifyImg" src="./verify_code_img.jsp" alt="验证码加载失败" width="100" height="20" onclick="refresh()"></td>
        </tr>
        <tr><td colspan="2"><input type="submit" value="登录"></td></tr>
    </table>
</form>
<script>
    function refresh() {
        document.getElementById("verifyImg").src = "./verify_code_img.jsp?r" + Math.random();
    }
</script>
</body>
</html>
