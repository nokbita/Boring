package controller;

import entry.Student;
import entry.vo.Tip;
import service.StudentFactory;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateBeforeCheck", value = "/UpdateBeforeCheck.do")
public class UpdateBeforeCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 封装学生对象
        Student student = StudentFactory.packagingByRequest(request);

        PrintWriter out = response.getWriter();
        if (student == null) {
            Tip tip = new Tip("非法输入！","red",0);
            out.print(
                    "{" +
                            "\"tip\":" + tip.toJSON() +
                            "}"
            );
        } else {
            // 请求转发
            request.setAttribute("student",student);
            request.getRequestDispatcher("UpdateStu.do").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
