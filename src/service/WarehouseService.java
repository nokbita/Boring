package service;

import entry.Warehouse;

import java.util.ArrayList;

public interface WarehouseService {
    ArrayList<Warehouse> queryAllWarehouses();

    Warehouse updateStu(Warehouse warehouse);

    Warehouse addStu(Warehouse warehouse);

    Warehouse findStuByNo(int findInfo);

    ArrayList<Warehouse> findStuByName(String findInfo);

    Warehouse deleteStuByNo(int no);
}
