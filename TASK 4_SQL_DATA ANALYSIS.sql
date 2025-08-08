-- Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Drop if exists (for re-run)
DROP TABLE IF EXISTS Attendance, Clients, Projects, Salaries, Employees, Departments;

-- Departments
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

-- Employees
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender CHAR(1),
    DOB DATE,
    HireDate DATE,
    DeptID INT,
    ManagerID INT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID)
);

-- Salaries
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmpID INT,
    Amount DECIMAL(10,2),
    FromDate DATE,
    ToDate DATE,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

-- Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Clients
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(100),
    Country VARCHAR(50),
    ProjectID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmpID INT,
    AttendanceDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

-- Insert Departments
INSERT INTO Departments VALUES
(1, 'IT', 'New York'),
(2, 'HR', 'Chicago'),
(3, 'Finance', 'Boston'),
(4, 'Marketing', 'Los Angeles'),
(5, 'Operations', 'Dallas');

-- Insert Employees (15 Employees)
INSERT INTO Employees VALUES
(101, 'John', 'Doe', 'M', '1990-05-12', '2015-06-01', 1, NULL),
(102, 'Jane', 'Smith', 'F', '1992-09-23', '2016-08-15', 2, 101),
(103, 'Mike', 'Brown', 'M', '1988-11-05', '2014-04-20', 1, 101),
(104, 'Emily', 'Davis', 'F', '1995-02-14', '2019-03-10', 3, 103),
(105, 'Chris', 'Johnson', 'M', '1985-07-19', '2013-01-15', 4, 101),
(106, 'Laura', 'Wilson', 'F', '1991-12-01', '2018-05-25', 5, 105),
(107, 'David', 'Martinez', 'M', '1989-03-08', '2017-09-18', 1, 103),
(108, 'Sarah', 'Taylor', 'F', '1993-06-30', '2020-07-22', 2, 102),
(109, 'Daniel', 'Anderson', 'M', '1994-11-11', '2021-02-15', 3, 104),
(110, 'Sophia', 'Thomas', 'F', '1987-04-04', '2012-11-05', 4, 105),
(111, 'James', 'Harris', 'M', '1990-08-25', '2016-06-17', 5, 106),
(112, 'Olivia', 'Clark', 'F', '1996-10-19', '2022-01-12', 1, 107),
(113, 'Ethan', 'Lewis', 'M', '1986-09-07', '2010-03-28', 3, 103),
(114, 'Ava', 'Walker', 'F', '1995-12-12', '2019-06-14', 2, 102),
(115, 'Mason', 'Hall', 'M', '1992-02-22', '2015-09-01', 5, 106);

-- Insert Salaries (Multiple records per employee)
INSERT INTO Salaries VALUES
(1, 101, 70000, '2018-01-01', '2019-12-31'),
(2, 101, 75000, '2020-01-01', '2021-12-31'),
(3, 101, 80000, '2022-01-01', NULL),
(4, 102, 55000, '2019-01-01', '2020-12-31'),
(5, 102, 60000, '2021-01-01', NULL),
(6, 103, 68000, '2018-01-01', '2019-12-31'),
(7, 103, 70000, '2020-01-01', NULL),
(8, 104, 48000, '2019-01-01', '2020-12-31'),
(9, 104, 50000, '2021-01-01', NULL),
(10, 105, 72000, '2017-01-01', NULL),
(11, 106, 52000, '2018-01-01', '2020-12-31'),
(12, 106, 55000, '2021-01-01', NULL),
(13, 107, 65000, '2019-01-01', NULL),
(14, 108, 50000, '2020-01-01', NULL),
(15, 109, 48000, '2021-01-01', NULL),
(16, 110, 73000, '2018-01-01', NULL),
(17, 111, 58000, '2019-01-01', NULL),
(18, 112, 45000, '2022-01-01', NULL),
(19, 113, 71000, '2018-01-01', NULL),
(20, 114, 53000, '2020-01-01', NULL),
(21, 115, 60000, '2019-01-01', NULL);

