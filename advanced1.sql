-- 1. Create a query by LEFT JOIN
SELECT Member.MemberName, Payment.Amount, Payment.PaymentDate
FROM Member
LEFT JOIN Payment ON Member.MemberID = Payment.MemberID;

-- 2. Create a query by RIGHT JOIN
SELECT Coach.CoachName, TrainingProgram.Description
FROM TrainingProgram
RIGHT JOIN Coach ON TrainingProgram.ProgramID = Coach.CoachID;

-- 3. Create 3 queries with Joining 2 tables
SELECT Member.MemberName, Payment.Amount
FROM Member
JOIN Payment ON Member.MemberID = Payment.MemberID;

SELECT MembershipPlan.Name, Member.MemberName
FROM MembershipPlan
JOIN Member ON MembershipPlan.PlanID = Member.MemberID % 25 + 1;

SELECT Coach.CoachName, TrainingProgram.Description
FROM Coach
JOIN TrainingProgram ON Coach.CoachID = TrainingProgram.ProgramID;

-- 4. Create 3 queries with Joining 3 tables
SELECT Member.MemberName, Payment.Amount, MembershipPlan.Name AS PlanName
FROM Member
JOIN Payment ON Member.MemberID = Payment.MemberID
JOIN MembershipPlan ON MembershipPlan.PlanID = Payment.MemberID % 25 + 1;

SELECT Coach.CoachName, TrainingProgram.Description, Facility.FacilityName
FROM Coach
JOIN TrainingProgram ON Coach.CoachID = TrainingProgram.ProgramID
JOIN Facility ON Facility.FacilityID = TrainingProgram.ProgramID;

SELECT Member.MemberName, Coach.CoachName, TrainingProgram.Description
FROM Member
JOIN Payment ON Member.MemberID = Payment.MemberID
JOIN Coach ON Coach.CoachID = Member.MemberID % 25 + 1
JOIN TrainingProgram ON TrainingProgram.ProgramID = Coach.CoachID;

-- 5. Create 3 queries with subquery in WHERE clause
SELECT Member.MemberName
FROM Member
WHERE MemberID IN (SELECT MemberID FROM Payment WHERE Amount > (SELECT AVG(Amount) FROM Payment));

SELECT FacilityName
FROM Facility
WHERE Capacity > (SELECT AVG(Capacity) FROM Facility);

SELECT MemberName
FROM Member
WHERE MemberID IN (SELECT MemberID FROM Payment WHERE Amount BETWEEN 30 AND 50);

-- 6. Create 3 queries with subquery in SELECT columns 
SELECT MemberName, (SELECT SUM(Amount) FROM Payment WHERE Payment.MemberID = Member.MemberID) AS TotalPayments 
FROM Member;

SELECT FacilityName, (SELECT AVG(Capacity) FROM Facility) AS AvgCapacity 
FROM Facility;

SELECT Name AS PlanName, (SELECT COUNT(MemberID) FROM Member WHERE MemberID % 25 + 1 = PlanID) AS MemberCount
FROM MembershipPlan;

-- 7. Copy one table structure and data to new table
CREATE TABLE MemberCopy AS
SELECT * FROM Member;

-- 8. Create a VIEW
CREATE VIEW MemberPaymentView AS
SELECT Member.MemberName, Payment.Amount, Payment.PaymentDate
FROM Member
JOIN Payment ON Member.MemberID = Payment.MemberID;

-- 9. Create a stored procedure and call it
-- Query: Create a stored procedure to get total payments for a specific member
DELIMITER $$

CREATE PROCEDURE GetTotalPaymentsForMember(IN memID INT)
BEGIN
    SELECT SUM(Amount) AS TotalPayment
    FROM Payment
    WHERE MemberID = memID;
END $$

DELIMITER ;
-- Calling the stored procedure for MemberID = 1
CALL GetTotalPaymentsForMember(1);

