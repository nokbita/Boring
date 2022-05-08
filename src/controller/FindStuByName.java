package controller;

import entry.Student;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "FindStuByName", value = "/FindStuByName.do")
public class FindStuByName extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Student> students = new StudentServiceImpl().findStuByName(request.getParameter("findInfo"));

        PrintWriter out = response.getWriter();
        System.out.println("student 学号查找: " + students);
        if (students == null || students.isEmpty()) {
            out.println("{" +
                    "tip:" + "查询为空," +
                    "}");
            return;
        }
        out.println(students);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
