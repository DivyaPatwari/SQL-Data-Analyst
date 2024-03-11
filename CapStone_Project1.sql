create database SQL_Project1

use sql_project1

create table Employee_Detail(EmployeeID INT, FirstName varchar (50), LastName varchar (50), Salary money, JoiningDate datetime , Department varchar(30), Gender varchar(10));


insert into Employee_Detail values (1,'Vikas', 'Ahlawat', 600000, '2/12/2013 11:16', 'IT', 'Male'),
(2,'Nikita', 'Jain', 530000, '2/14/2013 11:16', 'HR', 'Female'),
(3,'Ashish', 'Kumar', 1000000, '2/14/2013 11:16', 'IT', 'Male'),
(4,'Nikhil', 'Sharma', 480000, '2/15/2013 11:16', 'HR', 'Male'),
(5,'Anish', 'Kadian', 500000, '2/16/2013 11:16', 'Payroll', 'Male');

insert into Employee_Detail values 
(6,'Ani%sha', 'Kadian', 500000, '2/16/2013 11:16', 'Payroll', 'Female'); -- for testing Q14

insert into Employee_Detail values 
(6,' Anu ', 'Kadian', 500000, '2/16/2013 11:16', 'Payroll', 'Female'); -- for testing Q34/ Q35


--Q1
SELECT * FROM Employee_Detail;

--Q2 
SELECT FIRSTNAME FROM Employee_Detail;

--Q3
SELECT UPPER(FIRSTNAME) AS "First Name" FROM Employee_Detail

--Q4
SELECT UPPER(FIRSTNAME) AS "First Name" FROM Employee_Detail

--Q5
SELECT CONCAT(FIRSTNAME, ' ' , LASTNAME) FROM Employee_Detail

--Q6
SELECT * FROM Employee_Detail WHERE FIRSTName = 'Vikas'

--Q7
select * from Employee_Detail where firstname like 'a%'

--Q8
select * from Employee_Detail where firstname like 'a%'

--Q9
select * from Employee_Detail where firstname like '%h'

--Q10
SELECT * FROM Employee_Detail WHERE LOWER(FIRSTNAME) LIKE '[A-P]%'




--Q11
SELECT * FROM Employee_Detail WHERE LOWER(FIRSTNAME) NOT LIKE '[A-P]%'

--Q12
SELECT * FROM Employee_Detail WHERE GENDER LIKE '__le'

--Q13
SELECT * FROM Employee_Detail WHERE FIRSTNAME LIKE 'A____'

--Q14
SELECT * FROM Employee_Detail WHERE FIRSTNAME LIKE '%[!%]%'

--Q15
SELECT DISTINCT DEPARTMENT FROM Employee_Detail 

--Q16
SELECT MAX(SALARY) AS Highest_Salary FROM Employee_Detail

--Q17
SELECT MIN(SALARY) AS Lowest_Salary FROM Employee_Detail

--Q18
select CONVERT(varchar, joiningdate, 106) from Employee_Detail

--Q19
select CONVERT(varchar, joiningdate, 111) from Employee_Detail

--Q20
SELECT  CONVERT(varchar, joiningdate, 108) from Employee_Detail



--Q21
SELECT YEAR(JoiningDate) FROM   Employee_Detail;

--Q22
SELECT MONTH(JoiningDate) FROM   Employee_Detail;

--Q23
SELECT GETDATE()

--Q24
SELECT GETUTCDATE();

--Q24 A 
SELECT FIRSTNAME, GETDATE() AS CURR_DATE , JOININGDATE  AS Joining_date, datediff(month, joiningdate,  getdate()) as diff   FROM Employee_Detail

--Q25
SELECT FIRSTNAME, GETDATE() AS CURR_DATE , JOININGDATE  AS Joining_date, datediff(DAY, joiningdate,  getdate()) as diff   FROM Employee_Detail

--Q26
SELECT  *, YEAR(JoiningDate) AS YR FROM   Employee_Detail WHERE YEAR(JOININGDATE) = '2013' ;

--Q27
SELECT  *, MONTH(JoiningDate) AS Mnth FROM   Employee_Detail WHERE MONTH(JOININGDATE) = '1' ;

--Q28
SELECT  *, MONTH(JoiningDate) AS Mnth FROM   Employee_Detail WHERE MONTH(JOININGDATE) = '1' ;

--Q29
SELECT COUNT(*) FROM Employee_Detail



--Q31
SELECT TOP 1 * FROM Employee_Detail

--Q32
SELECT * FROM Employee_Detail WHERE FirstName IN ('Vikas', 'Ashish', 'Nikhil')

--Q33
SELECT * FROM Employee_Detail WHERE FirstName NOT IN ('Vikas', 'Ashish', 'Nikhil')

--Q34
SELECT RTRIM(FIRSTNAME) FROM Employee_Detail

--Q35
SELECT LTRIM(FIRSTNAME) FROM Employee_Detail

--Q36
SELECT FIRSTNAME, CASE WHEN GENDER = 'Female' then 'F'
when gender = 'Male' then 'M' end as G_Gender from Employee_Detail

