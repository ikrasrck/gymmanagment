-- 1 Insert 3 tuples into the Payment table
INSERT INTO Payment (PaymentID, Amount, PaymentDate) VALUES
    (126,  39.99, '2024-02-01'),
    (127,  49.99, '2024-02-02'),
    (128,  59.99, '2024-02-03');
INSERT INTO Coach (CoachID, CoachName, CoachExpertise) VALUES
    (26, 'John Doe', 'Strength and Conditioning'),
    (27, 'Emily Stone', 'Boxing and Kickboxing'),
    (28, 'Robert Taylor', 'Yoga and Meditation');
INSERT INTO Member (MemberID, MemberName, DateOfBirth, ContactInfo) VALUES
    (26, 'Zara Fox', '1998-02-14', 'zara.fox@example.com'),
    (27, 'Liam Ward', '1991-11-11', 'liam.ward@example.com'),
    (28, 'Oliver Blake', '1994-04-10', 'oliver.blake@example.com');
    
-- 2 INSERT 5 tuples to the same table
INSERT INTO Facility (FacilityID, FacilityName, Capacity) VALUES
    (26, 'TRX Room', 20),
    (27, 'Cardio Hall', 50),
    (28, 'Outdoor Pool', 35),
    (29, 'Personal Training Room', 15),
    (30, 'Private Yoga Studio', 10);
    
-- 3. UPDATE 3 tuples in different tables    
UPDATE Member SET ContactInfo = 'alice.johnson@example.com' WHERE MemberID = 1;
UPDATE Member SET ContactInfo = 'bob.smith@example.com' WHERE MemberID = 2;
UPDATE Member SET ContactInfo = 'jennifer.cethman@example.com' WHERE MemberID = 3;

UPDATE Payment SET Amount = 69.99 WHERE PaymentID = 101;
UPDATE Payment SET Amount = 89.99 WHERE PaymentID = 102;
UPDATE Payment SET Amount = 59.99 WHERE PaymentID = 103;

UPDATE Facility SET Capacity = 25 WHERE FacilityID = 1;
UPDATE Facility SET Capacity = 35 WHERE FacilityID = 2;
UPDATE Facility SET Capacity = 15 WHERE FacilityID = 3;

-- 4. DELETE 3 tuples in different tables
DELETE FROM MembershipPlan WHERE PlanID = 1;
DELETE FROM MembershipPlan WHERE PlanID = 2;
DELETE FROM MembershipPlan WHERE PlanID = 3;

DELETE FROM Payment WHERE PaymentID = 125;
DELETE FROM Payment WHERE PaymentID = 126;
DELETE FROM Payment WHERE PaymentID = 127;

DELETE FROM Coach WHERE CoachID = 10;
DELETE FROM Coach WHERE CoachID = 11;
DELETE FROM Coach WHERE CoachID = 12;

-- 5. Add CHECK constraint
ALTER TABLE MembershipPlan
ADD CONSTRAINT chk_price CHECK (Price >= 0);

-- 6. Create 3 queries with WHERE clause and comparison operators
-- Query 1: Members born after 1990
SELECT * FROM Member WHERE DateOfBirth > '1990-01-01';

-- Query 2: Payments greater than 50
SELECT * FROM Payment WHERE Amount > 50;

-- Query 3: Coaches who have 'Yoga' expertise
SELECT * FROM Coach WHERE CoachExpertise = 'Yoga';

-- 7 Create 3 queries with WHERE clause and arithmetic operators
-- Query 1: Members whose year of birth is after 1990 and month is after June
SELECT * FROM Member WHERE YEAR(DateOfBirth) > 1990 AND MONTH(DateOfBirth) > 6;

-- Query 2: Payments where amount minus 20 is less than 40
SELECT * FROM Payment WHERE Amount - 20 < 40.00;

-- Query 3: Membership plans with price plus 10 greater than 50
SELECT * FROM MembershipPlan WHERE Price + 10 > 50.00;

-- 8 Create 3 queries with WHERE clause and logical operators
SELECT * FROM Member WHERE DateOfBirth < '1990-01-01' AND MemberName LIKE 'A%';
SELECT * FROM Payment WHERE Amount > 30 OR PaymentDate > '2024-01-15';
SELECT * FROM Facility WHERE Capacity BETWEEN 10 AND 50 AND FacilityName LIKE '%Room';
 
 
-- 9 Create 3 queries with special operators
SELECT * FROM Member WHERE MemberName LIKE 'A%';
SELECT * FROM Payment WHERE PaymentDate BETWEEN '2024-01-01' AND '2024-01-10';
SELECT * FROM Facility WHERE FacilityID IN (1, 2, 3);

-- 10. Create 3 queries with ORDER BY clause
SELECT * FROM Member ORDER BY MemberName ASC;
SELECT * FROM Payment ORDER BY Amount DESC;
SELECT * FROM Facility ORDER BY Capacity ASC;