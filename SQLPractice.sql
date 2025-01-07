-- DROP TABLE SQLPractice_BinaryTREE

--CREATE TABLE BinaryTREE
--	(N int,
--	P int
--	)


--INSERT INTO BinaryTREE 
--	VALUES
--		(1,2),
--		(3,2),
--		(6,8),
--		(9,8),
--		(2,5),
--		(8,5),
--		(5,NULL)

--SELECT 
--	*
--FROM BinaryTREE

--SELECT 
--    N,
--    CASE
--        WHEN P IS NULL THEN 'Root'
--        WHEN N IN (SELECT P FROM BinaryTREE WHERE P IS NOT NULL) THEN 'Inner'
--        ELSE 'Leaf'
--    END AS NodeType
--FROM BinaryTREE
--ORDER BY N;


--NEW COMPANIES

CREATE TABLE Company
	(company_code varchar(100),
	founder varchar(100)
	)


INSERT INTO Company 
	VALUES
		('C1','Monika'),
		('C2','Samantha')


CREATE TABLE Lead_Manager
	(lead_manager_code varchar(100),
	company_code varchar(100)
	)


INSERT INTO Lead_Manager 
	VALUES
		('LM1','C1'),
		('LM2','C2')


CREATE TABLE Senior_Manager
	(senior_manager_code varchar(100),
	lead_manager_code varchar(100),
	company_code varchar(100)
	)


INSERT INTO Senior_Manager 
	VALUES
		('SM1','LM1','C1'),
		('SM2','LM1','C1'),
		('SM3','LM2','C2')


CREATE TABLE Manager
	(manager_code varchar(100),
	senior_manager_code varchar(100),
	lead_manager_code varchar(100),
	company_code varchar(100)
	)


INSERT INTO Manager 
	VALUES
		('M1','SM1','LM1','C1'),
		('M2','SM3','LM2','C2'),
		('M3','SM3','LM2','C2')



CREATE TABLE Employee
	(employee_code varchar(100),
	manager_code varchar(100),
	senior_manager_code varchar(100),
	lead_manager_code varchar(100),
	company_code varchar(100)
	)


INSERT INTO Employee 
	VALUES
		('E1','M1','SM1','LM1','C1'),
		('E2','M1','SM1','LM1','C1'),
		('E3','M2','SM3','LM2','C2'),
		('E4','M3','SM3','LM2','C2')

SELECT 
	*
FROM Company

SELECT 
	*
FROM Lead_Manager

SELECT 
	*
FROM Senior_Manager

SELECT 
	*
FROM Manager

SELECT 
	*
FROM Employee


SELECT
	Company.company_code,
	founder,
	(SELECT COUNT(DISTINCT lead_manager_code) FROM Lead_Manager WHERE Company.company_code = Lead_Manager.company_code) AS totalleadm,
	(SELECT COUNT(DISTINCT senior_manager_code) FROM Senior_Manager WHERE Company.company_code = Senior_Manager.company_code) AS totalseniorm,
	(SELECT COUNT(DISTINCT manager_code) FROM Manager WHERE Company.company_code = Manager.company_code) AS totalmanager,
	(SELECT COUNT(DISTINCT employee_code) FROM Employee WHERE Company.company_code = Employee.company_code) AS totalemployee
FROM Company
ORDER BY company_code


SELECT
    CEIL(ABS(AVG(salary) - AVG(CAST(REPLACE(salary, '0', '') AS UNSIGNED)))) AS error_difference
FROM Employees


CREATE TABLE EMPLOYEES (
    employee_id INT,
    name VARCHAR(50),
    months INT,
    salary INT
);

INSERT INTO EMPLOYEES (employee_id, name, months, salary) VALUES
(12228, 'Rose', 15, 1968),
(33645, 'Angela', 1, 3443),
(45692, 'Frank', 17, 1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly', 16, 4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Michael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, 3573);

SELECT
	*
FROM EMPLOYEES


SELECT
	MAX(months*salary) AS max_earnings,
	COUNT(employee_id) AS employee_max_earnings
FROM EMPLOYEES
WHERE (months*salary) = (SELECT MAX(months*salary) FROM EMPLOYEES)



SELECT
    ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)), 4) AS euclidean_distance
FROM STATION;


SELECT 
    ROUND(LAT_N, 4) AS median