--Q37
SELECT CONCAT('Hello', ' ', FIRSTNAME) AS GREETINGS FROM Employee_Detail

--Q38
select * from Employee_Detail where salary > 600000

--Q39
select * from Employee_Detail where salary < 700000

--Q40 
select * from Employee_Detail where salary BETWEEN 500000 AND 600000



CREATE TABLE ProjectTable(ProjectDetailID int, EmployeeDetailID int, ProjectName varchar(50));
insert into ProjectTable values(1,1,'Task Track'),(2,1,'CLP'), (3,1, 'Survey Management'), (4,2,'HR Management'), (5,3,'Task Track'), (6,3,'GRS'), (7,3, 'DDS'), (8,4,'HR Managrment'), (9,6,'GL Management')

--Q41
select * from ProjectTable

--Q42
SELECT DEPARTMENT, SUM(SALARY) AS TOT_Salary FROM Employee_Detail GROUP BY Department

--Q43
SELECT DEPARTMENT, SUM(SALARY) AS TOT_Salary FROM Employee_Detail GROUP BY Department ORDER BY TOT_Salary

--Q44
SELECT DEPARTMENT, SUM(SALARY) AS TOT_Salary FROM Employee_Detail GROUP BY Department ORDER BY TOT_Salary DESC

--Q45
SELECT DEPARTMENT, COUNT(EmployeeID), SUM(SALARY) AS  TOT_SALARY FROM EMPLOYEE_DETAIL GROUP BY DEPARTMENT

--Q46
SELECT * FROM Employee_Detail
SELECT DEPARTMENT, AVG(SALARY) AS AVG_SALARY FROM Employee_Detail GROUP BY DEPARTMENT ORDER BY AVG_SALARY 

--Q47
SELECT DEPARTMENT, MAX(SALARY) AS MAX_SALARY FROM Employee_Detail GROUP BY DEPARTMENT ORDER BY MAX_SALARY 

--Q48
SELECT DEPARTMENT, MIN(SALARY) AS MIN_SALARY FROM Employee_Detail GROUP BY DEPARTMENT ORDER BY MIN_SALARY 

--Q49
SELECT DEPARTMENT, MIN(SALARY) AS MIN_SALARY FROM Employee_Detail GROUP BY DEPARTMENT ORDER BY MIN_SALARY 

--Q50
SELECT * FROM Employee_Detail
SELECT * FROM ProjectTable
SELECT * FROM Employee_Detail E, ProjectTable P WHERE E.EmployeeID = P.EmployeeDetailID

--Q51
SELECT E.FIRSTNAME, P.ProjectName FROM ProjectTable P LEFT JOIN Employee_Detail E ON E.EmployeeID = P.EmployeeDetailID WHERE P.ProjectName IS NOT NULL ORDER BY FirstName

--Q52
SELECT E.FIRSTNAME, P.ProjectName FROM Employee_Detail E, ProjectTable P WHERE E.EmployeeID = P.EmployeeDetailID ORDER BY FirstName

--Q53
SELECT E.FIRSTNAME, 
(CASE WHEN P.ProjectName IS NULL THEN 'No Project Assigned' ELSE P.ProjectName END ) AS PROJNAME 
FROM Employee_Detail E, ProjectTable P WHERE E.EmployeeID = P.EmployeeDetailID ORDER BY FirstName

--Q54
SELECT E.*, P.ProjectName FROM  Employee_Detail E  LEFT JOIN ProjectTable P ON E.EmployeeID = P.EmployeeDetailID

--Q55
SELECT * FROM  Employee_Detail E FULL OUTER JOIN ProjectTable P ON E.EmployeeID = P.EmployeeDetailID

--Q56
SELECT * FROM  Employee_Detail E FULL OUTER JOIN ProjectTable P ON E.EmployeeID = P.EmployeeDetailID

--Q57
SELECT * FROM  Employee_Detail E FULL OUTER JOIN ProjectTable P ON E.EmployeeID = P.EmployeeDetailID

--Q58
SELECT *,
( SELECT FIRSTNAME   FROM Employee_Detail WHERE EmployeeID=EmployeeDetailID)  AS NAME 
FROM PROJECTTABLE 
WHERE EmployeeDetailID IN (Select A.EmployeeDetailID from  
(select EmployeeDetailID, COUNT(EmployeeDetailID) AS NO_OF_PROJ FROM  ProjectTable GROUP BY EmployeeDetailID having COUNT(EmployeeDetailID) >1)A)

--Q59
SELECT *,
( SELECT FIRSTNAME   FROM Employee_Detail WHERE EmployeeID=EmployeeDetailID)  AS NAME 
FROM PROJECTTABLE 
WHERE EmployeeDetailID IN (Select A.EmployeeDetailID from  
(select EmployeeDetailID, COUNT(EmployeeDetailID) AS NO_OF_PROJ FROM  ProjectTable GROUP BY EmployeeDetailID having COUNT(EmployeeDetailID) >1)A)

--60 
SELECT * FROM  Employee_Detail CROSS JOIN ProjectTable