-- Insert Projects (8 Projects)
INSERT INTO Projects VALUES
(201, 'ERP System', '2020-05-01', '2021-05-01', 1),
(202, 'Recruitment Portal', '2021-01-01', NULL, 2),
(203, 'Budget Planning', '2020-06-01', NULL, 3),
(204, 'Marketing Campaign A', '2019-03-01', '2019-09-01', 4),
(205, 'Supply Chain Optimization', '2021-02-01', NULL, 5),
(206, 'Cybersecurity Upgrade', '2022-04-01', NULL, 1),
(207, 'Employee Wellness Program', '2022-01-01', NULL, 2),
(208, 'AI Chatbot', '2023-01-15', NULL, 1);

-- Insert Clients (10 Clients)
INSERT INTO Clients VALUES
(301, 'TechCorp', 'USA', 201),
(302, 'HR Solutions', 'UK', 202),
(303, 'FinancePro', 'Canada', 203),
(304, 'AdWorld', 'USA', 204),
(305, 'LogiTrack', 'Germany', 205),
(306, 'SecureNet', 'France', 206),
(307, 'WellLife', 'USA', 207),
(308, 'ChatAI', 'India', 208),
(309, 'DataSense', 'Australia', 203),
(310, 'CloudPro', 'Singapore', 201);

-- Insert Attendance (Sample for Jan 2023 for first 5 employees)
INSERT INTO Attendance VALUES
(1, 101, '2023-01-01', 'Present'),
(2, 102, '2023-01-01', 'Absent'),
(3, 103, '2023-01-01', 'Present'),
(4, 104, '2023-01-01', 'Present'),
(5, 105, '2023-01-01', 'Present'),
(6, 101, '2023-01-02', 'Absent'),
(7, 102, '2023-01-02', 'Present'),
(8, 103, '2023-01-02', 'Present'),
(9, 104, '2023-01-02', 'Absent'),
(10, 105, '2023-01-02', 'Present');

-- 1. All employees in IT department--
SELECT EmpID, FirstName, LastName, DeptID
FROM Employees
WHERE DeptID = 1
ORDER BY FirstName ASC;

-- 2. Average salary per department
SELECT e.DeptID, d.DeptName, AVG(s.Amount) AS AvgSalary
FROM Employees e
JOIN Salaries s ON e.EmpID = s.EmpID
JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY e.DeptID, d.DeptName
ORDER BY AvgSalary DESC;

-- 3. Employees with their department name
SELECT e.EmpID, e.FirstName, e.LastName, d.DeptName
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

-- 4. All projects and their client names (including projects without clients)
SELECT p.ProjectID, p.ProjectName, c.ClientName
FROM Projects p
LEFT JOIN Clients c ON p.ProjectID = c.ProjectID;


-- 5. All clients and their projects (including clients with no projects) 
SELECT c.ClientName, p.ProjectName
FROM Clients c
RIGHT JOIN Projects p ON c.ProjectID = p.ProjectID;

-- 6. Employees earning above average salary
SELECT EmpID, FirstName, LastName
FROM Employees
WHERE EmpID IN (
    SELECT EmpID
    FROM Salaries
    WHERE Amount > (SELECT AVG(Amount) FROM Salaries)
);

-- 7. Total salary expense for IT department
SELECT SUM(s.Amount) AS TotalSalary_EXPENSE_IT
FROM Salaries s
JOIN Employees e ON s.EmpID = e.EmpID
WHERE e.DeptID = 1;

-- 8. Create a view showing employee name, department, and latest salary
CREATE VIEW EmployeeSalaryView AS
SELECT e.EmpID, 
       CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
       d.DeptName,
       s.Amount AS LatestSalary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
JOIN Salaries s 
    ON e.EmpID = s.EmpID
WHERE s.FromDate = (
    SELECT MAX(FromDate)
    FROM Salaries
    WHERE EmpID = e.EmpID
);
SELECT * FROM EmployeeSalaryView;

-- 9. Create index on Salaries table for faster queries by EmpID
CREATE INDEX idx_salaries_empid ON Salaries(EmpID);

-- 10. Total number of projects handled by each department with total clients
SELECT d.DeptName,
       COUNT(DISTINCT p.ProjectID) AS TotalProjects,
       COUNT(DISTINCT c.ClientID) AS TotalClients
FROM Departments d
LEFT JOIN Projects p ON d.DeptID = p.DeptID
LEFT JOIN Clients c ON p.ProjectID = c.ProjectID
GROUP BY d.DeptName
ORDER BY TotalProjects DESC;