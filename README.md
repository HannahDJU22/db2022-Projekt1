# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
```mermaid
erDiagram TD;
STUDENT ||--o{ StudentSchool : has;
SCHOOL ||--o{ StudentSchool : has;
STUDENT --x PHONENUMBERS : has;
STUDENT --> HOBBIES : has;
STUDENT --> StudentGrades : has;
GRADES --> StudentGrades : has;
```
