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
    <title>信息管理页面</title>
    <script src="./js/kong.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/master.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/style/manage_info.css">
</head>
<body onload="currentDate()">

<%-- 蒙版 --%>
<div class="mask"></div>
<%-- 添加 --%>
<div class="add">
    <form name="addStuForm">
        <div id="addStuTip"></div>
        <input type="text" name="wno" placeholder="仓库号">
        <input type="text" name="wname" placeholder="仓库名">
        <input type="text" name="location" placeholder="仓库位置">
        <input type="text" name="square" placeholder="仓库面积">
        <input type="text" name="manager" placeholder="仓库管理员">
        <div class="add-btn">
            <input type="button" value="添加" onclick="addStu()">
            <input type="button" value="取消" onclick="closeAddFrame()">
        </div>
    </form>
</div>

    <div class="header">
        <div class="left">
            <div class="loginAcc">欢迎管理员：${empty loginAcc.getAccount() ? "未登录" : loginAcc.getAccount()} &nbsp;&nbsp;&nbsp;&nbsp;<span id="date"></span></div>
        </div>
        <div class="right">
            <a href="${pageContext.servletContext.contextPath}/modifyPassword.jsp">修改密码</a>
            <a href="${pageContext.servletContext.contextPath}/Logout.do">退出登录</a>
        </div>
    </div>

    <div class="content">
        <%-- 查询 --%>
        <div class="search">
            <form name="findStuForm">
                <select name="findType">
                    <option value="0">仓库号</option>
                    <option value="1">仓库名</option>
                </select>
                <span>：</span>
                <input type="text" name="findInfo" placeholder="查找...">
                <input type="button" value="查找" onclick="findStu()">
            </form>

            <%-- 添加按钮，展示添加页面 --%>
            <button id="add" onclick="openAddFrame()">添加</button>
        </div>

        <%-- 展示、修改、删除--%>
        <div class="show-result">
            <table id="tableStu">
                <tr>
                    <th>序号</th>
                    <th>仓库号</th>
                    <th>仓库名</th>
                    <th>仓库位置</th>
                    <th>仓库面积</th>
                    <th>仓库管理员</th>
                    <th>操作</th>
                    <th>提示</th>
                </tr>
                <tbody id="tbodyData"></tbody>
            </table>
        </div>
    </div>

<script>
// 首次访问本页，直接展示所有学生
(function () {
    showAllStu();
    setInterval(currentDate,1000);
})();


function openAddFrame() {
    let add = document.getElementsByClassName("add")[0];
    let mask = document.getElementsByClassName("mask")[0];
    add.style.display = "block";
    mask.style.display = "block";
    document.addStuForm.wno.value = "";
    document.addStuForm.wname.value = "";
    document.addStuForm.location.value = "";
    document.addStuForm.square.value = "";
    document.addStuForm.manager.value = "";
}

function closeAddFrame() {
    let add = document.getElementsByClassName("add")[0];
    let mask = document.getElementsByClassName("mask")[0];
    add.style.display = "none";
    mask.style.display = "none";
}

function currentDate() {
    let date = new Date();
    let fullYear = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let week = date.getDay();
    let hours = date.getHours();
    let minutes = date.getMinutes();
    let seconds = date.getSeconds();
    let seconds2 = seconds < 10 ? "0" + seconds : seconds;

    let elementDate = document.getElementById("date");
    elementDate.innerText = fullYear + "年" + month + "月" + day + "日 " +
        hours + ":" + minutes + ":" + seconds2;
}

// 给 table 的 tbody 添加动态效果
function tbodyAddDynamicEffect(tbody,color) {
    tbody.style.backgroundColor = color;
    setTimeout(function () {
        tbody.style.backgroundColor = "transparent";
    },500);
}
/**
 * @param tbody 表格体对象
 * @param students 数组
 */
