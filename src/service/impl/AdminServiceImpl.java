package service.impl;

import dao.AdminDao;
import dao.StudentDao;
import dao.impl.AdminDaoImpl;
import dao.impl.StudentDaoImpl;
import entry.Admin;
import entry.Student;
import service.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao = new AdminDaoImpl();

    public Admin login(String no, String password) {
        Admin admin = adminDao.queryStuByNo(no);
        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }
        return null;
    }

    @Override
    public Admin updateStu(Admin loginAcc) {
        return adminDao.updateStu(loginAcc.getNo(),loginAcc.getPassword(),loginAcc.getName(), loginAcc.getSex(), loginAcc.getAddress());
    }
}
