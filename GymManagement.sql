CREATE DATABASE IF NOT EXISTS gym_db;
USE gym_db;

-- Var olan tablolari silme
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS MembershipPlan;
DROP TABLE IF EXISTS Coach;
DROP TABLE IF EXISTS Facility;
DROP TABLE IF EXISTS TrainingProgram;

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(50),
    DateOfBirth DATE,
    ContactInfo VARCHAR(100)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

-- Create MembershipPlan Table
CREATE TABLE MembershipPlan (
    PlanID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Duration INT
);
-- Create Coach Table
CREATE TABLE Coach (
    CoachID INT PRIMARY KEY,
    CoachName VARCHAR(50),
    CoachExpertise VARCHAR(50)
);
-- Create Facility Table
CREATE TABLE Facility (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(50),
    Capacity INT
);
-- Create TrainingProgram Table
CREATE TABLE TrainingProgram (
    ProgramID INT PRIMARY KEY,
    Description VARCHAR(100),
    TrainingDuration INT
);

-- Insert data into Member Table
INSERT INTO Member (MemberID, MemberName, DateOfBirth, ContactInfo) VALUES
    (1, 'Alice Johnson', '1990-05-15', 'alice.johnson@example.com'),
    (2, 'Bob Smith', '1985-09-23', 'bob.smith@example.com'),
    (3, 'Catherine Lee', '1992-03-12', 'catherine.lee@example.com'),
    (4, 'David Brown', '1988-07-08', 'david.brown@example.com'),
    (5, 'Ella Davis', '1995-11-19', 'ella.davis@example.com'),
    (6, 'Frank Harris', '1980-01-15', 'frank.harris@example.com'),
    (7, 'Grace Kelly', '1987-04-18', 'grace.kelly@example.com'),
    (8, 'Hannah Moore', '1993-09-21', 'hannah.moore@example.com'),
    (9, 'Ian Carter', '1986-06-10', 'ian.carter@example.com'),
    (10, 'Jane Cooper', '1991-02-25', 'jane.cooper@example.com'),
    (11, 'Kyle Adams', '1983-11-30', 'kyle.adams@example.com'),
    (12, 'Laura Wright', '1994-08-07', 'laura.wright@example.com'),
    (13, 'Matt Bell', '1996-10-13', 'matt.bell@example.com'),
    (14, 'Nina Evans', '1989-03-05', 'nina.evans@example.com'),
    (15, 'Oscar Green', '1997-07-20', 'oscar.green@example.com'),
    (16, 'Paula Hall', '1982-12-01', 'paula.hall@example.com'),
    (17, 'Quinn Walker', '1990-09-14', 'quinn.walker@example.com'),
    (18, 'Rachel Young', '1984-05-09', 'rachel.young@example.com'),
    (19, 'Steve Lewis', '1993-11-11', 'steve.lewis@example.com'),
    (20, 'Tina Martin', '1992-01-22', 'tina.martin@example.com'),
    (21, 'Uma King', '1988-06-16', 'uma.king@example.com'),
    (22, 'Victor Scott', '1981-10-04', 'victor.scott@example.com'),
    (23, 'Wendy Perez', '1995-02-11', 'wendy.perez@example.com'),
    (24, 'Xander Hill', '1990-08-19', 'xander.hill@example.com'),
    (25, 'Yvonne Torres', '1986-07-30', 'yvonne.torres@example.com');
    SELECT * FROM Member;

-- Insert data into Payment Table
INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentDate) VALUES
    (101, 1, 49.99, '2024-01-01'),
    (102, 2, 59.99, '2024-01-02'),
    (103, 3, 39.99, '2024-01-03'),
    (104, 4, 49.99, '2024-01-04'),
    (105, 5, 29.99, '2024-01-05'),
    (106, 6, 39.99, '2024-01-06'),
    (107, 7, 49.99, '2024-01-07'),
    (108, 8, 59.99, '2024-01-08'),
    (109, 9, 29.99, '2024-01-09'),
    (110, 10, 39.99, '2024-01-10'),
    (111, 11, 59.99, '2024-01-11'),
    (112, 12, 49.99, '2024-01-12'),
    (113, 13, 29.99, '2024-01-13'),
    (114, 14, 39.99, '2024-01-14'),
    (115, 15, 49.99, '2024-01-15'),
    (116, 16, 59.99, '2024-01-16'),
    (117, 17, 29.99, '2024-01-17'),
    (118, 18, 39.99, '2024-01-18'),
    (119, 19, 49.99, '2024-01-19'),
    (120, 20, 59.99, '2024-01-20'),
    (121, 21, 29.99, '2024-01-21'),
    (122, 22, 39.99, '2024-01-22'),
    (123, 23, 49.99, '2024-01-23'),
    (124, 24, 59.99, '2024-01-24'),
    (125, 25, 29.99, '2024-01-25');
    SELECT * FROM Payment;

-

