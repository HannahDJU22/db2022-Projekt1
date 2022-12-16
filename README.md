# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
```mermaid
flowchart TD;
STUDENT --||o StudentSchool;
SCHOOL --> StudentSchool;
STUDENT --> PHONENUMBERS;
STUDENT --> HOBBIES;
STUDENT --> StudentGrades;
GRADES --> StudentGrades;
```
