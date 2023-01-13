package se.iths;

public class Grade {
    private final long gradeId;
    private String gradeName;

    public Grade(long gradeId, String gradeName) {
        this.gradeId = gradeId;
        this.gradeName = gradeName;
    }

    public long getGradeId() {
        return gradeId;
    }

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    @Override
    public String toString() {
        return "GradeId and GradeDescription: " + gradeId + "-" + gradeName + ". ";
    }
}
