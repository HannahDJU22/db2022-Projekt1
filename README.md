# db2022-Projekt1
Inlämning Projekt1

## ER-diagram
STUDENT ||--o{StudentSchool : allows
STUDENT {
	int StudentId
	string Name
	}
SCHOOL ||--o{StudentSchool : is
SCHOOL {
	int SchoolId
	string SchoolName
	string City
	}
