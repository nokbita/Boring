package controller;

import entry.Student;
import entry.vo.Tip;
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
        Tip tip = null;
        if (students.isEmpty()) {
            tip = new Tip("查询为空！", "black", 0);
        } else {
            tip = new Tip("", "", 1);
        }
        out.print(
                "{" +
                        "\"tip\":" + tip.toJSON() + ", " +
                        "\"students\":" + students +
                        "}"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
