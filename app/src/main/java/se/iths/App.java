package se.iths;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import static se.iths.Sql.*;

public class App {
    public static Connection con = null;
    //ResultSet rs = null;

    public static void main(String[] args)  {
        App app = new App();
        Crud crud = new Crud();
        try {
            app.setUp();
            //crud.createNewGrade();
            crud.readStudentsInclSchoolAndGrade();
            //crud.updateGradeForAStudent();
            //crud.deleteStudent();
            app.closeCon();
        }catch(SQLException error){
            System.out.println("This went wrong: " + error);
        }
    }

    private void setUp() throws SQLException {
        con = DriverManager.getConnection(JDBC_CONNECTION, JDBC_USER, JDBC_PASSWORD);
    }
    private void closeCon() throws SQLException {
        con.close();
    }
}
