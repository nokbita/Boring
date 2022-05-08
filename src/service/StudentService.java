package service;

import entry.Student;

import java.util.ArrayList;

public interface StudentService {
    ArrayList<Student> queryAllStudents();

    Student updateStu(Student student);

    Student addStu(Student student);

    Student findStuByNo(String findInfo);

    ArrayList<Student> findStuByName(String findInfo);

    Student login(String no, String password);
}
