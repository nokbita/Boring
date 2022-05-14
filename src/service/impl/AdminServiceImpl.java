package service.impl;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import entry.Admin;
import service.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao = new AdminDaoImpl();

    public Admin login(String account, String password) {
        Admin admin = adminDao.queryStuByAccount(account);
        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }
        return null;
    }

    @Override
    public Admin updateStu(Admin loginAcc) {
        return adminDao.updateStu(loginAcc.getAccount(),loginAcc.getPassword());
    }
}
