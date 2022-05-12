

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
 * @param obj 只包含属性的对象
 * @returns {string}
 */
function obj2URLParam(obj) {
    let arr = [];
    for (let k in obj) {
        let str = k + '=' + obj[k];
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
 * async: true/false,
 * success: function(result,responseURL){}
 * }
 */
function ajax(option) {
    let xmlHttpRequest = new XMLHttpRequest();
    // 把外界传递过来的参数对象，转换为url查询字符串
    let qs = obj2URLParam(option.data);

    // 默认是异步请求
    let async = true;
    if (option.async === false) {
        async = false;
    }
    if (option.method.toUpperCase() === 'GET') {
        // 发起GET请求
        xmlHttpRequest.open(option.method, option.url + '?' + qs, async);
        xmlHttpRequest.onreadystatechange = fun;
        xmlHttpRequest.send();
    } else if (option.method.toUpperCase() === 'POST') {
        // 发起POST请求
        xmlHttpRequest.open(option.method, option.url, async);
        xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlHttpRequest.onreadystatechange = fun;
        xmlHttpRequest.send(qs);
    }
    function fun() {
        if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200) {
            console.log(xmlHttpRequest);  // debugger
            let result = JSON.parse(xmlHttpRequest.responseText);
            let responseURL = xmlHttpRequest.responseURL;
            option.success(result,responseURL);
        }
    }
}

function urlParam2Obj(urlParam) {
    let obj = false;
    if (urlParam !== undefined && urlParam != null && urlParam !== "" && urlParam.valueOf("?")) {
        obj = {};
        let keyValues = urlParam.substring(1).split("&");
        for (let i = 0; i < keyValues.length; i++) {
            let vars = keyValues[i].split("=");
            obj[vars[0]] = vars[1];
        }
    }
    return obj;
}