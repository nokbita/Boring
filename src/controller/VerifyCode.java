package controller;

import entry.vo.Tip;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "VerifyCode", value = "/VerifyCode.do")
public class VerifyCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取验证码
        String verifyCode = request.getParameter("verifyCode");
        // 检查验证码
        String rStr = (String) request.getSession().getAttribute("rStr");

        if (rStr.equals(verifyCode)) {
            // 验证码验证成功，转发到登录servlet
            request.getRequestDispatcher("LoginEmptyCheck.do").forward(request, response);
        } else {
            // 验证码验证失败，重定向到登录页
            String urlParam = new Tip("验证码错误", "red", 0).toURLParam();
            response.sendRedirect("./login.jsp?" + urlParam);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
