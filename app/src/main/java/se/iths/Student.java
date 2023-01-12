package se.iths;

import java.util.ArrayList;
import java.util.Collection;

public class Student {
    private final long studentId;
    private String name;
    private Collection<School> schools = new ArrayList<>();
    private Collection<Grade> grades = new ArrayList<>();
    public Student(long studentId, String name) {
        this.studentId = studentId;
        this.name = name;
    }

    public long getStudentId() {
        return studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "StudentId and Name: " + getStudentId() + getName() + "School: " + schools + "Grade: " + grades;
    }

    public void add(School school) {
        schools.add(school);
    }

    public void add(Grade grade) {
        grades.add(grade);
    }
}
