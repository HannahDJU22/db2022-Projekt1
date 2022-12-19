# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    ORDER ||--|{ LINE-ITEM : contains
    CUSTOMER }|..|{ DELIVERY-ADDRESS : uses
```

erDiagram TD;
STUDENT ||--o{ StudentSchool : has;
SCHOOL ||--o{ StudentSchool : has;
STUDENT --x PHONENUMBERS : has;
STUDENT --> HOBBIES : has;
STUDENT --> StudentGrades : has;
GRADES --> StudentGrades : has;
```
