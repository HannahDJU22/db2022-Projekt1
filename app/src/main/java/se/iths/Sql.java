package se.iths;

public class Sql {
    public static final String JDBC_CONNECTION = "jdbc:mysql://localhost:3306/iths";
    public static final String JDBC_USER = "iths";
    public static final String JDBC_PASSWORD = "iths";
    public static final String SQL_READ_STUDENT_INCL_SCHOOL_AND_GRADE = "SELECT StudentId, Name, SchoolId, SchoolName, GradeId, GradeDescription FROM Student JOIN StudentSchool USING(StudentId) JOIN School USING(SchoolId) JOIN StudentGrade USING(StudentId) JOIN Grade USING(GradeId)";

    public static final String SQL_COL_STUDENT_ID = "StudentId";
    public static final String SQL_COL_STUDENT_NAME = "Name";
    public static final String SQL_COL_SCHOOL_ID = "SchoolId";
    public static final String SQL_COL_SCHOOL_NAME = "SchoolName";
    public static final String SQL_COL_GRADE_ID = "GradeId";
    public static final String SQL_COL_GRADE_NAME = "GradeDescription";
}
