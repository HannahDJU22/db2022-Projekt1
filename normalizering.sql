USE iths;

DROP TABLE IF EXISTS UNF;

CREATE TABLE `UNF` (
    `Id` DECIMAL(38, 0) NOT NULL,
    `Name` VARCHAR(26) NOT NULL,
    `Grade` VARCHAR(11) NOT NULL,
    `Hobbies` VARCHAR(25),
    `City` VARCHAR(10) NOT NULL,
    `School` VARCHAR(30) NOT NULL,
    `HomePhone` VARCHAR(15),
    `JobPhone` VARCHAR(15),
    `MobilePhone1` VARCHAR(15),
    `MobilePhone2` VARCHAR(15)
)  ENGINE=INNODB;


LOAD DATA INFILE '/var/lib/mysql-files/denormalized-data.csv'
INTO TABLE UNF 
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE UNF SET Grade = 'Awesome' WHERE Grade = 'Awessome';
UPDATE UNF SET Grade = 'First class' WHERE Grade = 'First-class';
UPDATE UNF SET Grade = 'First class' WHERE Grade = 'Firstclass';
UPDATE UNF SET Grade = 'Gorgeus' WHERE Grade = 'Gorgetus';
UPDATE UNF SET Grade = 'Excellent' WHERE Grade = 'Eksellent';

DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
	StudentId INT NOT NULL auto_increment,
	Name VARCHAR(30) NOT NULL,
	CONSTRAINT PRIMARY KEY(StudentId))
ENGINE=INNODB;

INSERT INTO STUDENT (StudentId, Name) SELECT DISTINCT Id, Name FROM UNF;

DROP TABLE IF EXISTS SCHOOL;
CREATE TABLE SCHOOL(
	SchoolId INT NOT NULL auto_increment,
	SchoolName VARCHAR(50) NOT NULL,
	City VARCHAR(100),
	CONSTRAINT PRIMARY KEY (SchoolId));

INSERT INTO SCHOOL (SchoolName, City) SELECT DISTINCT School, City from UNF;

DROP TABLE IF EXISTS StudentSchool;
CREATE TABLE StudentSchool AS SELECT Id AS StudentId, SchoolId FROM UNF JOIN SCHOOL ON UNF.School = SCHOOL.SchoolName;

ALTER TABLE StudentSchool MODIFY COLUMN StudentId INT;
ALTER TABLE StudentSchool MODIFY COLUMN SchoolId INT;
ALTER TABLE StudentSchool ADD PRIMARY KEY (StudentId, SchoolId);

DROP TABLE IF EXISTS PHONENUMBERS;

CREATE TABLE PHONENUMBERS(
	PhoneId INT NOT NULL auto_increment,
	StudentId INT NOT NULL,
	PhoneType VARCHAR(35),
	Number VARCHAR(35) NOT NULL,
	CONSTRAINT PRIMARY KEY(PhoneId));

INSERT INTO PHONENUMBERS(StudentId, PhoneType, Number) SELECT Id AS StudentId, "Home" AS PhoneType, HomePhone AS Number from UNF WHERE HomePhone IS NOT NULL AND HomePhone != ''
UNION SELECT Id AS StudentId, "Job" AS PhoneType, JobPhone AS Number FROM UNF WHERE JobPhone IS NOT NULL AND JobPhone != ''
UNION SELECT Id AS StudentId, "Mobile" AS PhoneType, MobilePhone1 AS Number FROM UNF WHERE MobilePhone1 IS NOT NULL AND MobilePhone1 != ''
UNION SELECT Id AS StudentId, "Mobile" AS PhoneType, MobilePhone2 AS Number FROM UNF WHERE MobilePhone2 IS NOT NULL AND MobilePhone2 != '';

DROP VIEW IF EXISTS PhoneList;
CREATE VIEW PhoneList AS SELECT StudentId, group_concat(Number) AS Numbers FROM PHONENUMBERS GROUP BY StudentId;

DROP TABLE IF EXISTS HOBBIES;

CREATE TABLE HOBBIES(
	HobbyId INT NOT NULL auto_increment,
	Hobby VARCHAR(40),
	CONSTRAINT PRIMARY KEY(HobbyId));

INSERT INTO HOBBIES (Hobby) SELECT SUBSTRING_INDEX(Hobbies,', ',1) FROM UNF
UNION SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(Hobbies,', ',-2),', ',1) FROM UNF
UNION SELECT SUBSTRING_INDEX(Hobbies,', ',-1) FROM UNF;

DROP TABLE IF EXISTS StudentHobbies;

CREATE TABLE StudentHobbies AS SELECT Id AS StudentId, HobbyId FROM UNF JOIN HOBBIES ON UNF.Hobbies = HOBBIES.Hobby;

DROP TABLE IF EXISTS GRADES;

CREATE TABLE GRADES(
	GradeId INT NOT NULL auto_increment,
	GradeDescription VARCHAR(50) NOT NULL,
	CONSTRAINT PRIMARY KEY (GradeId));

INSERT INTO GRADES (GradeDescription) SELECT DISTINCT Grade from UNF;

DROP TABLE IF EXISTS StudentGrades;

CREATE TABLE StudentGrades AS SELECT Id AS StudentId, GradeId FROM UNF JOIN GRADES ON UNF.Grade = GRADES.GradeDescription;
