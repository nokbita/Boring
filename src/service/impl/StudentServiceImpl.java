package service.impl;

import dao.StudentDao;
import dao.impl.StudentDaoImpl;
import entry.Student;
import service.StudentService;

import java.util.ArrayList;

public class StudentServiceImpl implements StudentService {
    private StudentDao studentDao = new StudentDaoImpl();

    @Override
    public ArrayList<Student> queryAllStudents() {
        return studentDao.queryAllStu();
    }

    @Override
    public Student updateStu(Student student) {
        return studentDao.updateStu(student.getNo(),student.getPassword(),student.getName(), student.getSex(), student.getGrade());
    }

    @Override
    public Student addStu(Student student) {
        return studentDao.insertStu(student.getNo(), student.getPassword(), student.getName(), student.getSex(), student.getGrade());
    }

    @Override
    public Student findStuByNo(String findInfo) {
        return studentDao.queryStuByNo(findInfo);
    }

    @Override
    public ArrayList<Student> findStuByName(String findInfo) {
        return studentDao.queryStuByName(findInfo);
    }

    @Override
    public Student login(String no, String password) {
        Student student = studentDao.queryStuByNo(no);
        if (student != null && student.getPassword().equals(password)) {
            return student;
        }
        return null;
    }

    @Override
    public Student deleteStuByNo(String no) {
        Student student = studentDao.queryStuByNo(no);
        int i = studentDao.deleteStuByNo(no);
        if (i > 0) {
            return student;
        }
        return null;
    }
}
