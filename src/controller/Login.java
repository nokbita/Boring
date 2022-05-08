package controller;

import entry.Student;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

@WebServlet(name = "Login", value = "/Login.do")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String password = request.getParameter("password");

        Student student = null;
        if (no != null && !"".equals(no) && password != null && !Objects.equals(password, "")) {
            // 登陆成功返回对象，否则返回 null
            student = new StudentServiceImpl().login(no,password);
        } else {
            // 账号或密码为空，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp?tip=" +
                    URLEncoder.encode("<span style=\"color=red;\">账号和密码均不能为空</span>", StandardCharsets.UTF_8));
            return;
        }

        // 登陆成功
        if (student != null) {
            // 保存登录账户
            request.getSession().setAttribute("loginStu",student);
            // 重定向到信息管理界面
            response.sendRedirect(request.getContextPath() + "/manager_info.jsp");
            return;
        } else {
            // 登录失败，账号或密码错误，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp?tip=" +
                    URLEncoder.encode("<span style=\"color=red;\">账号或密码错误</span>", StandardCharsets.UTF_8));
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
