package controller;

import entry.Student;
import service.StudentFactory;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "AddStu", value = "/AddStu.do")
public class AddStu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 封装学生对象
        Student student = StudentFactory.packagingByRequest(request);
        if (student == null) {
            response.getWriter().println("<span style=\"color=red\">请正确输入学生信息，只有成绩可为空！</span>");
            return;
        }

        // 添加学生对象
        Student student1 = new StudentServiceImpl().addStu(student);
        if (student1 != null) {
            response.getWriter().println("<span style=\"color=green\">" + student1.getName() + " 添加成功</span>");
            return;
        } else {
            response.getWriter().println("<span style=\"color=red;\">500 内部错误</span>");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
