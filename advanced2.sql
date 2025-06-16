-- 10. Create 3 triggers and use it, give examples in order to execute trigger
-- Set a new delimiter to handle BEGIN...END block
DELIMITER $$

-- Trigger 1: Before inserting a new payment, check if the amount is greater than 0
CREATE TRIGGER BeforeInsertPayment
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    IF NEW.Amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount must be greater than 0';
    END IF;
END $$

-- Trigger 2: After inserting a new member, send a welcome message (simulated by a log insert)
CREATE TRIGGER AfterInsertMember
AFTER INSERT ON Member
FOR EACH ROW
BEGIN
    INSERT INTO Log (Message) VALUES (CONCAT('Welcome ', NEW.MemberName, '!'));
END $$

-- Trigger 3: Before updating the payment amount, log the old value
CREATE TRIGGER BeforeUpdatePayment
BEFORE UPDATE ON Payment
FOR EACH ROW
BEGIN
    INSERT INTO PaymentLog (OldAmount, NewAmount, PaymentID) 
    VALUES (OLD.Amount, NEW.Amount, OLD.PaymentID);
END $$

-- Reset the delimiter back to default
DELIMITER ;

-- Step 1: Create Log and PaymentLog tables to store logs from triggers
CREATE TABLE IF NOT EXISTS Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Message VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PaymentLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    OldAmount DECIMAL(10, 2),
    NewAmount DECIMAL(10, 2),
    PaymentID INT
);

-- Step 2: Insert a new member to trigger the AfterInsertMember trigger (Hoş geldin mesajı)
INSERT INTO Member (MemberID, MemberName, DateOfBirth, ContactInfo) 
VALUES (26, 'John Doe', '1990-10-10', 'john.doe@example.com');  -- Bu işlem log'a "Welcome John Doe!" mesajını ekleyecek.

-- Step 3: Insert a new payment to trigger BeforeInsertPayment (Geçersiz ödeme miktarı)
INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentDate) 
VALUES (126, 1, -50.00, '2024-02-01');  -- Bu işlem hata verecek çünkü ödeme tutarı negatif.

-- Step 4: Insert a valid payment to trigger BeforeInsertPayment (Geçerli ödeme miktarı)
INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentDate) 
VALUES (127, 1, 100.00, '2024-02-01');  -- Bu işlem başarılı olacak ve ödeme eklenip PaymentLog kaydını tetikleyecek.

-- Step 5: Update the payment to trigger BeforeUpdatePayment (Ödeme güncelleme)
UPDATE Payment
SET Amount = 150.00
WHERE PaymentID = 127;  -- Bu işlem PaymentLog tablosuna eski ve yeni ödeme miktarlarını ekleyecek.

-- Step 6: Verify the results by selecting from the Log and PaymentLog tables
SELECT * FROM Log WHERE Message LIKE 'Welcome%';  -- Bu, John Doe'nun hoş geldin mesajını gösterir.
SELECT * FROM PaymentLog WHERE PaymentID = 127;  -- Bu, PaymentLog tablosunda eski ve yeni ödeme tutarını gösterir.

-- Clean up: Drop the triggers after execution
DROP TRIGGER BeforeInsertPayment;
DROP TRIGGER AfterInsertMember;
DROP TRIGGER BeforeUpdatePayment;