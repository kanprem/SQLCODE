CREATE DATABASE ADVANCE_ASSIGMENT;

USE ADVANCE_ASSIGMENT;

CREATE TABLE EMPLOYEEINFO (
EMPID INT PRIMARY KEY,
FIRSTNAME VARCHAR(50),
LASTNAME VARCHAR(50),
DEP VARCHAR(50),
PROJECT VARCHAR(50),
ADRESS VARCHAR(50),
DOB DATE,
GENDER CHAR(1),
CHECK (GENDER IN ('M' , 'F')
));

INSERT INTO EMPLOYEEINFO 
VALUES (1, 'SANJAY' , 'MEHRA' , 'HR' , 'P1' , 'HYDERBAD(HYD)', '1976-12-01' , 'M'),
(2, 'ANANYA' , 'MISHRA' , 'ADMIN' , 'P2' , 'DELHI(DEL)', '1968-05-02' , 'F'),
(3, 'ROHAN' , 'DIWAN' , 'ACCOUNT' , 'P3' , 'MUMBAI(BOM)', '1980-01-01' , 'M'),
(4, 'SONIA' , 'KULKARNI' , 'HR' , 'P1' , 'HYDERBAD(HYD)', '1992-05-02' , 'F'),
(5, 'ANKIT' , 'KAPOOR' , 'ADMIN' , 'P2' , 'DELHI(DEL)', '1994-07-03' , 'M');

SELECT * FROM EMPLOYEEINFO;


CREATE TABLE EMPLOYEEPOSITION (
EMPID INT PRIMARY KEY,
EMPPOSITION VARCHAR(50),
DOJ DATE,
SALARY INT
);

SELECT * FROM EMPLOYEEPOSITION;


INSERT INTO EMPLOYEEPOSITION 
VALUES (1 , 'MANAGER' , '01-05-2022' , 500000),
(2 , 'EXECUTIVE' , '02-05-2022' , 75000),
(3 , 'MANAGER' , '01-05-2022' , 90000),
(4 , 'LEAD' , '02-05-2022' , 85000),
(5 , 'EXECUTIVE' , '01-05-2022' , 300000);

SELECT * FROM EMPLOYEEPOSITION;

--Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT * FROM EMPLOYEEINFO;

SELECT UPPER(FIRSTNAME) AS EMPNAME FROM EMPLOYEEINFO;

--Q2)Write a query to fetch the number of employees working in the department ‘HR’.

SELECT COUNT(*) FROM EMPLOYEEINFO WHERE DEP = 'HR';


--Q3)Write a query to get the current date.

SELECT GETDATE();


---Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO;

SELECT SUBSTRING(FIRSTNAME , 1, 4) FROM EMPLOYEEINFO;

--Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO;
	
SELECT SUBSTRING(ADRESS, 1, CHARINDEX('(',ADRESS)) FROM EmployeeInfo;


--Q6)Write a query to create a new table that consists of data and structure copied from the other table.

SELECT * FROM EMPLOYEEINFO;

-- DOUBT

--Q7)Write q query to find all the employees whose salary is between 50000 to 100000.


SELECT * FROM EMPLOYEEPOSITION;

SELECT * FROM EMPLOYEEPOSITION WHERE SALARY BETWEEN 50000 AND 100000;

--Q8)Write a query to find the names of employees that begin with ‘S’

SELECT * FROM EMPLOYEEINFO WHERE FIRSTNAME LIKE 'S%';

--Q9)Write a query to fetch top N records.

--DOUBT

--Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. 
--The first name and the last name must be separated with space.

SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS 'FullName' FROM EMPLOYEEINFO;

--Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 
--and are grouped according to gender

SELECT * FROM EMPLOYEEINFO;

SELECT * FROM EMPLOYEEINFO WHERE DOB BETWEEN '1970/05/02' AND '1975/12/31';

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in 
--descending order and Department in the ascending order.

SELECT * FROM EMPLOYEEINFO;

