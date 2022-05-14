package service;

import entry.Admin;

public interface AdminService {
    Admin login(String account, String password);

    Admin updateStu(Admin loginAcc);
}
