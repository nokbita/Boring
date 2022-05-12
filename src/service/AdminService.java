package service;

import entry.Admin;
import entry.Student;

public interface AdminService {
    Admin login(String no, String password);

    Admin updateStu(Admin loginAcc);
}
