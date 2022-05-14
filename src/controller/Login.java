package controller;

import entry.Admin;
import entry.vo.Tip;
import service.impl.AdminServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login.do")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        Admin student = new AdminServiceImpl().login(account, password);
        // 登陆成功
        if (student != null) {
            // 保存登录账户
            request.getSession().setAttribute("loginAcc",student);
            // 重定向到信息管理界面
            response.sendRedirect("./manage.jsp");
        } else {
            // 账号或密码错误，重定向到登录页面
            String urlParam = new Tip("账号或密码错误", "red", 0).toURLParam();
            response.sendRedirect("./login.jsp?" + urlParam);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