-- Insert data into MembershipPlan Table
INSERT INTO MembershipPlan (PlanID, Name, Price, Duration) VALUES
    (1, 'Basic Plan', 29.99, 30),
    (2, 'Standard Plan', 39.99, 60),
    (3, 'Premium Plan', 49.99, 90),
    (4, 'Deluxe Plan', 59.99, 120),
    (5, 'Family Plan', 69.99, 180),
    (6, 'Student Plan', 19.99, 30),
    (7, 'Corporate Plan', 89.99, 365),
    (8, 'Gold Plan', 79.99, 365),
    (9, 'Silver Plan', 49.99, 180),
    (10, 'VIP Plan', 99.99, 365),
    (11, 'Elite Plan', 119.99, 365),
    (12, 'Short-Term Plan', 24.99, 30),
    (13, 'Seasonal Plan', 39.99, 90),
    (14, 'Fitness Plan', 59.99, 120),
    (15, 'Trial Plan', 9.99, 7),
    (16, 'Weekend Plan', 14.99, 7),
    (17, 'Special Plan', 59.99, 90),
    (18, 'Advanced Plan', 79.99, 180),
    (19, 'Flex Plan', 59.99, 365),
    (20, 'Retirement Plan', 49.99, 365),
    (21, 'Workplace Plan', 89.99, 365),
    (22, 'Wellness Plan', 69.99, 180),
    (23, 'Rehabilitation Plan', 99.99, 365),
    (24, 'Sports Plan', 39.99, 90),
    (25, 'Recovery Plan', 19.99, 30);
    SELECT * FROM MembershipPlan ;


-- Insert data into Coach Table
INSERT INTO Coach (CoachID, CoachName, CoachExpertise) VALUES
    (1, 'Emily Clark', 'Yoga'),
    (2, 'James Wilson', 'Strength Training'),
    (3, 'Sophia Martinez', 'Weight Loss'),
    (4, 'Daniel Edwards', 'Pilates'),
    (5, 'Natalie Turner', 'HIIT'),
    (6, 'Michael Carter', 'Cardio'),
    (7, 'Amanda Brown', 'Flexibility'),
    (8, 'Richard Johnson', 'Advanced Strength'),
    (9, 'Anna White', 'Aerobics'),
    (10, 'Chris Lee', 'Functional Training'),
    (11, 'Laura Scott', 'CrossFit'),
    (12, 'Mark Wright', 'Boot Camp'),
    (13, 'Sophia Green', 'Dance Fitness'),
    (14, 'Victor King', 'Outdoor Training'),
    (15, 'Ella Lopez', 'Running'),
    (16, 'Ethan Bell', 'Cycling'),
    (17, 'Olivia Adams', 'Marathon Training'),
    (18, 'Ryan Taylor', 'Boxing'),
    (19, 'Linda Hill', 'Martial Arts'),
    (20, 'Megan Allen', 'Swimming'),
    (21, 'Sarah Young', 'Advanced Yoga'),
    (22, 'Jake Walker', 'Kickboxing'),
    (23, 'Emma Roberts', 'Zumba'),
    (24, 'Liam Campbell', 'Meditation'),
    (25, 'Zoe Harris', 'Lifestyle Transformation');
 SELECT * FROM Coach;


-- Insert data into Facility Table
INSERT INTO Facility (FacilityID, FacilityName, Capacity) VALUES
    (1, 'Main Gym Hall', 100),
    (2, 'Cardio Room', 50),
    (3, 'Yoga Studio', 30),
    (4, 'Pilates Studio', 20),
    (5, 'Swimming Pool', 40),
    (6, 'Cycling Room', 30),
    (7, 'Dance Studio', 50),
    (8, 'Boxing Ring', 20),
    (9, 'Outdoor Training Area', 100),
    (10, 'CrossFit Area', 60),
    (11, 'Strength Room', 75),
    (12, 'Recovery Room', 40),
    (13, 'HIIT Zone', 50),
    (14, 'Kids Zone', 30),
    (15, 'Sauna', 20),
    (16, 'Massage Room', 15),
    (17, 'Weight Room', 50),
    (18, 'Climbing Wall', 30),
    (19, 'Spa Room', 10),
    (20, 'Boxing Training Room', 25),
    (21, 'Stretching Area', 20),
    (22, 'Nutritional Counseling', 5),
    (23, 'Virtual Training Area', 10),
    (24, 'Juice Bar', 15),
    (25, 'Media Room', 30);
SELECT * FROM Facility;


-- Insert data into TrainingProgram Table
INSERT INTO TrainingProgram (ProgramID, Description, TrainingDuration) VALUES
    (1, 'Strength Training Program', 60),
    (2, 'Yoga Program', 60),
    (3, 'Cardio Workout Program', 45),
    (4, 'Pilates Program', 45),
    (5, 'Cycling Program', 60),
    (6, 'HIIT Program', 30),
    (7, 'Swimming Program', 45),
    (8, 'Boxing Program', 45),
    (9, 'CrossFit Program', 60),
    (10, 'Dance Program', 45),
    (11, 'Meditation Program', 30),
    (12, 'Running Program', 60),
    (13, 'Martial Arts Program', 60),
    (14, 'Bootcamp Program', 45),
    (15, 'Recovery Program', 30),
    (16, 'Rehabilitation Program', 60),
    (17, 'Flexibility Program', 45),
    (18, 'Zumba Program', 45),
    (19, 'Advanced Strength Program', 60),
    (20, 'Sports Program', 90),
    (21, 'Running and Cardio Program', 60),
    (22, 'Kickboxing Program', 45),
    (23, 'Stretching Program', 30),
    (24, 'Climbing Program', 60),
    (25, 'Functional Fitness Program', 45);
    SELECT * FROM TrainingProgram;
    
   