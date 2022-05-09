<%--
  Created by IntelliJ IDEA.
  User: nokbita
  Date: 2022/5/5
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>管理学生信息页面</title>
    <script src="./js/kong.js"></script>
</head>
<body>
<%-- 查询学生 --%>
<div>
    <h3>查找学生信息</h3>
    <form name="findStuForm">
        <input type="text" name="findInfo" placeholder="等待输入…">
        条件：
        <select name="findType">
            <option value="0">学号</option>
            <option value="1">姓名</option>
        </select>
        <input type="button" value="查找" onclick="findStu()">
    </form>
</div>

<%-- 展示、修改、删除学生信息--%>
<div>
    <h3>学生信息展示</h3>
    <table id="tableStu">
        <tr>
            <td>order 序号</td>
            <td>no 学号</td>
            <td>password 密码</td>
            <td>name 姓名</td>
            <td>sex 性别</td>
            <td>operation 操作</td>
            <td>Tip 提示</td>
        </tr>
    </table>
</div>

<%-- 添加学生 --%>
<div>
    <h3>添加学生信息span <span id="addStuTip"></span></h3>
    <form name="addStuForm">
        <input type="text" name="no" placeholder="学号">
        <input type="text" name="password" placeholder="密码">
        <input type="text" name="name" placeholder="姓名">
        <select name="sex">
            <option value="1">男</option>
            <option value="0">女</option>
        </select>
        <input type="text" name="grade" placeholder="成绩">
        <input type="button" value="添加" onclick="addStu()">
    </form>
</div>


<script>
    (function () {
        showAllStu();
    })();

/**
 * @param table 表格对象
 * @param students 数组
 */
function generateTableTrs(table,students) {
    for (let i = 0; i < students.length; i++) {
        let tr = document.createElement("tr");

        let noInput = document.createElement("input");
        let passwordInput = document.createElement("input");
        let nameInput = document.createElement("input");
        let sexInput = document.createElement("input");
        let modifyInput = document.createElement("input");
        let deleteInput = document.createElement("input");

        noInput.id = "no" + i;
        noInput.type = "text";
        noInput.value = students[i].no;
        noInput.name = "no";
        noInput.setAttribute("disabled", "true");

        passwordInput.id = "password" + i;
        passwordInput.type = "text";
        passwordInput.value = students[i].password;
        passwordInput.name = "password";
        passwordInput.setAttribute("disabled", "true");

        nameInput.id = "name" + i;
        nameInput.type = "name";
        nameInput.value = students[i].name;
        nameInput.name = "name";
        nameInput.setAttribute("disabled", "true");

        sexInput.id = "sex" + i;
        sexInput.type = "text";
        sexInput.value = students[i].sex;
        sexInput.name = "sex";
        sexInput.setAttribute("disabled", "true");

        modifyInput.id = "modifyBtn" + i;
        modifyInput.type = "button";
        modifyInput.value = "修改";
        modifyInput.setAttribute("onclick", "modifyStu(" + i + ")");

        deleteInput.id = "deleteBtn" + i;
        deleteInput.type = "button";
        deleteInput.value = "删除";
        deleteInput.setAttribute("onclick", "deleteStu(" + i + ")");

        let td1 = document.createElement("td");
        td1.append(i + 1 + "");
        let td2 = document.createElement("td");
        td2.appendChild(noInput);
        let td3 = document.createElement("td");
        td3.appendChild(passwordInput);
        let td4 = document.createElement("td");
        td4.appendChild(nameInput);
        let td5 = document.createElement("td");
        td5.appendChild(sexInput);
        let td6 = document.createElement("td");
        td6.append(modifyInput,deleteInput);
        let td7 = document.createElement("td");
        td7.id = "operationTip" + i;

        tr.append(td1,td2,td3,td4,td5,td6,td7);
        table.insertAdjacentElement("beforeend",tr);
    }
}

// 显示所有学生
function showAllStu() {
    ajax({
        method: "get",
        url: "${pageContext.servletContext.contextPath}/QueryAllStudents.do",
        data: {},
        success: function (result) {
            let tableStu = document.getElementById("tableStu");
            if (result) {
                if (result.tip.status === 1) {
                    generateTableTrs(tableStu, result.students);
                } else {
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    td.colSpan = "7";
                    td.style.width = "100%";
                    td.style.color = result.tip.color;
                    td.innerText = result.tip.text;
                    tr.appendChild(td);
                    tableStu.insertAdjacentElement("afterend",tr);
                }
            } else {
                // 异常处理
            }
        }
    });
}

// 查找学生
function findStu() {
    ajax({
        method: "post",
        url: "<%=request.getContextPath()%>/FindStu.do",
        data: {
            findInfo: document.findStuForm.findInfo.value,
            findType: document.findStuForm.findType.value
        },
        success: function (result) {
            let tableStu = document.getElementById("tableStu");
            if (result) {
                if (result.tip.status === 1) {
                    generateTableTrs(tableStu, result.students);
                } else {
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    td.colSpan = "7";
                    td.style.width = "100%";
                    td.style.color = result.tip.color;
                    td.innerText = result.tip.text;
                    tr.appendChild(td);
                    tableStu.insertAdjacentElement("afterend",tr);
                }
            } else {
                // 异常处理
            }
        }
    });
}