function generateTableTrs(tbody,students) {
    for (let i = 0; i < students.length; i++) {
        let tr = document.createElement("tr");

        let wnoInput = document.createElement("input");
        let wnameInput = document.createElement("input");
        let locationInput = document.createElement("input");
        let squareInput = document.createElement("input");
        let managerInput = document.createElement("input");

        // let squareInput1 = document.createElement("select");
        // let optionEmpty = document.createElement("option");
        // let optionMale = document.createElement("option");
        // let optionFemale = document.createElement("option");

        let modifyInput = document.createElement("input");
        let deleteInput = document.createElement("input");

        wnoInput.id = "wno" + i;
        wnoInput.type = "text";
        wnoInput.value = students[i].wno;
        wnoInput.name = "wno";
        wnoInput.setAttribute("disabled", "true");

        wnameInput.id = "wname" + i;
        wnameInput.type = "text";
        wnameInput.value = students[i].wname;
        wnameInput.name = "wname";
        wnameInput.setAttribute("disabled", "true");

        locationInput.id = "location" + i;
        locationInput.type = "text";
        locationInput.value = students[i].location;
        locationInput.name = "location";
        locationInput.setAttribute("disabled", "true");

        squareInput.id = "square" + i;
        squareInput.type = "text";
        squareInput.value = students[i].square;
        squareInput.name = "square";
        squareInput.setAttribute("disabled", "true");

        managerInput.id = "manager" + i;
        managerInput.type = "text";
        managerInput.value = students[i].manager;
        managerInput.name = "manager";
        managerInput.setAttribute("disabled", "true");

        // squareInput1.id = "sex" + i;
        // optionEmpty.innerText = "未设置";
        // optionMale.value = "1";
        // optionMale.innerText = "男";
        // optionFemale.value = "0";
        // optionFemale.innerText = "女";
        // if (students[i].sex === "1" || students[i].sex === "0") {
        //     if (students[i].sex === "1") {
        //         optionMale.setAttribute("selected", "true");
        //     }
        //     if (students[i].sex === "0") {
        //         optionFemale.setAttribute("selected", "true");
        //     }
        // } else {
        //     optionEmpty.setAttribute("selected", "true");
        // }
        // squareInput1.append(optionEmpty, optionMale, optionFemale);
        // squareInput1.name = "sex";
        // squareInput1.setAttribute("disabled", "true");

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
        td2.appendChild(wnoInput);
        let td3 = document.createElement("td");
        td3.appendChild(wnameInput);
        let td4 = document.createElement("td");
        td4.appendChild(locationInput);
        let td5 = document.createElement("td");
        td5.appendChild(squareInput);
        let td51 = document.createElement("td");
        td51.appendChild(managerInput);
        let td6 = document.createElement("td");
        td6.append(modifyInput,deleteInput);
        let td7 = document.createElement("td");
        td7.id = "operationTip" + i;

        tr.append(td1,td2,td3,td4,td5,td51,td6,td7);
        tbody.appendChild(tr);

        tbodyAddDynamicEffect(tbody, "green");
    }
}

