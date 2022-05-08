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
</head>
<body>
<%-- 查询学生 --%>
<div>
    <h3>查找学生信息</h3>
    <form id="findStuForm">
        <input type="text" name="findInfo" placeholder="请输入...">
        条件：
        <select name="findType">
            <option value="0">学号</option>
            <option value="1">姓名</option>
        </select>
        <input type="button" value="查找" onclick="findStu()">
    </form>
</div>

<%-- 添加学生 --%>
<div>
    <h3>添加学生信息</h3>
    <div id="addStuTip"></div>
    <form action="<%=request.getContextPath()%>/AddStu.do" onsubmit="return addStu(this.form)">
        <input type="text" name="no" placeholder="学号">
        <input type="text" name="password" placeholder="密码">
        <input type="text" name="name" placeholder="姓名">
        <select name="sex">
            <option>选择性别</option>
            <option value="1">男</option>
            <option value="0">女</option>
        </select>
        <input type="text" name="grade" placeholder="成绩">
        <input type="button" value="添加">
    </form>
</div>

<%-- 修改、删除学生信息--%>
<div>
    <h3>学生信息列表</h3>
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


<script>

(function () {
    ajax({
        method: "get",
        url: "${pageContext.servletContext.contextPath}/QueryAllStudents.do",
        data: {},
        success: function (result) {
            console.log(result);
            let tableStu = document.getElementById("tableStu");
            if (result) {
                for (let i = 0; i <= result.length; i++) {
                    let tr = document.createElement("tr");

                    let noInput = document.createElement("input");
                    let passwordInput = document.createElement("input");
                    let nameInput = document.createElement("input");
                    let sexInput = document.createElement("input");
                    let modifyInput = document.createElement("input");
                    let deleteInput = document.createElement("input");

                    noInput.id = "no" + i;
                    noInput.type = "text";
                    noInput.value = result[i].no;
                    noInput.name = "no";
                    noInput.setAttribute("disabled", "true");

                    passwordInput.id = "password" + i;
                    passwordInput.type = "text";
                    passwordInput.value = result[i].password;
                    passwordInput.name = "password";
                    passwordInput.setAttribute("disabled", "true");

                    nameInput.id = "name" + i;
                    nameInput.type = "name";
                    nameInput.value = result[i].name;
                    nameInput.name = "name";
                    nameInput.setAttribute("disabled", "true");

                    sexInput.id = "sex" + i;
                    sexInput.type = "text";
                    sexInput.value = result[i].sex;
                    sexInput.name = "sex";
                    sexInput.setAttribute("disabled", "true");

                    modifyInput.id = "modify" + i;
                    modifyInput.type = "button";
                    modifyInput.value = "修改";
                    modifyInput.setAttribute("onclick", "modifyStu(" + i + ")");

                    deleteInput.id = "delete" + i;
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
                    // <td><div id="updateStuTip1"></div></td>
                    let td7 = document.createElement("td");
                    td7.id = "operationTip" + i;

                    tr.append(td1,td2,td3,td4,td5,td6,td7);
                    tableStu.insertAdjacentElement("beforeend",tr);
                    console.log(i);
                }
            } else {
                rowTitleTr.insertAdjacentHTML("afterend","查询为空！");
            }
        }
    });
})();

    function findStu() {
        let findStuForm = document.getElementById("findStuForm");
        let data = "findInfo=" + findStuForm["findInfo"].value + "&" +
            "findType=" + findStuForm["findType"].value;

        let xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.open("POST", "<%=request.getContextPath()%>/FindStu.do", true);
        xmlHttpRequest.onreadystatechange = findStuResponse;
        xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlHttpRequest.send(data);

        function findStuResponse() {
            if (xmlHttpRequest.readyState === 4) {
                document.getElementById("addStuTip").innerHTML = xmlHttpRequest.responseText;
            }
        }
    }

    // 不可用
    function addStu(form) {
        let formData = new FormData(form);
        let xmlHttpRequest = new XMLHttpRequest();
        xmlHttpRequest.open("POST", form.action, true);
        xmlHttpRequest.onreadystatechange = function () {
            if (xmlHttpRequest.readyState == 4) {
                document.getElementById("addStuTip").innerHTML = xmlHttpRequest.responseText;
            }
        }
        xmlHttpRequest.send(formData);
        return false;
    }

    function modifyStu(order) {
        // 获取 input 标签对象
        let passwordInput = document.getElementById("password" + order);
        let nameInput = document.getElementById("name" + order);
        let sexInput = document.getElementById("sex" + order);

        passwordInput.removeAttribute("disabled");
        nameInput.removeAttribute("disabled");
        sexInput.removeAttribute("disabled");

        // 修改按钮的触发函数
        let modifyButton = document.getElementById("modify" + order);
        modifyButton.setAttribute("value", "确定");
        modifyButton.setAttribute("onclick","ensureModifyStu("+ order +")");
    }

    function ensureModifyStu(order) {
        // 获取 input 标签对象
        let noInput = document.getElementById("no" + order);
        let passwordInput = document.getElementById("password" + order);
        let nameInput = document.getElementById("name" + order);
        let sexInput = document.getElementById("sex" + order);

        passwordInput.setAttribute("disabled", "true");
        nameInput.setAttribute("disabled", "true");
        sexInput.setAttribute("disabled", "true");

        // 异步请求
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
                let htmlSpanElement = document.createElement("span");
                htmlSpanElement.innerText = result.tip;
                htmlSpanElement.style.color = result.color;
                document.getElementById("operationTip" + order).appendChild(htmlSpanElement);
                // 清空提示
                setTimeout(function () {
                    document.getElementById("operationTip" + order).innerHTML = "";
                },1000);
            }
        });

        // 修改按钮的触发函数
        let ensureModifyButton = document.getElementById("modify" + order);
        ensureModifyButton.setAttribute("value", "修改");
        ensureModifyButton.setAttribute("onclick","modifyStu("+ order +")");
    }


    function deleteStu(order) {

    }

