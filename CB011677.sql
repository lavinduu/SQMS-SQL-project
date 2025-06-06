--Create Database--
CREATE DATABASE SmartQueueDB;



--ADMIN--
CREATE TABLE Admin (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

--ADMIN_CONTACT--
CREATE TABLE AdminContact (
    ContactNumber VARCHAR(15) NOT NULL,
    AdminID INT NOT NULL,
    PRIMARY KEY (ContactNumber, AdminID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

--CUSTOMER--
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

--CUSTOMER_CONTACT--
CREATE TABLE CustomerContact (
    ContactNumber VARCHAR(15) NOT NULL,
    CustomerID INT NOT NULL,
    PRIMARY KEY (ContactNumber, CustomerID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--STAFF--
CREATE TABLE Staff (
    StaffID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    AdminID INT NOT NULL,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

--SERVICE--
CREATE TABLE Service (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    AdminID INT NOT NULL,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

--APPOINTMENT--
CREATE TABLE Appointment (
    AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE NOT NULL,
    TimeSlot VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    CustomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    StaffID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

--TOKEN--
CREATE TABLE Token (
    TokenID INT IDENTITY(1,1) PRIMARY KEY,
    TokenNo VARCHAR(20) NOT NULL,
    IssueTime DATETIME NOT NULL,
    AppointmentID INT NOT NULL,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);


--INSERTING THE DATA--

-- Insert Admins
INSERT INTO Admin (FirstName, LastName, Email, Password) VALUES
('John', 'Doe', 'john.doe@bank.com', 'hashedpwd1'),
('Jane', 'Smith', 'jane.smith@bank.com', 'hashedpwd2'),
('Alice', 'Brown', 'alice.brown@bank.com', 'hashedpwd3'),
('Robert', 'Taylor', 'robert.taylor@bank.com', 'hashedpwd4'),
('Emily', 'Clark', 'emily.clark@bank.com', 'hashedpwd5'),
('David', 'Lee', 'david.lee@bank.com', 'hashedpwd6'),
('Sophie', 'Hall', 'sophie.hall@bank.com', 'hashedpwd7'),
('Chris', 'Adams', 'chris.adams@bank.com', 'hashedpwd8'),
('Nina', 'King', 'nina.king@bank.com', 'hashedpwd9'),
('Mark', 'Wright', 'mark.wright@bank.com', 'hashedpwd10');

-- Insert AdminContacts
INSERT INTO AdminContact (ContactNumber, AdminID) VALUES
('0711111111', 1), ('0722222222', 2), ('0733333333', 3),
('0744444444', 4), ('0755555555', 5), ('0766666666', 6),
('0777777777', 7), ('0788888888', 8), ('0799999999', 9),
('0700000000', 10);

-- Insert Customers
INSERT INTO Customer (FirstName, LastName, Email, Password) VALUES
('Adam', 'West', 'adam.west@email.com', 'pass1'),
('Bruce', 'Wayne', 'bruce.wayne@email.com', 'pass2'),
('Clark', 'Kent', 'clark.kent@email.com', 'pass3'),
('Diana', 'Prince', 'diana.prince@email.com', 'pass4'),
('Barry', 'Allen', 'barry.allen@email.com', 'pass5'),
('Arthur', 'Curry', 'arthur.curry@email.com', 'pass6'),
('Victor', 'Stone', 'victor.stone@email.com', 'pass7'),
('Hal', 'Jordan', 'hal.jordan@email.com', 'pass8'),
('Oliver', 'Queen', 'oliver.queen@email.com', 'pass9'),
('Kara', 'Zor-El', 'kara.zorel@email.com', 'pass10');

-- Insert CustomerContacts
INSERT INTO CustomerContact (ContactNumber, CustomerID) VALUES
('0711234561', 1), ('0711234562', 2), ('0711234563', 3),
('0711234564', 4), ('0711234565', 5), ('0711234566', 6),
('0711234567', 7), ('0711234568', 8), ('0711234569', 9),
('0711234570', 10);

-- Insert Staff
INSERT INTO Staff (Name, Email, Password, AdminID) VALUES
('Jake Paul', 'jake.paul@bank.com', 'st1', 1),
('Logan Paul', 'logan.paul@bank.com', 'st2', 2),
('Mike Ross', 'mike.ross@bank.com', 'st3', 3),
('Harvey Specter', 'harvey.specter@bank.com', 'st4', 4),
('Rachel Zane', 'rachel.zane@bank.com', 'st5', 5),
('Donna Paulsen', 'donna.paulsen@bank.com', 'st6', 6),
('Louis Litt', 'louis.litt@bank.com', 'st7', 7),
('Jessica Pearson', 'jessica.pearson@bank.com', 'st8', 8),
('Katrina Bennett', 'katrina.bennett@bank.com', 'st9', 9),
('Harold Gunderson', 'harold.g@bank.com', 'st10', 10);

-- Insert Services
INSERT INTO Service (ServiceName, Description, AdminID) VALUES
('Account Opening', 'Open a new bank account', 1),
('Loan Application', 'Apply for personal/business loan', 2),
('Card Issue', 'Issue new debit/credit card', 3),
('Deposit', 'Cash or cheque deposit', 4),
('Withdrawal', 'Cash withdrawal', 5),
('Account Closure', 'Close an existing account', 6),
('Online Banking Help', 'Support for online banking', 7),
('Cheque Book Request', 'Request new cheque book', 8),
('Dispute Resolution', 'Handle account disputes', 9),
('Fixed Deposit', 'Open a fixed deposit account', 10);

-- Insert Appointments
INSERT INTO Appointment (Date, TimeSlot, Status, CustomerID, ServiceID, StaffID) VALUES
('2025-06-05', '09:00 AM', 'Pending', 1, 1, 1),
('2025-06-05', '09:30 AM', 'Confirmed', 2, 2, 2),
('2025-06-05', '10:00 AM', 'Completed', 3, 3, 3),
('2025-06-05', '10:30 AM', 'Pending', 4, 4, 4),
('2025-06-05', '11:00 AM', 'Cancelled', 5, 5, 5),
('2025-06-05', '11:30 AM', 'Pending', 6, 6, 6),
('2025-06-05', '12:00 PM', 'Confirmed', 7, 7, 7),
('2025-06-05', '12:30 PM', 'Completed', 8, 8, 8),
('2025-06-05', '01:00 PM', 'Pending', 9, 9, 9),
('2025-06-05', '01:30 PM', 'Confirmed', 10, 10, 10);

-- Insert Tokens
INSERT INTO Token (TokenNo, IssueTime, AppointmentID) VALUES
('T001', '2025-06-05 08:50:00', 1),
('T002', '2025-06-05 09:20:00', 2),
('T003', '2025-06-05 09:50:00', 3),
('T004', '2025-06-05 10:20:00', 4),
('T005', '2025-06-05 10:50:00', 5),
('T006', '2025-06-05 11:20:00', 6),
('T007', '2025-06-05 11:50:00', 7),
('T008', '2025-06-05 12:20:00', 8),
('T009', '2025-06-05 12:50:00', 9),
('T010', '2025-06-05 01:20:00', 10);




--TRANSACTION--
-- This transaction performs a complete booking, It inserts an appointment, then issues a token,If any step fails, it can be rolled back to prevent data inconsistency.--
BEGIN TRANSACTION;

-- Step 1: Insert a new appointment--
INSERT INTO Appointment (Date, TimeSlot, Status, CustomerID, ServiceID, StaffID)
VALUES ('2025-06-11', '03:00 PM', 'Pending', 1, 1, 1);

-- Step 2: Capture the new AppointmentID using SCOPE_IDENTITY()--
DECLARE @NewAppointmentID INT;
SET @NewAppointmentID = SCOPE_IDENTITY();

-- Step 3: Insert the corresponding token using the new appointment ID--
INSERT INTO Token (TokenNo, IssueTime, AppointmentID)
VALUES ('T012', GETDATE(), @NewAppointmentID);

-- Step 4: Commit the transaction if all steps are successful--
COMMIT TRANSACTION;
PRINT '✅ Transaction committed successfully.';

--View the token just created--
SELECT* FROM Token;


