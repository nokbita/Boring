package controller;

import entry.Admin;
import entry.Student;
import entry.vo.Tip;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ModifyPasswordBeforeCheck", value = "/ModifyPasswordBeforeCheck.do")
public class ModifyPasswordBeforeCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalPassword = request.getParameter("originalPassword");
        String newPassword = request.getParameter("newPassword");
        Admin loginAcc = (Admin) request.getSession().getAttribute("loginAcc");

        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (newPassword != null && !"".equals(newPassword) && originalPassword != null && !"".equals(originalPassword)) {
            if (loginAcc != null && loginAcc.getPassword().equals(originalPassword)) {
                // 与原始密码相等
                loginAcc.setPassword(newPassword);
                request.setAttribute("loginAcc",loginAcc);
                request.getRequestDispatcher("ModifyPassword.do").forward(request, response);
            } else {
                // 与原始密码不相等
                tip = new Tip("原始密码错误！","red",0);
                out.print(
                        "{" +
                                "\"tip\":" + tip.toJSON() +
                                "}"
                );
            }

        } else {
            // 原始密码 或 新密码为空
            tip = new Tip("输入非法！","red",0);
            out.print(
                    "{" +
                            "\"tip\":" + tip.toJSON() +
                            "}"
            );
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
