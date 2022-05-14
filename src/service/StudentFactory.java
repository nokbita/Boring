package service;

import entry.Warehouse;

import javax.servlet.http.HttpServletRequest;

public class StudentFactory {
    public static Warehouse packagingByRequest(HttpServletRequest request) {
        String wno = request.getParameter("wno");
        String wname = request.getParameter("wname");
        String location = request.getParameter("location");
        String square = request.getParameter("square");
        String manager = request.getParameter("manager");

        if (wno == null || "".equals(wno) || wname == null || "".equals(wname) ||
                location == null || "".equals(location) || square == null || "".equals(square) || manager == null || "".equals(manager)) {
            return null;
        }

        return new Warehouse(Integer.parseInt(wno),wname,location,Double.parseDouble(square),manager);
    }
}
