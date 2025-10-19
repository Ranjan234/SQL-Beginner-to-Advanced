use Assignments;

SELECT * FROM Employees;

--1. Write a SQL query to find the names of employees whose first names start with the letter 'J'.
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'J%';

--2. Write a SQL query to find the names of employees whose last names end with the letter 'n'.
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%n';

--3. Write a SQL query to find the email addresses of employees that contain the word "john".
SELECT Email
FROM Employees
WHERE Email LIKE '%john%';

--4. Write a SQL query to find the names of employees whose first names have exactly 5 characters.
SELECT FirstName, LastName
FROM Employees
WHERE LEN(FirstName) = 5;
-- OR
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '_____';

--5. Write a SQL query to find the names of employees whose last names contain the letter 'a' as the second character.
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '_a%';

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);

-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

SELECT * FROM Departments;
SELECT * FROM Employees;

--1. Write a SQL query to list the names of employees along with the names of the departments they work in.
SELECT FirstName, LastName , DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

--2. Write a SQL query to list all the departments and the employees working in them, including departments with no employees.
SELECT d.DepartmentID,
       d.DepartmentName,
       e.FirstName, e.LastName 
FROM Departments d
LEFT JOIN Employees e 
ON d.DepartmentID = e.DepartmentID
ORDER BY d.DepartmentName, e.LastName;

--3. Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID).
SELECT e.FirstName, e.LastName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--4. Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = ( SELECT DepartmentID 
                      FROM Employees
					  WHERE FirstName = 'Jane' AND LastName = 'Doe');

--5.Write a SQL query to find the department with the highest total salary paid to its employees.
SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Departments d
JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalSalary DESC; 

---- ASSIGNMENT -5
--1. Write a SQL query to select all columns and rows from the Employees table.
SELECT * FROM Employees;

--2.Write a SQL query to find the names and email addresses of all employees who work in the department with DepartmentID = 101.
SELECT FirstName,LastName,
       Email
FROM Employees
WHERE DepartmentID = '101';

--3.Write a SQL query to find the total number of employees in the Employees table.
SELECT Count(EmployeeID) [Total Employees]
FROM Employees;
--4.Write a SQL query to find the details of employees who were hired in the year 2020.
SELECT FirstName, LastName, 
       HireDate 
FROM Employees
WHERE YEAR(HireDate)  = '2020';
--5. Write a SQL query to update the salary of 'Jane Doe' to 90,000.
UPDATE Employees
SET Salary = 90000
WHERE FirstName = 'Jane' AND LastName = 'Doe';