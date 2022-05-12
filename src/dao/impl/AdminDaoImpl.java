package dao.impl;

import dao.AdminDao;
import entry.Admin;
import entry.Student;
import service.AdminService;
import utils.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    @Override
    public Admin queryStuByNo(String no) {
        Admin student = null;

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from admin where no = ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1,no);

                ResultSet resultSet = statement.executeQuery();
                resultSet.next();
                student = new Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("no"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getString("sex"),
                        resultSet.getString("address")
                );
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    @Override
    public Admin updateStu(String no, String password, String name, String sex, String address) {
        Admin student = null;
        try {
            Connection connection = Database.getConnection();
            String sql = "update admin set password = ?, `name` = ?, sex = ?, address = ? where no = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, name);
            statement.setString(3, sex);
            statement.setString(4, address);
            statement.setString(5, no);

            int i = statement.executeUpdate();
            if (i > 0) {
                student = this.queryStuByNo(no);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }
}
