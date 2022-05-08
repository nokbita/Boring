package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "VerifyCode", value = "/VerifyCode.do")
public class VerifyCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String verifyCode = request.getParameter("verifyCode");
        String rStr = (String) request.getSession().getAttribute("rStr");
        if (rStr.equals(verifyCode)) {
            request.getRequestDispatcher("Login.do").forward(request, response);
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?tip=" +
                    URLEncoder.encode("<span style=\"color=red;\">验证码输入错误</span>", StandardCharsets.UTF_8));
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
