--9/7/24

--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male')
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000) 

--DELETE FROM EmployeeSalary
--WHERE EmployeeID = 1001;

--SELECT * FROM [SQLTutorial ].dbo.EmployeeDemographics

--SELECT ROUND(LONG_W,4) // ROUND cantidad decimales
--FROM STATION

--SELECT FirstName, LastName
--FROM [SQLTutorial ].dbo.EmployeeDemographics

--Select Statement
--*, Top, Distinct, Count, AS, Max, Min, AVG

--SELECT TOP 5 *
--FROM [SQLTutorial ].dbo.EmployeeDemographics

--SELECT DISTINCT(EmployeeID)
--FROM [SQLTutorial ].dbo.EmployeeDemographics

--SELECT DISTINCT(Gender)
--FROM [SQLTutorial ].dbo.EmployeeDemographics

--SELECT COUNT(LastName) AS Pedro
--FROM [SQLTutorial ].dbo.EmployeeDemographics

--SELECT *
--FROM [SQLTutorial ].dbo.EmployeeSalary

--SELECT MAX(Salary) AS MaxSalary
--FROM [SQLTutorial ].dbo.EmployeeSalary

--SELECT MIN(Salary) AS MinSalary
--FROM [SQLTutorial ].dbo.EmployeeSalary

--SELECT AVG(Salary) AS AvgSalary
--FROM [SQLTutorial ].dbo.EmployeeSalary

--Where Statement
--=, <>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName = 'Jim

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName <> 'Jim'

--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30
--ORDER BY Gender ASC

--SELECT *
--FROM EmployeeDemographics
--WHERE Age < 38
--ORDER BY FirstName DESC

--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30 AND Gender = 'Female'
--ORDER BY Age ASC

--SELECT *
--FROM EmployeeDemographics
--WHERE Age >= 30 OR Gender = 'Female'
--ORDER BY Age ASC

--SELECT Name
--FROM Students
--WHERE Marks > 75
--ORDER BY RIGHT (Name,3), ID  // ORDER BY RIGHT (x,0) // ORDER BY LEFT (x,0) // ORDER BY x,y

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%'

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE '%S%'

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE '%S'

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName LIKE 'S%O%'

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName is NULL

--SELECT *
--FROM EmployeeDemographics
--WHERE LastName is NOT NULL

--SELECT *
--FROM EmployeeDemographics
--WHERE FirstName IN('Toby','Michael')

--3
--SELECT *
--FROM EmployeeDemographics

--SELECT DISTINCT(Gender)
--FROM EmployeeDemographics

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--GROUP BY Gender

--SELECT Gender, Age, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--GROUP BY Gender, Age

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age >30
--GROUP BY Gender

--43min

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age >30
--GROUP BY Gender

--43min

--9/10/24

--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age >30
--GROUP BY Gender
--ORDER BY CountGender ASC

--SELECT * 
--FROM EmployeeDemographics
--ORDER BY Age, Gender

--SELECT * 
--FROM EmployeeDemographics
--ORDER BY 4 DESC, 5 DESC

--Inner Joins, Full/Left/Right Outer Joins
--Tipo				Filas de tabla A		Filas de tabla B	Incluye filas sin coincidencia
--INNER JOIN		Solo con match			Solo con match		No
--LEFT JOIN			Todas					Solo con match		Sí (para tabla B: NULL)
--RIGHT JOIN		Solo con match			Todas				Sí (para tabla A: NULL)
--FULL OUTER JOIN	Todas					Todas				Sí
--CROSS JOIN		Todas × Todas			Todas × Todas		No

--DELETE FROM EmployeeDemographics

--9/11/24

--SELECT * FROM EmployeeDemographics

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male'),
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--SELECT * FROM EmployeeSalary

--INSERT INTO EmployeeSalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)

--SELECT *
--FROM EmployeeDemographics
--Inner Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM EmployeeDemographics
--Full Outer Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM EmployeeDemographics
--Left Outer Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM EmployeeDemographics
--Right Outer Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM EmployeeDemographics
--Inner Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM EmployeeDemographics
--Left Outer Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM EmployeeDemographics
--Inner Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC

--SELECT JobTitle, AVG(Salary)
--FROM EmployeeDemographics
--Inner Join EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle

--Union, Union All

--CREATE TABLE WareHouseEmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50))

--INSERT INTO WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT *
--FROM WareHouseEmployeeDemographics

--SELECT *
--FROM EmployeeDemographics
--Full Outer Join WareHouseEmployeeDemographics
--	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

--SELECT *
--FROM EmployeeDemographics
--UNION
--SELECT *
--FROM WareHouseEmployeeDemographics

--SELECT *
--FROM EmployeeDemographics
--UNION All
--SELECT *
--FROM WareHouseEmployeeDemographics
--ORDER BY EmployeeID

--SELECT EmployeeID, FirstName, Age
--FROM EmployeeDemographics
--UNION
--SELECT EmployeeID, JobTitle, Salary
--FROM EmployeeSalary
--ORDER BY EmployeeID

--Case Statement

--SELECT FirstName, LastName, Age,
--CASE
--	WHEN Age > 30 THEN 'Old'
--	WHEN Age = 38 THEN 'Stanley'
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--	ELSE 'Baby'
--END AS Elder
--FROM EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN Jobtitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary * .03)
--END AS SalaryAfterRaise
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT 
--CASE
--    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
--    WHEN A = B AND B = C THEN 'Equilateral'
--    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
--    ELSE 'Scalene'
--END AS Triangulo
--FROM TRIANGLES;

--Having Clause

--1.15

--11/18/24

