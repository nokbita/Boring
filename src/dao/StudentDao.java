package dao;

import entry.Student;

import java.util.ArrayList;

public interface StudentDao {
    ArrayList<Student> queryAllStu();

    Student updateStu(String no, String password, String name, int sex, float grade);

    Student insertStu(String no, String password, String name, int sex, float grade);

    Student queryStuByNo(String no);

    ArrayList<Student> queryStuByName(String name);

    int deleteStuByNo(String no);
}
