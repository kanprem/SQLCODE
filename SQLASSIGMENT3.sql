---Q1)SQL Query to fetch records that are present in one table but not in another table.

CREATE DATABASE PREM_PVT_LTD;

USE PREM_PVT_LTD;

CREATE TABLE EMPLOYEEDETAILS 
(EMPID INT PRIMARY KEY,
FULLNAME VARCHAR(50),
MANAGERID INT,
DOJ DATE,
CITY VARCHAR(50)
);

SELECT * FROM EMPLOYEEDETAILS;

INSERT INTO EMPLOYEEDETAILS 
VALUES (121,'JOHN SNOW',321,'2019-01-31','TORONTO'),
(321,'WALTER WHITE',986,'2019-01-31','TORONTO'),
(421, 'KULDEEP RANA',876,'2021-11-27','NEW DELHI');

CREATE TABLE EMPLOYEESALLERY 
(EMPID INT PRIMARY KEY,
PROJECT VARCHAR(50),
SALLERY INT,
VARIBLE INT
);

SELECT * FROM EMPLOYEESALLERY;

INSERT INTO EMPLOYEESALLERY
VALUES (121,'P1',8000,500),
(321,'P2',10000,1000),
(421,'P1',12000,0);

SELECT * FROM EMPLOYEESALLERY;

--Q2)SQL query to fetch all the employees who are not working on any project.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT EMPLOYEEDETAILS.FULLNAME , EMPLOYEESALLERY.PROJECT
FROM EMPLOYEEDETAILS
FULL JOIN EMPLOYEESALLERY ON EMPLOYEEDETAILS.EMPID = EMPLOYEESALLERY.EMPID;

--Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT * FROM EMPLOYEEDETAILS WHERE DOJ = '2020-01-30';

---Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT EMPLOYEEDETAILS.FULLNAME , EMPLOYEESALLERY.SALLERY
FROM EMPLOYEEDETAILS
FULL JOIN EMPLOYEESALLERY ON EMPLOYEEDETAILS.EMPID = EMPLOYEESALLERY.EMPID;

---Q5)Write an SQL query to fetch a project-wise count of employees.

SELECT * FROM EMPLOYEESALLERY;

SELECT Project, count(EmpId) AS EmpProjectCount
FROM EMPLOYEESALLERY
GROUP BY Project
ORDER BY EmpProjectCount DESC;

---Q6)Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT EMPLOYEEDETAILS.FULLNAME , EMPLOYEESALLERY.SALLERY
FROM EMPLOYEESALLERY
LEFT JOIN EMPLOYEEDETAILS ON EMPLOYEEDETAILS.EMPID = EMPLOYEESALLERY.EMPID;

---Q7)Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT FULLNAME , MANAGERID FROM EMPLOYEEDETAILS;

--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT * FROM EMPLOYEEDETAILS;

SELECT FULLNAME , COUNT(*) FROM EMPLOYEEDETAILS
GROUP BY FULLNAME HAVING COUNT(*) > 1;

---Q9)Write an SQL query to fetch only odd rows from the table.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT * FROM EMPLOYEEDETAILS WHERE EMPID %2 = 1;

---Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT * FROM EMPLOYEESALLERY;

SELECT MAX(SALLERY) AS "THIRD HIGHEST SALARY" FROM EMPLOYEESALLERY;

--ASSIGMENT 2 

--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.

SELECT * FROM EMPLOYEEDETAILS;

SELECT FULLNAME , EMPID FROM EMPLOYEEDETAILS WHERE MANAGERID = 986;

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT DISTINCT(PROJECT) FROM EMPLOYEESALLERY;

---Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT COUNT(*) FROM EMPLOYEESALLERY WHERE Project = 'P1';


---Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT MAX(SALLERY) AS MAXIMUM, MIN(SALLERY) AS MINIMUM, AVG(SALLERY) AS AVERAGE FROM EMPLOYEESALLERY;

---Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.

SELECT * FROM EMPLOYEESALLERY;

SELECT EMPID , SALLERY FROM EMPLOYEESALLERY WHERE SALLERY BETWEEN 9000 AND 15000;

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT * FROM EMPLOYEEDETAILS;

SELECT EmpId, City, ManagerId
FROM EmployeeDetails
WHERE City='Toronto' AND ManagerId='321';

--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT * FROM EMPLOYEEDETAILS;

SELECT EmpId, City, ManagerId
FROM EmployeeDetails
WHERE City='CALIFORNIA' AND ManagerId='321';

