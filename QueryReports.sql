USE SmartQueueDB;
--QUERIES--

--query 1 (Shows full appointment list with customer name, service, staff, date/time, and status)--
SELECT 
    A.AppointmentID,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    S.ServiceName,
    ST.Name AS StaffName,
    A.Date,
    A.TimeSlot,
    A.Status
FROM Appointment A
JOIN Customer C ON A.CustomerID = C.CustomerID
JOIN Service S ON A.ServiceID = S.ServiceID
JOIN Staff ST ON A.StaffID = ST.StaffID
ORDER BY A.Date, A.TimeSlot;

--query 2 (Returns the total number of appointments made for each banking service)--
SELECT 
    S.ServiceName,
    COUNT(A.AppointmentID) AS TotalAppointments
FROM Appointment A
JOIN Service S ON A.ServiceID = S.ServiceID
GROUP BY S.ServiceName
ORDER BY TotalAppointments DESC;

--query 3 (Shows all appointments that are still marked as 'Pending')--
SELECT 
    A.AppointmentID,
    C.FirstName + ' ' + C.LastName AS CustomerName,
    S.ServiceName,
    A.Date,
    A.TimeSlot
FROM Appointment A
JOIN Customer C ON A.CustomerID = C.CustomerID
JOIN Service S ON A.ServiceID = S.ServiceID
WHERE A.Status = 'Pending'
ORDER BY A.Date, A.TimeSlot;

--query 4 (Returns the service-staff pair with the highest number of appointments)--
SELECT TOP 1
    S.ServiceName,
    ST.Name AS StaffName,
    COUNT(A.AppointmentID) AS TotalAppointments
FROM Appointment A
JOIN Service S ON A.ServiceID = S.ServiceID
JOIN Staff ST ON A.StaffID = ST.StaffID
GROUP BY S.ServiceName, ST.Name
ORDER BY TotalAppointments DESC;

--query 5 (Shows the number of tokens issued on each individual date)--
SELECT 
    CAST(T.IssueTime AS DATE) AS IssueDate,
    COUNT(TokenID) AS TotalTokens
FROM Token T
GROUP BY CAST(T.IssueTime AS DATE)
ORDER BY IssueDate;