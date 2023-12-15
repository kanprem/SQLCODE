--Create a Student table and ADD 20 records in them
CREATE DATABASE STUDENT;

USE STUDENT;

CREATE TABLE STUDENT_TABLE (
STUDENTID INT PRIMARY KEY,
NAME VARCHAR(100),
SURNAME VARCHAR(100),
DOB DATE,
GENDER VARCHAR(10),
CLASS INT,
POINT INT,
CHECK (GENDER IN ('MALE' , 'FEMALE')));

SELECT * FROM STUDENT_TABLE;

INSERT INTO STUDENT_TABLE 
VALUES
(111 , 'KISHORE' , 'SHARMA' , '1991-11-01', 'MALE' , 10 , 200);
INSERT INTO STUDENT_TABLE 
VALUES
(112 , 'KOMAL' , 'KUMARI' , '1990-01-11', 'FEMALE' , 10 , 405);
INSERT INTO STUDENT_TABLE 
VALUES
(113 , 'ROSHANI' , 'MISHRA' , '1991-01-01', 'FEMALE' , 10 , 200);
INSERT INTO STUDENT_TABLE 
VALUES
(114 , 'YOGESH' , 'KHANA' , '1989-01-01', 'MALE' , 10 , 215);
INSERT INTO STUDENT_TABLE 
VALUES
(115 , 'MADHU' , 'LATA' , '1980-02-20', 'FEMALE' , 10 , 135);
INSERT INTO STUDENT_TABLE 
VALUES
(116 , 'SHIKHA' , 'KUMARI' , '1990-03-28', 'FEMALE' , 10 , 222);
INSERT INTO STUDENT_TABLE 
VALUES
(117 , 'LOKESH' , 'RAJ' , '1989-03-11', 'MALE' , 10 , 223);
INSERT INTO STUDENT_TABLE 
VALUES
(118 , 'JYOTI' , 'MANOJ' , '1983-05-21', 'FEMALE' , 10 , 335);
INSERT INTO STUDENT_TABLE 
VALUES
(119 , 'ASHISH' , 'KUMAR' , '1997-06-01', 'MALE' , 10 , 115);
INSERT INTO STUDENT_TABLE 
VALUES
(120 , 'AHMED' , 'KHAN' , '1990-12-31', 'MALE' , 10 , 150);

-- Example 1:  List all the records in the student chart

SELECT * FROM STUDENT_TABLE;

--Example 2: List the name surname and class of the student in the student table


SELECT NAME , SURNAME , CLASS FROM STUDENT_TABLE;

--Example 3: List the gender Female (F) records in the student table

SELECT * FROM STUDENT_TABLE WHERE GENDER LIKE 'FEMALE';


--Example 4 : List the names of each class in the way of being seen once in the student table

SELECT * FROM STUDENT_TABLE;

SELECT * FROM STUDENT_TABLE
ORDER BY CLASS ASC;

--Example 5: List the students with Female gender and the class 10Math in the student table

SELECT CLASS = 10 ,  NAME FROM STUDENT_TABLE WHERE GENDER LIKE 'FEMALE';


--Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table

SELECT * FROM STUDENT_TABLE;

SELECT CLASS = 10 , NAME , SURNAME , SUB  FROM STUDENT_TABLE WHERE SUB LIKE 'MATH';

--Example 8: List the students name and surname by combining them as name surname in the student table

SELECT CONCAT (NAME, ' ' ,SURNAME) AS   FULL_NAME  FROM STUDENT_TABLE;

--Example 9: List the students with the names starting with “A” letter in the student table

SELECT NAME , SURNAME FROM STUDENT_TABLE WHERE NAME LIKE 'A%';

--Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table

SELECT * FROM STUDENT_TABLE;


SELECT * FROM STUDENT_TABLE WHERE PAGES BETWEEN 50 AND 200;

--Example 11: List the students with names AMAN  , PREM and AYANA in the student table

SELECT * FROM STUDENT_TABLE WHERE NAME IN ('AMAN' , 'PREM' , 'AYANA');

--Example 12: List the students with names starting with A D and K in the student table

SELECT  * FROM STUDENT_TABLE WHERE NAME LIKE '[ADK]%';

--Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table

SELECT NAME , SURNAME , CLASS , GENDER FROM STUDENT_TABLE
WHERE (CLASS = 9 AND GENDER = 'MALE' AND SUB = 'MATH') OR (CLASS = 9 AND GENDER = 'FEMALE' AND SUB = 'HIS');

--Example 14: List the males whose classes are 10Math or 10Bio

SELECT NAME , CLASS = 10 , SUB = 'MATH' FROM STUDENT_TABLE WHERE SUB = 'MATH';

--Example 15: List the students with birth year 1989 in the student table

SELECT * FROM STUDENT_TABLE WHERE DOB = '1989-01-01';






















