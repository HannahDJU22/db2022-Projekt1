# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
```mermaid
flowchart TD
STUDENT ||--o {StudentSchool};
STUDENT {
	int StudentId
	string Name
	}
SCHOOL ||--o {StudentSchool};
SCHOOL {
	int SchoolId
	string SchoolName
	string City
	}
```
