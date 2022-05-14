package filters;

import entry.Admin;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "Interceptor", value = "/*")
public class Interceptor implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String requestURI = req.getRequestURI();
        System.out.println("当前访问的URL是：" + requestURI);

        String[] split = requestURI.split("/");
        String file = split[split.length - 1];
        if (file.equals("manage.jsp") || file.equals("modifyPassword.jsp")) {
            Admin loginAcc = (Admin) req.getSession().getAttribute("loginAcc");
            if (loginAcc == null) {
                resp.sendRedirect("login.jsp");
            }
        }

        chain.doFilter(request, response);
    }
}
