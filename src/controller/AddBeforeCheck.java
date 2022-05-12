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

@WebServlet(name = "AddBeforeCheck", value = "/AddBeforeCheck.do")
public class AddBeforeCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询学号是否已存在
        String no = request.getParameter("no");
        Student stuByNo = new StudentServiceImpl().findStuByNo(no);
        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (stuByNo != null) {
            tip = new Tip("学号已存在！", "red", 0);
            out.print("{" +
                    "\"tip\":" + tip.toJSON() +
                    "}");
        } else {
            // 封装学生对象
            Student student = StudentFactory.packagingByRequest(request);
            if (student == null) {
                tip = new Tip("非法输入！", "red", 0);
                out.print("{" +
                        "\"tip\":" + tip.toJSON() +
                        "}");
            } else {
                request.setAttribute("student", student);
                request.getRequestDispatcher("AddStu.do").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