--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT * FROM EMPLOYEESALLERY

SELECT EmpId
FROM EMPLOYEESALLERY
WHERE NOT Project='P1';

--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT * FROM EMPLOYEESALLERY;

SELECT EmpId,
SALLERY+Varible as TotalSalary 
FROM EMPLOYEESALLERY;

--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, 
--followed by a text “hn” and ends with any sequence of characters.

SELECT * FROM EMPLOYEEDETAILS;

SELECT FullName
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

--ASSIGMENT NO 3

--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables 
--‘EmployeeDetails’ and ‘EmployeeSalary’.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT EmpId FROM EMPLOYEEDETAILS
UNION 
SELECT EmpId FROM EMPLOYEESALLERY;

--Ques.2 Write an SQL query to fetch common records between two tables.

SELECT * FROM EMPLOYEEDETAILS;
SELECT * FROM EMPLOYEESALLERY;

SELECT *
FROM EMPLOYEESALLERY
WHERE EmpId IN 
(SELECT EmpId from EMPLOYEESALLERY);

--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.

SELECT EMPLOYEEDETAILS.FULLNAME , EMPLOYEESALLERY.SALLERY
FROM EMPLOYEESALLERY
LEFT JOIN EMPLOYEEDETAILS ON EMPLOYEEDETAILS.EMPID = EMPLOYEESALLERY.EMPID;


--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.

SELECT EmpId FROM 
EMPLOYEEDETAILS 
where EmpId IN 
(SELECT EmpId FROM EMPLOYEESALLERY);

--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT EmpId FROM 
EMPLOYEEDETAILS 
where EmpId NOT IN 
(SELECT EmpId FROM EMPLOYEESALLERY);


--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space

SELECT REPLACE(FullName, ' ', ' ') 
FROM EmployeeDetails;

--Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.

SELECT LEN(FULLNAME) FROM EMPLOYEEDETAILS;

--Ques.8. Write an SQL query to display both the EmpId and ManagerId together.

SELECT EMPID , MANAGERID FROM EMPLOYEEDETAILS;

--Ques.9. Write a query to fetch only the first name(string before space) from the FullName 
--column of the EmployeeDetails table.

SELECT SUBSTRING(FullName, 1, CHARINDEX(' ',FullName)) 
FROM EmployeeDetails;

---Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.

SELECT UPPER(FullName), LOWER(City) 
FROM EmployeeDetails;

--ASSIGMENT 4

--Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – 
--‘n’ in the FullName field.

SELECT FullName, 
LEN(FullName),LEN(REPLACE(FullName, 'n', ''))
FROM EmployeeDetails;

--Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.

UPDATE EMPLOYEEDETAILS 
SET FULLNAME = LTRIM(RTRIM(FULLNAME));

SELECT * FROM EMPLOYEEDETAILS;

--Ques.3. Fetch all the employees who are not working on any project.

SELECT EMPID 
FROM EMPLOYEESALLERY 
WHERE PROJECT IS NULL;

--Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 
--5000 and less than or equal to 10000.

SELECT FULLNAME 
FROM EMPLOYEEDETAILS 
WHERE EMPID IN 
(SELECT EMPID FROM EMPLOYEESALLERY 
WHERE SALLERY BETWEEN 5000 AND 10000);

--Ques.5. Write an SQL query to find the current date-time.

SELECT GETDATE();

--Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.

SELECT * FROM EMPLOYEEDETAILS
WHERE DOJ BETWEEN '2020/01/01'
AND '2020/12/31';

--Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table 
--who have a salary record in the EmployeeSalary table.

SELECT * FROM EMPLOYEEDETAILS
WHERE EXISTS
(SELECT * FROM EMPLOYEESALLERY 
WHERE EMPLOYEEDETAILS.EMPID = EMPLOYEESALLERY.EMPID);

--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.

SELECT PROJECT, count(EmpId) EMPPROJECT
FROM EMPLOYEESALLERY
GROUP BY PROJECT
ORDER BY EMPPROJECT DESC;


--Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record 
--is not present for the employee.

SELECT EMPLOYEEDETAILS.FullName, EMPLOYEESALLERY.SALLERY
FROM EMPLOYEEDETAILS 
LEFT JOIN 
EMPLOYEESALLERY
ON EMPLOYEEDETAILS.EmpId = EMPLOYEESALLERY.EmpId;

---Ques.10. Write an SQL query to join 3 tables.

--DOUBT











