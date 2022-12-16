# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
```mermaid
flowchart TD
A[STUDENT] ||--o B{StudentSchool};
STUDENT {
	int StudentId
	string Name
	}
B[SCHOOL] ||--o C{StudentSchool};
SCHOOL {
	int SchoolId
	string SchoolName
	string City
	}
