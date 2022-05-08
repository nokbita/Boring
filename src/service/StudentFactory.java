package service;

import entry.Student;

import javax.servlet.http.HttpServletRequest;

public class StudentFactory {
    public static Student packagingByRequest(HttpServletRequest request) {
        String no = request.getParameter("no");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String grade = request.getParameter("grade");

        if (no == null || "".equals(no) || password == null || "".equals(password) ||
                name == null || "".equals(name) || sex == null || "".equals(sex)) {
            return null;
        }

        // -1 表示没有录入成绩
        grade = grade == null ? "-1" : grade;
        int sex2 = -1;
        float grade2 = -1f;
        try {
            sex2 = Integer.parseInt(sex);
            grade2 = Float.parseFloat(grade);
        } catch (NumberFormatException e) {
            return null;
        }

        return new Student(no,password,name,sex2,grade2);
    }
}
