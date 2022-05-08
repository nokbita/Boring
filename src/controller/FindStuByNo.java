package controller;

import entry.Student;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FindStuByNo", value = "/FindStuByNo.do")
public class FindStuByNo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student = new StudentServiceImpl().findStuByNo(request.getParameter("findInfo"));

        PrintWriter out = response.getWriter();
        System.out.println("student 姓名查找: " + student);
        if (student == null) {
            out.println("{" +
                    "tip:" + "查询为空," +
                    "}");
            return;
        }
        out.println(student);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
