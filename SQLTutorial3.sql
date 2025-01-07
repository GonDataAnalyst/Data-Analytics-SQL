
--Having Clause

--1.15

--SELECT JobTitle, COUNT(JobTitle) AS Puestos
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Group BY JobTitle
--HAVING COUNT(JobTitle) > 1

--SELECT JobTitle, AVG(Salary) AS Promedio
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Group BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

-- Insert, Delete, Update

SELECT *
FROM [SQLTutorial ].dbo.EmployeeDemographics

UPDATE [SQLTutorial ].dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE [SQLTutorial ].dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012

--Truco, arrancar con un Select y despu�s reemplazar el Select por el Delete.

DELETE FROM [SQLTutorial ].dbo.EmployeeDemographics
WHERE EmployeeID = 1005

--Aliasing

SELECT Firstname + ' ' + LastName AS FullName
FROM [SQLTutorial ].dbo.EmployeeDemographics

SELECT AVG(Age) AS AvgAge
FROM [SQLTutorial ].dbo.EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM [SQLTutorial ].dbo.EmployeeDemographics AS Demo
JOIN [SQLTutorial ].dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT Demo.EmployeeID, Demo.FirstName, Demo.FirstName,
	Sal.JobTitle, Ware.Age
FROM [SQLTutorial ].dbo.EmployeeDemographics Demo
LEFT JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
	ON Demo.EmployeeID = Sal. EmployeeID
LEFT JOIN [SQLTutorial ].dbo.WareHouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID

SELECT Dem.FirstName, Dem.LastName, Dem.Gender, Sal.Salary,
	COUNT(Dem.Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQLTutorial ].dbo.EmployeeDemographics Dem
JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID

--Same

SELECT Dem.Gender, COUNT(Dem.Gender)
FROM [SQLTutorial ].dbo.EmployeeDemographics Dem
JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
	ON Dem.EmployeeID = Sal.EmployeeID
GROUP BY Dem.Gender

--CTEs (Common Table Expression) in memmoryy
WITH CTE_Employee AS (
	SELECT 
		Emp.FirstName, 
		Emp.LastName, 
		Emp.Gender, 
		Sal.Salary, 
		COUNT(Emp.Gender) OVER (PARTITION BY Emp.Gender) AS TotalGender, 
		AVG(Sal.Salary) OVER (PARTITION BY Emp.Gender) AS AvgSalary
	FROM [SQLTutorial ].dbo.EmployeeDemographics Emp
	JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
		ON Emp.EmployeeID = Sal.EmployeeID
	WHERE Sal.Salary > 45000
)
SELECT FirstName, AvgSalary
FROM CTE_Employee

--Temp Tables, Temporary tables

CREATE TABLE #temp_Employee (
	EmployeeID int,
	JobTitle varchar(100),
	Salary int
)

SELECT *
	FROM #temp_Employee

INSERT INTO #temp_Employee 
	VALUES (
		'1001', 'HR', '45000'
	)

INSERT INTO #temp_Employee
SELECT *
FROM [SQLTutorial ].dbo.EmployeeSalary

DROP TABLE IF EXISTS #temp_Employee2 --Para que la borre cada ves que corro script // en caso que use Stored procedure
CREATE TABLE #Temp_Employee2 (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM [SQLTutorial ].dbo.EmployeeDemographics Emp
	JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
		ON Emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2

--1:48

-- String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

--Drop Table EmployeeErrors;

CREATE TABLE EmployeeErrors (
	EmployeeID varchar(50)
	,FirstName varchar(50)
	,LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
	('1001 ', 'Jimbo', 'Halbert')
	,(' 1002', 'Pamela', 'Beasely')
	,('1005', 'T0by', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

-- Using TRIM (gets rid of blank spaces), LTRIM (left blank spaces), RTRIM (right blank spaces)

SELECT 
	EmployeeID, 
	TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT 
	EmployeeID, 
	LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT 
	EmployeeID, 
	RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

-- Using Replace

SELECT 
	LastName, 
	REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors

-- Using Substring

SELECT 
	SUBSTRING(FirstName,3,3)
FROM EmployeeErrors

SELECT 
	err.FirstName,
	dem.FirstName,
	SUBSTRING(err.FirstName,1,3),
	SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN [SQLTutorial ].dbo.EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

-- Using UPPER and LOWER

SELECT 
	FirstName, 
	LOWER(FirstName)
FROM EmployeeErrors

SELECT 
	FirstName, 
	UPPER(FirstName)
FROM EmployeeErrors

-- Stored Procedures

CREATE PROCEDURE TEST
AS
SELECT
	*
FROM [SQLTutorial ].dbo.EmployeeDemographics

EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #Temp_Employee (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
	)

INSERT INTO #Temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM [SQLTutorial ].dbo.EmployeeDemographics Emp
	JOIN [SQLTutorial ].dbo.EmployeeSalary Sal
		ON Emp.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT
	*
FROM #Temp_Employee

-- Parameters

EXEC Temp_Employee @JobTitle ='Salesman'

-- Subqueries (in the SELECT, FROM, and WHERE Statement)

SELECT
	*
FROM EmployeeSalary

-- Subquerie in SELECT

SELECT 
	EmployeeID, 
	Salary, 
	(SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- How to do it with Partition By

SELECT 
	EmployeeID, 
	Salary, 
	AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

-- Why Group By doesn't work

SELECT 
	EmployeeID, 
	Salary, 
	AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

-- Subquery in From

SELECT
	a.EmployeeID,
	AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
	FROM EmployeeSalary) a

-- Subquery in WHERE

SELECT 
	EmployeeID, 
	JobTitle, 
	Salary
FROM EmployeeSalary
WHERE EmployeeID in (
	SELECT EmployeeID
	FROM EmployeeDemographics
	WHERE Age>30
	)


-- MYSQL Excercises

SELECT 
    CONCAT(Name,'(',SUBSTR(Occupation,1,1),')') AS names
FROM OCCUPATIONS
ORDER BY Name

SELECT 
    CONCAT(Name,'(',SUBSTR(Occupation,1,1),')') AS names
FROM OCCUPATIONS 

UNION ALL

SELECT 
    CONCAT('There are a total of ',COUNT(*),' ',LOWER(Occupation),'s.') AS names
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY names


Pivot dinamico
SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT Name, Occupation, 
           ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
) AS ranked
GROUP BY rn
ORDER BY rn;


-- 2.16
