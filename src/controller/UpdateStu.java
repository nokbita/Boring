package controller;

import entry.Student;
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
        Student student = (Student) request.getAttribute("student");
        Student student1 = new StudentServiceImpl().updateStu(student);
        PrintWriter out = response.getWriter();
        if (student1 != null) {
            out.println("{\"tip\":\"更新成功！\",\"color\":\"green\"}");
        } else {
            out.println("{\"tip\":\"内部错误 500\",\"color\":\"red\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
