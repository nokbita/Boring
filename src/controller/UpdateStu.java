package controller;

import entry.Warehouse;
import entry.vo.Tip;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateStu", value = "/UpdateStu.do")
public class UpdateStu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Warehouse student = (Warehouse) request.getAttribute("student");
        Warehouse student1 = new StudentServiceImpl().updateStu(student);
        PrintWriter out = response.getWriter();
        if (student1 != null) {
            Tip tip = new Tip("更新成功！","red",1);
            out.print(
                    "{" +
                            "\"tip\":" + tip.toJSON() +
                            "}"
            );
        } else {
            Tip tip = new Tip("内部错误 500","red",0);
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