// ajax({
//     method: 'post',
//     url: 'http://www',
//     data: {
//         key1: 'value1',
//         key2: 'value2',
//         key3: 'value3'
//     },
//     success: function (result) {
//         console.log(result);
//     }
// });

/**
 * 将 data 对象转换为 url查询字符串
 * @param data 只包含属性的对象
 * @returns {string}
 */
function data2URLParam(data) {
    let arr = [];
    for (let k in data) {
        let str = k + '=' + data[k];
        arr.push(str);
    }
  return arr.join('&');
}

/**
 * 封装原始的异步请求对象 xmlHttpRequest, 并将响应的结果解析为 JSON 对象。
 * @param option 包含 method、url、data、success 的对象
 * 格式如下：
 * {
 * method: 'post'/'get',
 * url: '',
 * data: {key:'value'},
 * success: function(result){}
 * }
 */
function ajax(option) {
    let xmlHttpRequest = new XMLHttpRequest();
    // 把外界传递过来的参数对象，转换为url查询字符串
    let qs = data2URLParam(option.data);
    if (option.method.toUpperCase() === 'GET') {
        // 发起GET请求
        xmlHttpRequest.open(option.method, option.url + '?' + qs);
        xmlHttpRequest.onreadystatechange = fun;
        xmlHttpRequest.send();
    } else if (option.method.toUpperCase() === 'POST') {
        // 发起POST请求
        xmlHttpRequest.open(option.method, option.url);
        xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlHttpRequest.onreadystatechange = fun;
        xmlHttpRequest.send(qs);
    }
    xmlHttpRequest.responseType = "json";  // 响应结果规定为 json 数据类型
    function fun() {
        if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
            console.log(xmlHttpRequest); // debugger
            option.success(xmlHttpRequest.response);
        }
    }
}

</script>
</body>
</html>
