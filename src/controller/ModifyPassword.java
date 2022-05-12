package controller;

import dao.impl.AdminDaoImpl;
import entry.Admin;
import entry.Student;
import entry.vo.Tip;
import service.AdminService;
import service.impl.AdminServiceImpl;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ModifyPassword", value = "/ModifyPassword.do")
public class ModifyPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Admin loginAcc = (Admin) request.getAttribute("loginAcc");
        Admin admin = new AdminServiceImpl().updateStu(loginAcc);

        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (admin != null) {
            // 更新成功
            request.getSession().invalidate();  // 清除登录状态
            tip = new Tip("修改成功，正在跳转到登陆页面……","green",1);
            out.print(
                    "{" +
                            "\"tip\":" + tip.toJSON() +
                            "}"
            );
        } else {
            // 更新失败
            tip = new Tip("内部错误 500","red",0);
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