SELECT * FROM EMPLOYEEINFO ORDER BY FIRSTNAME  DESC, DEP ASC;

--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT * FROM EMPLOYEEINFO WHERE LASTNAME LIKE '____A';

--Q14. Write a query to fetch details of all employees excluding the employees with first names, 
--“Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO; 

SELECT * FROM EMPLOYEEINFO WHERE FIRSTNAME NOT IN ('SANJAY' , 'SONIA');

--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.

SELECT * FROM EMPLOYEEINFO;

SELECT * FROM EMPLOYEEINFO WHERE ADRESS LIKE 'DELHI(DEL)';

--Q16. Write a query to fetch all employees who also hold the managerial position.

SELECT * FROM EMPLOYEEPOSITION;
SELECT * FROM EMPLOYEEINFO;

SELECT EMPLOYEEINFO.FIRSTNAME, EMPLOYEEINFO.LASTNAME, EMPLOYEEPOSITION.EMPPOSITION
FROM EMPLOYEEINFO  INNER JOIN EMPLOYEEPOSITION ON
EMPLOYEEINFO.EMPID = EMPLOYEEPOSITION.EMPID AND EMPLOYEEPOSITION.EMPPOSITION  IN ('Manager');

--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT * FROM EMPLOYEEPOSITION;
SELECT * FROM EMPLOYEEINFO;

SELECT DEP ,COUNT(EMPID) AS EMPDEPPCOUNT 
FROM EMPLOYEEINFO GROUP BY DEP 
ORDER BY EMPDEPPCOUNT ASC;

--Q18. Write a query to calculate the even and odd records from a table.

SELECT * FROM EMPLOYEEINFO;
SELECT * FROM EMPLOYEEPOSITION;

--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have 
--a date of joining in the EmployeePosition table.


SELECT * FROM EMPLOYEEINFO;
SELECT * FROM EMPLOYEEPOSITION;

--DOUBT

--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.

SELECT * FROM EMPLOYEEPOSITION;

SELECT MIN(SALARY) AS MINIMUM, MAX(SALARY) AS MAXIMUM FROM EMPLOYEEPOSITION;

--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.

--DOUBT

--Q22. Write a query to retrieve duplicate records from a table.

SELECT * FROM EMPLOYEEINFO;

SELECT EMPID , FIRSTNAME , DEP , COUNT(*) FROM EMPLOYEEINFO
GROUP BY EMPID , FIRSTNAME, DEP  HAVING COUNT(*) > 1;

--Q23. Write a query to retrieve the list of employees working in the same department.

SELECT COUNT(DEP) FROM EMPLOYEEINFO;


--Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.SELECT * FROM EmployeeInfo WHERE

SELECT * FROM EMPLOYEEINFO;

--DOUBT

--Q25. Write a query to find the third-highest salary from the EmpPosition table.

SELECT * FROM EMPLOYEEPOSITION

--DOUBT

--Q26. Write a query to display the first and the last record from the EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO;

SELECT FIRSTNAME , LASTNAME FROM EMPLOYEEINFO;

--Q27. Write a query to add email validation to your database

SELECT * FROM EMPLOYEEINFO;

ALTER TABLE EMPLOYEEINFO ADD EMAIL VARCHAR(50);

--Q28. Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT * FROM EMPLOYEEINFO;

SELECT DEP, COUNT(EmpID) as 'EmpNo' FROM EmployeeInfo GROUP BY DEP HAVING COUNT(EMPID) < 2;

--Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them

SELECT * FROM EMPLOYEEPOSITION;

SELECT EMPPOSITION, SUM(SALARY) FROM EMPLOYEEPOSITION GROUP BY EMPPOSITION;

--Q30. Write a query to fetch 50% records from the EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO;

SELECT * 
FROM EMPLOYEEINFO WHERE
EMPID <= (SELECT COUNT(EMPID)/2 from EMPLOYEEINFO);


--THANKS COACHX TEAM.....





















