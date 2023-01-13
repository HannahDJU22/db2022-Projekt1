package se.iths;

public class School {
    private final long schoolId;
    private String schoolName;

    public School(long schoolId, String schoolName) {
        this.schoolId = schoolId;
        this.schoolName = schoolName;
    }

    public long getSchoolId() {
        return schoolId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    @Override
    public String toString() {
        return "SchoolId and SchoolName: " + schoolId + "-" + schoolName + ". ";
    }
}
