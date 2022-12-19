# db2022-Projekt1
Inlämning Projekt1

## ER-diagram

```mermaid
erDiagram
STUDENT ||--|{ StudentSchool : uses
SCHOOL ||--|{ StudentSchool : uses
STUDENT ||--|{ PHONENUMBERS : uses
STUDENT ||--o{ HOBBIES : uses
STUDENT ||--|| StudentGrades : uses
GRADES ||--|| StudentGrades : contains
```
