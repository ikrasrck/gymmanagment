-- 11 Create 3 queries with DISTINCT clause
SELECT DISTINCT CoachExpertise FROM Coach;
SELECT DISTINCT Capacity FROM Facility;
SELECT DISTINCT MemberName FROM Member;

-- 12. Create 7 queries with String Functions
SELECT UPPER(MemberName) AS UpperCaseName FROM Member;
SELECT LOWER(MemberName) AS LowerCaseName FROM Member;
SELECT LENGTH(MemberName) AS NameLength FROM Member;
SELECT CONCAT(MemberName, ' - ', ContactInfo) AS MemberDetails FROM Member;
SELECT SUBSTRING(MemberName, 1, 3) AS ShortName FROM Member;
SELECT REPLACE(MemberName, 'a', '@') AS ReplacedName FROM Member;
SELECT TRIM(' ' FROM MemberName) AS TrimmedName FROM Member;

-- 13. Create 7 queries with Numeric Functions
SELECT ROUND(Price, 2) AS RoundedPrice FROM MembershipPlan;
SELECT FLOOR(Capacity) AS FloorCapacity FROM Facility;
SELECT CEIL(Capacity) AS CeilCapacity FROM Facility;
SELECT ABS(Capacity - 50) AS AbsoluteDifference FROM Facility;
SELECT POWER(Price, 2) AS PriceSquared FROM MembershipPlan;
SELECT MOD(Capacity, 5) AS Remainder FROM Facility;
SELECT SQRT(Duration) AS SquareRootDuration FROM MembershipPlan;

-- 14. Create 7 queries with Date Functions
SELECT CURDATE() AS CurrentDate;
SELECT DATE_ADD(DateOfBirth, INTERVAL 5 YEAR) AS NewDate FROM Member;
SELECT DATE_SUB(DateOfBirth, INTERVAL 1 MONTH) AS SubtractedDate FROM Member;
SELECT YEAR(DateOfBirth) AS BirthYear FROM Member;
SELECT MONTHNAME(DateOfBirth) AS BirthMonth FROM Member;
SELECT DAYOFWEEK(DateOfBirth) AS BirthDayOfWeek FROM Member;
SELECT TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS Age FROM Member;

-- 15. Create 3 queries with aggregate functions
SELECT COUNT(*) AS TotalMembers FROM Member;
SELECT MIN(Amount) AS MinPayment FROM Payment;
SELECT AVG(Price) AS AvgPlanPrice FROM MembershipPlan;

-- 16. Use LIMIT clause
SELECT * FROM Member LIMIT 5;
SELECT * FROM Payment ORDER BY Amount DESC LIMIT 3;
SELECT * FROM Facility LIMIT 10 OFFSET 5;

 
-- 17 Roll Up   
-- Query 1: Sum of Payments grouped by MemberID, including rollup total
SELECT MemberID, SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY MemberID WITH ROLLUP;

-- Query 2: Count of Members grouped by Year of Birth, including rollup total
SELECT YEAR(DateOfBirth) AS BirthYear, COUNT(*) AS MemberCount
FROM Member
GROUP BY YEAR(DateOfBirth) WITH ROLLUP;

-- Query 3: Group Payments by Amount ranges with ROLLUP
SELECT CASE
        WHEN Amount < 40 THEN 'Less than 40'
        WHEN Amount BETWEEN 40 AND 60 THEN 'Between 40 and 60'
        ELSE 'Greater than 60'
        END AS PaymentRange,
        COUNT(*) AS PaymentCount
FROM Payment
GROUP BY PaymentRange WITH ROLLUP;