FROM (
    SELECT 
        LAT_N, 
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM STATION
) AS ordered_data
WHERE row_num = CEIL(total_rows / 2);


SELECT 
    ROUND(AVG(LAT_N), 4) AS median
FROM (
    SELECT LAT_N
    FROM (
        SELECT 
            LAT_N, 
            ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
            COUNT(*) OVER () AS total_rows
        FROM STATION
    ) AS ordered_data
    WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL(total_rows / 2))
) AS median_values;


WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 20
)
SELECT 
    REPEAT('* ', n) AS pattern
FROM numbers;


SELECT
    City.Name
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
WHERE Country.Continent = 'Africa'


SELECT
    Country.Continent,
    FLOOR(AVG(City.Population)) AS avgpopulation
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
GROUP BY Country.Continent


SELECT
    SUM(City.Population) AS sumpopulation
FROM City
JOIN Country
    ON City.CountryCode = Country.Code
WHERE Country.Continent = 'Asia'

SELECT
    Hackers.hacker_id,
    Hackers.name
FROM Hackers
JOIN Submissions
    ON Hackers.hacker_id = Submissions.hacker_id
JOIN Challenges
    ON Submissions.challenge_id = Challenges.challenge_id
JOIN Difficulty
    ON Challenges.difficulty_level = Difficulty.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, Hackers.hacker_id ASC;

SELECT
    CASE 
        WHEN Grades.Grade >= 8 THEN Students.Name 
        ELSE 'NULL' 
    END AS studentsname,
    Grades.Grade,
    Students.Marks
FROM Students
JOIN Grades
    ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark
ORDER BY Grades.Grade DESC,
    CASE
        WHEN Grades.Grade >= 8 THEN Students.Name
        ELSE Students.Marks
    END ASC






CREATE TABLE Hackers (
	hacker_id int,
	name varchar(50)
)

INSERT INTO Hackers (hacker_id, name) VALUES
	(5580, 'Rose'),
	(8439, 'Angela'),
	(27205, 'Frank'),
	(52243, 'Patrick'),
	(52348, 'Lisa'),
	(57645, 'Kimberly'),
	(77726, 'Bonnie'),
	(83082, 'Michael'),
	(86870, 'Todd'),
	(90411, 'Joe');


CREATE TABLE Difficulty (
	difficulty_level int,
	score int
)

INSERT INTO Difficulty (difficulty_level, score) VALUES
	(1,20),
	(2,30),
	(3,40),
	(4,60),
	(5,80),
	(6,100),
	(7,120);


CREATE TABLE Challenges (
	challenge_id int,
	hacker_id int,
	difficulty_level int
)

INSERT INTO Challenges (challenge_id, hacker_id, difficulty_level) VALUES
	(4810, 77726, 4),
	(21089, 27205, 1),
	(36566, 5580, 7),
	(66730, 52243, 6),
	(71055, 52243, 2);


CREATE TABLE Submissions (
	submission_id int,
	hacker_id int,
	challenge_id int,
	score int
)

INSERT INTO Submissions (submission_id, hacker_id, challenge_id, score) VALUES
	(68628, 77726, 36566, 30),
	(65300, 77726, 21089, 10),
	(40326, 52243, 36566, 77),
	(8941, 27205, 4810, 4),
	(83554, 77726, 66730, 30),
	(43353, 52243, 66730, 0),
	(55385, 52348, 71055, 20),
	(39784, 27205, 71055, 23),
	(94613, 86870, 71055, 30),
	(45788, 52348, 36566, 0),
	(93058, 86870, 36566, 30),
	(7344, 8439, 66730, 92),
	(2721, 8439, 4810, 36),
	(523, 5580, 71055, 4),
	(49105, 52348, 66730, 0),
	(55877, 57645, 66730, 80),
	(38355, 27205, 66730, 35),
	(3924, 8439, 36566, 80),
	(97397, 90411, 66730, 100),
	(84162, 83082, 4810, 40),
	(97431, 90411, 71055, 30);


SELECT
	Hackers.hacker_id,
	Hackers.name
FROM Hackers
JOIN Challenges
	ON Hackers.hacker_id = Challenges.hacker_id
JOIN Submissions
	ON Challenges.challenge_id = Submissions.challenge_id
JOIN Difficulty
	ON Challenges.difficulty_level = Difficulty.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, Hackers.hacker_id ASC;

