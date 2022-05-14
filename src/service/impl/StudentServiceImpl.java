package service.impl;

import dao.WarehouseDao;
import dao.impl.WarehouseDaoImpl;
import entry.Warehouse;
import service.WarehouseService;

import java.util.ArrayList;

public class StudentServiceImpl implements WarehouseService {
    private WarehouseDao warehouseDao = new WarehouseDaoImpl();

    @Override
    public ArrayList<Warehouse> queryAllWarehouses() {
        return warehouseDao.queryAllStu();
    }

    @Override
    public Warehouse updateStu(Warehouse student) {
        return warehouseDao.updateStu(student.getWno(), student.getWname(), student.getLocation(), student.getSquare(), student.getManager());
    }

    @Override
    public Warehouse addStu(Warehouse student) {
        return warehouseDao.insertStu(student.getWno(), student.getWname(), student.getLocation(), student.getSquare(), student.getManager());
    }

    @Override
    public Warehouse findStuByNo(int findInfo) {
        return warehouseDao.queryStuByNo(findInfo);
    }

    @Override
    public ArrayList<Warehouse> findStuByName(String findInfo) {
        return warehouseDao.queryStuByName(findInfo);
    }


    @Override
    public Warehouse deleteStuByNo(int no) {
        Warehouse student = warehouseDao.queryStuByNo(no);
        int i = warehouseDao.deleteStuByNo(no);
        if (i > 0) {
            return student;
        }
        return null;
    }
}
