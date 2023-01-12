package se.iths;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

import static se.iths.Sql.*;

public class Crud {
    public void createNewGrade() throws SQLException {
       PreparedStatement stmtCreate = App.con.prepareStatement("INSERT INTO Grade(GradeDescription) VALUES (?)");
        stmtCreate.setString(1, "Supreme");
        stmtCreate.execute();
    }

    public Collection<Student> getStudents() throws SQLException{
        Collection<Student> students = new ArrayList<>();
        ResultSet rs = App.con.prepareStatement(SQL_READ_STUDENT_INCL_SCHOOL_AND_GRADE).executeQuery();
        long oldId = -1;
        Student student= null;
        while(rs.next()){
            long studentId = rs.getLong(SQL_COL_STUDENT_ID);
            String studentName = rs.getString(SQL_COL_STUDENT_NAME);
            long schoolId = rs.getLong(SQL_COL_SCHOOL_ID);
            String schoolName = rs.getString(SQL_COL_SCHOOL_NAME);
            long gradeId = rs.getLong(SQL_COL_GRADE_ID);
            String gradeName = rs.getString(SQL_COL_GRADE_NAME);
        if(studentId!=oldId){
            student= new Student(studentId, studentName);
            students.add(student);
            oldId= studentId;
        }
        student.add(new School(schoolId, schoolName));
        student.add(new Grade(gradeId, gradeName));
        }
        return students;
    }
    public void readStudentsInclSchoolAndGrade() throws SQLException {
        Collection<Student> students = getStudents();

        for (Student student:students){
            System.out.println(student);
        }

    }
    public void updateGradeForAStudent() throws SQLException{
        PreparedStatement stmtUpdate = App.con.prepareStatement("UPDATE StudentGrade Set GradeId = (?) WHERE StudentId = (?)");
        stmtUpdate.setLong(1, 8); // här vill man ju använda sig av GradeId som ger Description
        stmtUpdate.setLong(2, 5);
        stmtUpdate.executeUpdate();

    }
    public void deleteStudent(){
        try{
            PreparedStatement stmtDelete = App.con.prepareStatement("DELETE StudentId FROM Student WHERE StudentId = (?)");
            stmtDelete.setLong(1, 2);
            stmtDelete.execute();
        }
        catch (SQLException e){}

    }
}
