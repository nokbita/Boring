package dao.impl;

import dao.StudentDao;
import entry.Student;
import utils.Database;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.ArrayList;

public class StudentDaoImpl implements StudentDao {
    @Override
    public ArrayList<Student> queryAllStu() {
        ArrayList<Student> students = new ArrayList<>();

        try {
            Connection connection = Database.getConnection();
            Statement statement = null;
            String sql = "select * from student";
            try {
                statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    students.add(new Student(
                            resultSet.getInt("id"),
                            resultSet.getString("no"),
                            resultSet.getString("password"),
                            resultSet.getString("name"),
                            resultSet.getInt("sex"),
                            resultSet.getFloat("grade")
                    ));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                Database.release(connection,statement);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }

    @Override
    public Student updateStu(String no, String password, String name, int sex, float grade) {
        Student student = null;
        try {
            Connection connection = Database.getConnection();
            String sql = "update student set password = ?, `name` = ?, sex = ?, grade = ? where no = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, name);
            statement.setInt(3, sex);
            statement.setFloat(4, grade);
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

    @Override
    public Student insertStu(String no, String password, String name, int sex, float grade) {
        Student student = null;

        try {
            Connection connection = Database.getConnection();
            String sql = "insert into student(no, password, name, sex, grade) values (?,?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, no);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setInt(4, sex);
            statement.setFloat(5, grade);

            int i = statement.executeUpdate();
            if (i > 0) {
                student = this.queryStuByNo(no);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    @Override
    public Student queryStuByNo(String no) {
        Student student = null;

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from student where no = ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1,no);

                ResultSet resultSet = statement.executeQuery();
                resultSet.next();
                student = new Student(
                        resultSet.getInt("id"),
                        resultSet.getString("no"),
                        resultSet.getString("password"),
                        resultSet.getString("name"),
                        resultSet.getInt("sex"),
                        resultSet.getFloat("grade")
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
    public ArrayList<Student> queryStuByName(String name) {
        ArrayList<Student> students = new ArrayList<>();

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from student where `name` like ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1,"%" + name + "%");

                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    students.add(new Student(
                            resultSet.getInt("id"),
                            resultSet.getString("no"),
                            resultSet.getString("password"),
                            resultSet.getString("name"),
                            resultSet.getInt("sex"),
                            resultSet.getFloat("grade")
                    ));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;

    }
}
