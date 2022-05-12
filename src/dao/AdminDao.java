package dao;

import entry.Admin;
import service.AdminService;

public interface AdminDao {
    Admin queryStuByNo(String no);

    Admin updateStu(String no, String password, String name, String sex, String address);
}
