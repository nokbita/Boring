package dao.impl;

import dao.AdminDao;
import entry.Admin;
import utils.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    @Override
    public Admin queryStuByAccount(String account) {
        Admin admin = null;

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from user where account = ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1, account);

                ResultSet resultSet = statement.executeQuery();
                resultSet.next();
                admin = new Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("account"),
                        resultSet.getString("password")
                );
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

    @Override
    public Admin updateStu(String account, String password) {
        Admin student = null;
        try {
            Connection connection = Database.getConnection();
            String sql = "update user set password = ? where account = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, account);

            int i = statement.executeUpdate();
            if (i > 0) {
                student = this.queryStuByAccount(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }
}