// 添加学生
function addStu() {
    ajax({
        method: "post",
        url: "<%=request.getContextPath()%>/AddStu.do",
        data: {
            no: document.addStuForm.no.value,
            password: document.addStuForm.password.value,
            name: document.addStuForm.name.value,
            sex: document.addStuForm.sex.value,
            grade: document.addStuForm.grade.value,
        },
        success: function (result) {
            let addStuTip = document.getElementById("addStuTip");
            if (result) {
                let span = document.createElement("span");
                span.innerText = result.tip.text;
                span.style.color = result.tip.color;
                addStuTip.appendChild(span);

                if (result.tip.status === 1) {
                    showAllStu();
                }
            } else {
                // 异常处理
            }
        }
    });
}

// 修改学生
function modifyStu(order) {
    // 获取 input 标签对象
    let passwordInput = document.getElementById("password" + order);
    let nameInput = document.getElementById("name" + order);
    let sexInput = document.getElementById("sex" + order);

    // 取消Input禁用状态
    passwordInput.removeAttribute("disabled");
    nameInput.removeAttribute("disabled");
    sexInput.removeAttribute("disabled");

    // 修改按钮的触发函数
    let modifyButton = document.getElementById("modifyBtn" + order);
    modifyButton.setAttribute("value", "确认修改");
    modifyButton.style.color = "red";
    modifyButton.setAttribute("onclick","ensureModifyStu("+ order +")");
}

// 确认修改学生
function ensureModifyStu(order) {
    // 获取 input 标签对象
    let noInput = document.getElementById("no" + order);
    let passwordInput = document.getElementById("password" + order);
    let nameInput = document.getElementById("name" + order);
    let sexInput = document.getElementById("sex" + order);

    // 还原Input禁用状态
    passwordInput.setAttribute("disabled", "true");
    nameInput.setAttribute("disabled", "true");
    sexInput.setAttribute("disabled", "true");

    // 异步请求修改信息
    ajax({
        method: "post",
        url: "<%=request.getContextPath()%>/UpdateBeforeCheck.do",
        data: {
            no: noInput.value,
            password: passwordInput.value,
            name: nameInput.value,
            sex: sexInput.value
        },
        success: function (result) {
            let operationTip = document.getElementById("operationTip" + order);
            if (result) {
                let span = document.createElement("span");
                span.innerText = result.tip.text;
                span.style.color = result.tip.color;
                operationTip.appendChild(span);
                // 清空提示
                setTimeout(function () {
                    document.getElementById("operationTip" + order).innerHTML = "";
                },1000);
            } else {
                // 异常处理
            }
        }
    });

    // 修改回按钮的触发函数
    let ensureModifyButton = document.getElementById("modifyBtn" + order);
    ensureModifyButton.setAttribute("value", "修改");
    ensureModifyButton.style.color = "black";
    ensureModifyButton.setAttribute("onclick","modifyStu("+ order +")");
}

// 删除学生
function deleteStu(order) {
    // 获取 input 标签对象
    let passwordInput = document.getElementById("password" + order);
    let nameInput = document.getElementById("name" + order);
    let sexInput = document.getElementById("sex" + order);

    // 取消Input禁用状态
    passwordInput.removeAttribute("disabled");
    nameInput.removeAttribute("disabled");
    sexInput.removeAttribute("disabled");

    // 修改按钮的触发函数
    let deleteButton = document.getElementById("deleteBtn" + order);
    deleteButton.setAttribute("value", "确定删除");
    deleteButton.style.color = "red";
    deleteButton.setAttribute("onclick","ensureDeleteStu("+ order +")");
}

// 确认删除学生
function ensureDeleteStu(order) {
    // 获取 input 标签对象
    let noInput = document.getElementById("no" + order);
    let passwordInput = document.getElementById("password" + order);
    let nameInput = document.getElementById("name" + order);
    let sexInput = document.getElementById("sex" + order);

    // 还原Input禁用状态
    passwordInput.setAttribute("disabled", "true");
    nameInput.setAttribute("disabled", "true");
    sexInput.setAttribute("disabled", "true");

    // 异步请求删除信息
    ajax({
        method: "post",
        url: "<%=request.getContextPath()%>/DeleteStu.do",
        data: {
            no: noInput.value
        },
        success: function (result) {
            let operationTip = document.getElementById("operationTip" + order);
            if (result) {
                let span = document.createElement("span");
                span.innerText = result.tip.text;
                span.style.color = result.tip.color;
                operationTip.appendChild(span);
                // 清空提示
                setTimeout(function () {
                    document.getElementById("operationTip" + order).innerHTML = "";
                },1000);
            } else {
                // 异常处理
            }
        }
    });

    // 修改按钮的触发函数
    let deleteButton = document.getElementById("deleteBtn" + order);
    deleteButton.setAttribute("value", "删除");
    deleteButton.style.color = "black";
    deleteButton.setAttribute("onclick","deleteStu("+ order +")");
}
</script>
</body>
</html>
