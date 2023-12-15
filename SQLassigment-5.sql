--1.Create University Database give any University name you want

CREATE DATABASE MANGALAM_UNIVERSITY 

USE MANGALAM_UNIVERSITY; 

--2. Under this University Create four tables and each table should have following three Column named as:-

CREATE TABLE College_Table 
(College_ID INT PRIMARY KEY,
College_Name VARCHAR(150),
College_Area VARCHAR(150)
);

SELECT * FROM College_Table;

CREATE TABLE Department_Table
(Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(150),
Dept_Facility VARCHAR(150)
);

SELECT * FROM Department_Table;

CREATE TABLE Professor_Table
(Professor_ID INT PRIMARY KEY,
Professor_Name VARCHAR(150),
Professor_Subject VARCHAR(150)
);

SELECT * FROM Professor_Table;

CREATE TABLE Student_Table
(Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(150),
Student_Stream VARCHAR(150)
);

SELECT * FROM Student_Table;

--3. Apply foreign key on Department key from College_table

SELECT * FROM College_Table;
SELECT * FROM Department_Table;


ALTER TABLE COLLEGE_TABLE
ADD CONSTRAINT FK_COLLEGEDEPARTMENT
FOREIGN KEY (COLLEGE_ID) REFERENCES COLLEGE_TABLE(COLLEGE_ID);

--4. Apply foreign Key on Student_Table from Professor_Table

SELECT * FROM Student_Table;
SELECT * FROM Professor_Table;

ALTER TABLE STUDENT_TABLE
ADD CONSTRAINT FK_STUDENTPRO
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_TABLE(STUDENT_ID);

--5. Insert atleast 10 Records in each table

SELECT * FROM College_Table;

INSERT INTO College_Table 
VALUES (1, 'PU', 'PUNE'),
(2, 'DU', 'DELHI'),
(3, 'MU' , 'MUMBAI'),
(4, 'BU' , 'BANARAS'),
(5, 'CU' , 'CHANDIGARH'),
(6, 'KU', 'KOLKATA'),
(7, 'UU', 'URISA'),
(8, 'PU', 'PUNJAB'),
(9, 'JHU' , 'JHARKHAND'),
(10 , 'BH' , 'BHAGALPUR');

SELECT * FROM College_Table

SELECT * FROM Department_Table;

INSERT INTO Department_Table
VALUES (1, 'A' , 'PHY'),
(2, 'B' , 'CHY'),
(3 , 'C' , 'MATH'),
(4 , 'D' , 'BIO'),
(5 , 'E' , 'SCIENCE'),
(6 , 'F' , 'ENGLISH'),
(7 , 'G' , 'HINDI'),
(8 , 'H' , 'SANSKRIT'),
(9 , 'I' , 'COMPUTER'),
(10 , 'J' , 'ACCOUNT');

SELECT * FROM Department_Table;

SELECT * FROM Professor_Table;

INSERT INTO Professor_Table
VALUES (500 , 'B.R MURGAN' , 'PHY'),
(501 , 'D.R SHARMA' , 'CHY'),
(502, 'P.K DAHIYA' , 'MATH'),
(503, 'G.R KAPOOR' , 'BIO'),
(504 , 'TARUN KHNNA' , 'SCIENCE'),
(505 , 'DIVYA RAJWAT' , 'ENGLISH'),
(506, 'NEETU JAGA' , 'HINDI'),
(507, 'HEENA KHAN' , 'COMPUTER'),
(508, 'DILJEET RANA' ,'SANSKRIT'),
(509, 'KANWAR GOKHLE' , 'ACCOUNT');

SELECT * FROM Professor_Table;

SELECT * FROM Student_Table;

INSERT INTO Student_Table
VALUES (500 , 'PRINCE' ,'PHY'),
(501, 'RAHUL' , 'CHY'),
(502 , 'KASHISH' ,'MATH'),
(503 , 'RAJESH' , 'BIO'),
(504 , 'MAMTA' , 'SCIENCE'),
(505 , 'PREM' , 'ENGLISH'),
(506 , 'TARUN' , 'HINDI'),
(507 , 'RANJAN' , 'COMPUTER'),
(508 , 'VIJAY' , 'SANSKRIT'),
(509, 'HEMANT' , 'ACCOUNT');

SELECT * FROM Student_Table;

--TASK 2---

--1. Give the information of College_ID and College_name from College_Table

SELECT * FROM College_Table;


SELECT COLLEGE_ID , COLLEGE_NAME FROM College_Table;


--2.Show  Top 5 rows from Student table.

