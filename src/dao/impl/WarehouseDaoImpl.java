package dao.impl;

import dao.WarehouseDao;
import entry.Warehouse;
import utils.Database;

import java.sql.*;
import java.util.ArrayList;

public class WarehouseDaoImpl implements WarehouseDao {
    @Override
    public ArrayList<Warehouse> queryAllStu() {
        ArrayList<Warehouse> students = new ArrayList<>();

        try {
            Connection connection = Database.getConnection();
            Statement statement = null;
            String sql = "select * from warehouse";
            try {
                statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    students.add(new Warehouse(
                            resultSet.getInt("wno"),
                            resultSet.getString("wname"),
                            resultSet.getString("location"),
                            resultSet.getInt("square"),
                            resultSet.getString("manager")
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
    public Warehouse updateStu(int wno, String wname, String location, Double square, String manager) {
        Warehouse student = null;
        try {
            Connection connection = Database.getConnection();
            String sql = "update warehouse set wname = ?, `location` = ?, square = ?, manager = ? where wno = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, wname);
            statement.setString(2, location);
            statement.setDouble(3, square);
            statement.setString(4, manager);
            statement.setInt(5, wno);

            int i = statement.executeUpdate();
            if (i > 0) {
                student = this.queryStuByNo(wno);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    @Override
    public Warehouse insertStu(int wno, String wname, String location, Double square, String manager) {
        Warehouse student = null;

        try {
            Connection connection = Database.getConnection();
            String sql = "insert into warehouse(WNO, WNAME, LOCATION, SQUARE, MANAGER) values (?,?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, wno);
            statement.setString(2, wname);
            statement.setString(3, location);
            statement.setDouble(4, square);
            statement.setString(5, manager);

            int i = statement.executeUpdate();
            if (i > 0) {
                student = this.queryStuByNo(wno);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    @Override
    public Warehouse queryStuByNo(int wno) {
        Warehouse student = null;

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from warehouse where wno = ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setInt(1,wno);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    student = new Warehouse(
                            resultSet.getInt("wno"),
                            resultSet.getString("wname"),
                            resultSet.getString("location"),
                            resultSet.getInt("square"),
                            resultSet.getString("manager")
                    );
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }

    @Override
    public ArrayList<Warehouse> queryStuByName(String wname) {
        ArrayList<Warehouse> students = new ArrayList<>();

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = null;
            String sql = "select * from warehouse where `wname` like ?";
            try {
                statement = connection.prepareStatement(sql);
                statement.setString(1,"%" + wname + "%");

                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    students.add(new Warehouse(
                            resultSet.getInt("wno"),
                            resultSet.getString("wname"),
                            resultSet.getString("location"),
                            resultSet.getInt("square"),
                            resultSet.getString("manager")
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

    @Override
    public int deleteStuByNo(int wno) {
        int i = 0;
        try {
            Connection connection = Database.getConnection();
            String sql = "delete from warehouse where wno = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, wno);

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
