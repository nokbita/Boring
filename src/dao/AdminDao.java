package dao;

import entry.Admin;
import service.AdminService;

public interface AdminDao {
    Admin queryStuByAccount(String account);

    Admin updateStu(String account, String password);
}
