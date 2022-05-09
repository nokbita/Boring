package controller;

import entry.Student;
import entry.vo.Tip;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginEmptyCheck", value = "/LoginEmptyCheck.do")
public class LoginEmptyCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String password = request.getParameter("password");

        if (no != null && !"".equals(no) && password != null && !"".equals(password)) {
            // 账号或密码不为空，转发到登录Servlet
            request.getRequestDispatcher("Login.do").forward(request, response);
        } else {
            // 账号或密码不能为空，重定向到登录页面
            String urlParam = new Tip("账号或密码不能为空", "red", 0).toURLParam();
            response.sendRedirect("./login.jsp?" + urlParam);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
