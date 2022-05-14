package dao;

import entry.Warehouse;

import java.util.ArrayList;

public interface WarehouseDao {
    ArrayList<Warehouse> queryAllStu();

    Warehouse updateStu(int no, String password, String name, Double sex, String grade);

    Warehouse insertStu(int no, String password, String name, Double sex, String grade);

    Warehouse queryStuByNo(int no);

    ArrayList<Warehouse> queryStuByName(String name);

    int deleteStuByNo(int no);
}
