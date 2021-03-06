package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FindStu", value = "/FindStu.do")
public class FindStu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String findInfo = request.getParameter("findInfo");
        String findType = request.getParameter("findType");

        // 输入查找信息为空，查找所有学生
        if (findInfo == null || "".equals(findInfo)) {
            request.getRequestDispatcher("QueryAllStudents.do").forward(request, response);
            return;
        }

        PrintWriter out = response.getWriter();
        // 按学号查找
        if (findType.equals("0")) {
            request.getRequestDispatcher("FindStuByNo.do").forward(request, response);
            return;
        }

        // 按姓名查找
        if (findType.equals("1")) {
            request.getRequestDispatcher("FindStuByName.do").forward(request, response);
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
