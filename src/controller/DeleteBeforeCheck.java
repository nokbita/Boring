package controller;

import entry.vo.Tip;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteBeforeCheck", value = "/DeleteBeforeCheck.do")
public class DeleteBeforeCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String wno = request.getParameter("wno");
        PrintWriter out = response.getWriter();
        Tip tip = null;
        if (wno != null && !"".equals(wno)) {
            request.getRequestDispatcher("DeleteStu.do").forward(request, response);
        } else {
            tip = new Tip("学号不能为空，删除失败！","red", 0);
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
