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

DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
	StudentId INT NOT NULL auto_increment,
	Name VARCHAR(30) NOT NULL,
	Grade VARCHAR(12),
	CONSTRAINT PRIMARY KEY(StudentId))
ENGINE=INNODB;

INSERT INTO Student (StudentId, Name, Grade) SELECT DISTINCT Id, Name, Grade FROM UNF;

DROP TABLE IF EXISTS School;
CREATE TABLE School(
	SchoolId INT NOT NULL auto_increment,
	SchoolName VARCHAR(50) NOT NULL,
	City VARCHAR(100),
	CONSTRAINT PRIMARY KEY (SchoolId));

INSERT INTO School (SchoolName, City) SELECT DISTINCT School, City from UNF;

DROP TABLE IF EXISTS StudentSchool;
CREATE TABLE StudentSchool AS SELECT Id AS StudentId, SchoolId FROM UNF JOIN School ON UNF.School = School.SchoolName;

ALTER TABLE StudentSchool MODIFY COLUMN StudentId INT;
ALTER TABLE StudentSchool MODIFY COLUMN SchoolId INT;
ALTER TABLE StudentSchool ADD PRIMARY KEY (StudentId, SchoolId);

DROP TABLE IF EXISTS PhoneNumbers;
CREATE TABLE PhoneNumbers AS SELECT DISTINCT UNF.Id AS StudentId, HomePhone, JobPhone, MobilePhone1, MobilePhone2 FROM UNF;

ALTER TABLE PhoneNumbers MODIFY COLUMN StudentId INT;

DROP TABLE IF EXISTS StudentHobbies;

CREATE TABLE StudentHobbies SELECT Id AS StudentId, SUBSTRING_INDEX((SUBSTRING_INDEX(Hobbies,', ',1)),', ',-1) AS Hobby1, SUBSTRING_INDEX((SUBSTRING_INDEX(Hobbies,', ',2)),', ',-1) AS Hobby2,SUBSTRING_INDEX((SUBSTRING_INDEX(Hobbies,', ',3)),', ',-1) AS Hobby3 from UNF;

ALTER TABLE StudentHobbies MODIFY COLUMN StudentId INT;
