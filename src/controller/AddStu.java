package controller;

import entry.Warehouse;
import entry.vo.Tip;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddStu", value = "/AddStu.do")
public class AddStu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 封装学生对象
        Warehouse student = (Warehouse) request.getAttribute("student");
        // 添加学生对象
        Warehouse student1 = new StudentServiceImpl().addStu(student);

        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (student1 != null) {
            tip = new Tip("添加成功!","green", 1);
            out.print("{" +
                    "\"tip\":" + tip.toJSON() +
                    "}");

        } else {
            tip = new Tip("内部错误 500","red", 0);
            out.print("{" +
                    "\"tip\":" + tip.toJSON() +
                    "}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
