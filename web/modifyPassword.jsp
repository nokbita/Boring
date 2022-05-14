<%--
  Created by IntelliJ IDEA.
  User: nokbita
  Date: 2022/5/11
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <style>
        .modifyPsdForm {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
    <script src="./js/kong.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/master.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/modify_password.css">
</head>
<body onload="currentDate()">

<div class="header">
    <div class="left">
        <div class="loginAcc">欢迎管理员：${empty loginAcc.getAccount() ? "未登录" : loginAcc.getAccount()} &nbsp;&nbsp;&nbsp;&nbsp;<span id="date"></span></div>
    </div>
    <div class="right">
        <a href="${pageContext.servletContext.contextPath}/Logout.do">退出登录</a>
    </div>
</div>

<div class="content">
    <h3>修改密码</h3>
    <form class="modifyPsdForm" name="modifyPsdForm">
        <input type="text" name="originalPassword" placeholder="原始密码">
        <input type="text" name="newPassword" placeholder="新密码">
        <input type="button" onclick="modifyPsd()" value="确认修改">
    </form>
    <div id="tip"></div>
</div>

<script>
    (function () {
        setInterval(currentDate,1000);
    })();


    function modifyPsd() {
        ajax({
            method: "post",
            url: "${pageContext.servletContext.contextPath}/ModifyPasswordBeforeCheck.do",
            data: {
                originalPassword: document.modifyPsdForm.originalPassword.value,
                newPassword: document.modifyPsdForm.newPassword.value
            },
            success: function (result) {
                let tip = document.getElementById("tip");
                if (result) {
                    tip.style.color = result.tip.color;
                    tip.innerText = result.tip.text;
                    // 修改成功
                    if (result.tip.status === 1) {
                        setTimeout(function () {
                            tip.innerText = "";
                            window.location = "./login.jsp";
                        }, 2000);
                    }
                } else {
                    // 异常处理
                }
            }
        });
    }
</script>
</body>
</html>