// 显示所有学生
function showAllStu() {
    ajax({
        method: "get",
        url: "${pageContext.servletContext.contextPath}/QueryAllStudents.do",
        data: {},
        success: function (result) {
            let tbody = document.getElementById("tbodyData");
            if (result) {
                tbody.innerHTML = "";
                if (result.tip.status === 1) {
                    generateTableTrs(tbody, result.students);
                } else {
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    td.colSpan = "8";
                    td.style.width = "100%";
                    td.style.color = result.tip.color;
                    td.innerText = result.tip.text;
                    tr.appendChild(td);
                    tbody.appendChild(tr);
                    // 添加动态效果
                    tbodyAddDynamicEffect(tbody,"red");
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
        url: "${pageContext.servletContext.contextPath}/FindStu.do",
        data: {
            findInfo: document.findStuForm.findInfo.value,
            findType: document.findStuForm.findType.value
        },
        success: function (result) {
            let tbody = document.getElementById("tbodyData");
            if (result) {
                tbody.innerHTML = "";
                if (result.tip.status === 1) {
                    generateTableTrs(tbody, result.students);
                } else {
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    td.colSpan = "8";
                    td.style.width = "100%";
                    td.style.color = result.tip.color;
                    td.innerText = result.tip.text;
                    tr.appendChild(td);
                    tbody.appendChild(tr);
                    // 添加动态效果
                    tbodyAddDynamicEffect(tbody,"red");
                    // 清空查询框
                    document.findStuForm.findInfo.value = "";
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
        url: "${pageContext.servletContext.contextPath}/AddBeforeCheck.do",
        data: {
            wno: document.addStuForm.wno.value,
            wname: document.addStuForm.wname.value,
            location: document.addStuForm.location.value,
            square: document.addStuForm.square.value,
            manager: document.addStuForm.manager.value,
        },
        success: function (result) {
            let addStuTip = document.getElementById("addStuTip");
            if (result) {
                let span = document.createElement("span");
                span.innerText = result.tip.text;
                span.style.color = result.tip.color;
                addStuTip.appendChild(span);
                // 添加成功，刷新展示学生信息
                if (result.tip.status === 1) {
                    // 清空提示
                    setTimeout(function () {
                        addStuTip.innerText = "";
                        closeAddFrame();
                        showAllStu();
                    }, 1000);
                }

                // 清空提示
                setTimeout(function () {
                    addStuTip.innerText = "";
                }, 1000);
            } else {
                // 异常处理
            }
        }
    });
}

// 修改按钮状态转换
function modify2Transition(order) {
    // 修改 modifyBtn 按钮的触发函数 ModifyStu --> cancelModifyStu
    let modifyButton = document.getElementById("modifyBtn" + order);
    modifyButton.setAttribute("value", "取消修改");
    modifyButton.style.backgroundColor = "green";
    modifyButton.style.color = "#fff";
    modifyButton.setAttribute("onclick","cancelModifyStu("+ order +")");

    // 修改 deleteBtn 按钮的触发函数 deleteStu --> ensureModifyStu
    let deleteButton = document.getElementById("deleteBtn" + order);
    deleteButton.setAttribute("value", "确认修改");
    deleteButton.style.backgroundColor = "red";
    modifyButton.style.color = "#fff";
    deleteButton.setAttribute("onclick","ensureModifyStu("+ order +")");
}
// 删除按钮状态转换
function delete2transition(order) {
    // 修改 deleteBtn 按钮的触发函数 deleteStu --> cancelDeleteStu
    let modifyButton = document.getElementById("deleteBtn" + order);
    modifyButton.setAttribute("value", "取消删除");
    modifyButton.style.backgroundColor = "green";
    modifyButton.style.color = "#fff";
    modifyButton.setAttribute("onclick","cancelDeleteStu("+ order +")");

    // 修改 modifyBtn 按钮的触发函数 modifyStu --> ensureDeleteStu
    let deleteButton = document.getElementById("modifyBtn" + order);
    deleteButton.setAttribute("value", "确认删除");
    deleteButton.style.backgroundColor = "red";
    modifyButton.style.color = "#fff";
    deleteButton.setAttribute("onclick","ensureDeleteStu("+ order +")");
}
// 修改按钮、删除按钮状态还原
function modifyAndDelete2restore(order) {
    // 修改回按钮的触发函数 cancelModifyStu --> modifyStu
    let cancelModifyButton = document.getElementById("modifyBtn" + order);
    cancelModifyButton.setAttribute("value", "修改");
    cancelModifyButton.style.backgroundColor = "transparent";
    cancelModifyButton.style.color = "#000";
    cancelModifyButton.setAttribute("onclick","modifyStu("+ order +")");

    // 修改回按钮的触发函数 ensureModifyButton --> deleteStu
    let ensureModifyButton = document.getElementById("deleteBtn" + order);
    ensureModifyButton.setAttribute("value", "删除");
    ensureModifyButton.style.backgroundColor = "transparent";
    ensureModifyButton.style.color = "#000";
    ensureModifyButton.setAttribute("onclick","deleteStu("+ order +")");
}

// 修改学生
function modifyStu(order) {
    // 获取 input 标签对象
    let wnameInput = document.getElementById("wname" + order);
    let locationInput = document.getElementById("location" + order);
    let squareInput = document.getElementById("square" + order);
    let managerInput = document.getElementById("manager" + order);

    // 取消Input禁用状态
    wnameInput.removeAttribute("disabled");
    locationInput.removeAttribute("disabled");
    squareInput.removeAttribute("disabled");
    managerInput.removeAttribute("disabled");

    // 修改按钮状态转换
    modify2Transition(order);
}
// 取消修改学生
function cancelModifyStu(order) {
    // 获取 input 标签对象
    let wnameInput = document.getElementById("wname" + order);
    let locationInput = document.getElementById("location" + order);
    let squareInput = document.getElementById("square" + order);
    let managerInput = document.getElementById("manager" + order);

    // 还原 Input 禁用状态
    wnameInput.setAttribute("disabled", "true");
    locationInput.setAttribute("disabled", "true");
    squareInput.setAttribute("disabled", "true");
    managerInput.setAttribute("disabled", "true");

    // 修改按钮状态还原
    modifyAndDelete2restore(order);
}
// 确认修改学生
function ensureModifyStu(order) {
    // 获取 input 标签对象
    let wnoInput = document.getElementById("wno" + order);
    let wnameInput = document.getElementById("wname" + order);
    let locationInput = document.getElementById("location" + order);
    let squareInput = document.getElementById("square" + order);
    let managerInput = document.getElementById("manager" + order);

    // 还原Input禁用状态
    wnameInput.setAttribute("disabled", "true");
    locationInput.setAttribute("disabled", "true");
    squareInput.setAttribute("disabled", "true");
    managerInput.setAttribute("disabled", "true");

    // 异步请求修改信息
    ajax({
        method: "post",
        url: "${pageContext.servletContext.contextPath}/UpdateBeforeCheck.do",
        data: {
            wno: wnoInput.value,
            wname: wnameInput.value,
            location: locationInput.value,
            square: squareInput.value,
            manager: managerInput.value,
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

    // 修改按钮状态还原
    modifyAndDelete2restore(order);
}

// 删除学生
function deleteStu(order) {
    delete2transition(order);
}
// 取消删除
function cancelDeleteStu(order) {
    modifyAndDelete2restore(order);
}
// 确认删除学生
function ensureDeleteStu(order) {
    // 获取 input 标签对象
    let wnoInput = document.getElementById("wno" + order);

    // 异步请求删除信息
    ajax({
        method: "post",
        url: "${pageContext.servletContext.contextPath}/DeleteBeforeCheck.do",
        data: {
            wno: wnoInput.value
        },
        success: function (result) {
            let operationTip = document.getElementById("operationTip" + order);
            if (result) {
                let span = document.createElement("span");
                span.innerText = result.tip.text;
                span.style.color = result.tip.color;
                operationTip.appendChild(span);

                if (result.tip.status === 1) {
                    // 清空提示
                    setTimeout(function () {
                        operationTip.innerHTML = "";
                        showAllStu();
                    },1000);
                }

                // 清空提示
                setTimeout(function () {
                    document.getElementById("deleteStuTip").innerHTML = "";
                },1000);
            } else {
                // 异常处理
            }
        }
    });

    // 删除按钮状态还原
    modifyAndDelete2restore(order);
}

</script>
</body>
</html>