SELECT * FROM Student_Table;


SELECT TOP 5 * FROM Student_Table;


---3.What is the name of  professor  whose ID  is 5

SELECT * FROM Professor_Table;

SELECT * FROM Professor_Table WHERE Professor_ID = 505;

--4.Convert the name of the Professor into Upper case 


SELECT * FROM Professor_Table;

SELECT  UPPER(Professor_Name) FROM Professor_Table;

--5.Show me the names of those students whose name is start with a

SELECT * FROM Student_Table;

SELECT * FROM Student_Table  WHERE STUDENT_NAME LIKE 'A%';

--6.Give the name of those colleges whose end with a

SELECT * FROM College_Table;

SELECT * FROM College_Table WHERE College_Name LIKE '%A';

--7.Add one Salary Column in Professor_Table

SELECT * FROM Professor_Table;

ALTER TABLE PROFESSOR_TABLE 
ADD SALARY DECIMAL(10,2);

SELECT * FROM Professor_Table;

--8.Add one Contact Column in Student_table

SELECT * FROM Student_Table;

ALTER TABLE STUDENT_TABLE
ADD CONTACT INT; 

SELECT * FROM Student_Table;

--9.Find the total Salary of Professor 

SELECT * FROM Professor_Table;

UPDATE Professor_Table SET SALARY = 120000 WHERE Professor_ID = 500;
UPDATE Professor_Table SET SALARY = 32333 WHERE Professor_ID = 501;
UPDATE Professor_Table SET SALARY = 43553 WHERE Professor_ID = 502;
UPDATE Professor_Table SET SALARY = 63663 WHERE Professor_ID = 503;
UPDATE Professor_Table SET SALARY = 53533 WHERE Professor_ID = 504;
UPDATE Professor_Table SET SALARY = 54242 WHERE Professor_ID = 505;
UPDATE Professor_Table SET SALARY = 52833 WHERE Professor_ID = 506;
UPDATE Professor_Table SET SALARY = 63533 WHERE Professor_ID = 507;
UPDATE Professor_Table SET SALARY = 53533 WHERE Professor_ID = 508;
UPDATE Professor_Table SET SALARY = 32222 WHERE Professor_ID = 509;

SELECT * FROM Professor_Table;

SELECT SUM(SALARY) FROM Professor_Table;

--10.Change datatype of any one column of any one Table

SELECT * FROM College_Table;

ALTER TABLE COLLEGE_TABLE ALTER COLUMN COLLEGE_NAME INT;


--TASK 3--


--1.Show first 5 records from Students table and Professor table Combine

SELECT * FROM STUDENT_TABLE;
SELECT * FROM College_Table;

SELECT Student_Table.Student_Name , College_Table.College_Name 
FROM STUDENT_TABLE 
FULL OUTER JOIN College_Table ON Student_Table.Student_ID = College_Table.College_ID;

--2.Apply Inner join on all 4 tables together

SELECT * FROM College_Table;
SELECT * FROM Department_Table;
SELECT * FROM Professor_Table;
SELECT * FROM Student_Table;

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

SELECT COLLEGE_NAME , COLLEGE_AREA 
FROM College_Table
INNER JOIN Department_Table ON College_Table.College_ID = Department_Table.Dept_ID,

---3.Show Some null values from Department table and Professor table.

SELECT * FROM Department_Table;
SELECT * FROM Professor_Table;

SELECT Department_Table.Dept_Name , Professor_Table.Professor_ID
FROM Department_Table
FULL OUTER JOIN Professor_Table ON Department_Table.Dept_ID = Professor_Table.Professor_ID
ORDER BY Department_Table.Dept_Facility;

--4.Create a View from College Table  and give those records whose college name starts with C

SELECT* FROM College_Table;

CREATE VIEW [V_COLLEGETYPEC] AS 
SELECT College_ID , College_Name  , College_Area 
FROM College_Table WHERE College_Name LIKE 'C%';

SELECT * FROM V_COLLEGETYPEC;

--5.Create Stored Procedure  of Professor table whatever customer ID will be given by user it should 
--show whole records of it.

SELECT * FROM Professor_Table;

CREATE PROCEDURE PROC_ALLPROFESSORDETAILS
AS
BEGIN
	SELECT * FROM Professor_Table
	
	END;
	GO


EXECUTE PROC_ALLPROFESSORDETAILS;


--6.Rename the College_Table to College_Tables_Data .

SP_RENAME 'College_Table' , 'College_Tables_Data';


SELECT * FROM College_Tables_Data;



























