# db2022-Projekt1
Inlämning Projekt1

## ER-diagram

```mermaid
erDiagram
Student {
int StudentId
varchar Name
}
School {
int SchoolId
varchar SchoolName
varchar City
}
StudentSchool{
int StudentId
int SchoolId
}
PhoneNumber{
int PhoneId
int StudentId
varchar PhoneType
varchar Number
}
Hobby{
int HobbyId
varchar HobbyType
}
StudentHobby{
int StudentId
int HobbyId
}
Grade{
int GradeId
varchar GradeDescription
}
StudentGrades{
int StudentId
int GradeId
}
Student ||--|{ StudentSchool : uses
School ||--|{ StudentSchool : uses
Student ||--|{ PhoneNumber : uses
Student ||--o{ Hobby : uses
Student ||--|| StudentGrades : uses
Grade ||--|| StudentGrades : contains
```
