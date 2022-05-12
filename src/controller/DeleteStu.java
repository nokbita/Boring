package controller;

import entry.Student;
import entry.vo.Tip;
import service.impl.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteStu", value = "/DeleteStu.do")
public class DeleteStu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        Student student = new StudentServiceImpl().deleteStuByNo(no);

        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (student != null) {
            tip = new Tip("删除成功！","green", 1);
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
