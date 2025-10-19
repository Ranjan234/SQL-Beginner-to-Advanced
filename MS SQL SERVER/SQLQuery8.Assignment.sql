
-- Create new database Assignments.
CREATE DATABASE Assignments;

use Assignments;
--Step 1) Create Table
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');

SELECT * FROM EmployeeSales;

--***********************************************************************************
--Column Definitions

SaleID (INT PRIMARY KEY): Unique identifier for each sale.
EmployeeID (INT): Identifier for the employee who made the sale.
Department (VARCHAR(50)): Name of the department where the sale was made.
SaleAmount (DECIMAL(10, 2)): Total amount of the sale.
SaleDate (DATE): Date when the sale occurred.
--***********************************************************************************

--  Questions for this assignment
--1. Write a query to calculate the total sales amount for each department in the EmployeeSales table.
SELECT  Department, SUM(SaleAmount) [Total sales]
FROM EmployeeSales
GROUP BY Department;

--2. Write a query to count the number of sales made by each employee.
SELECT EmployeeID, COUNT(SaleID) [Number of Sales]
FROM EmployeeSales
GROUP BY EmployeeID;

--3. Write a query to calculate the average sale amount for each department.
SELECT  Department, AVG(SaleAmount) [Average sales]
FROM EmployeeSales
GROUP BY Department;

-- 4. Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.
SELECT  EmployeeID,
        SUM(SaleAmount) [Total sales],
		COUNT(*) [Number of sales]
  FROM EmployeeSales
  GROUP BY EmployeeID
  HAVING COUNT(*)>1;

-- 5.Write a query to find the total sales for each month in 2023.
SELECT MONTH(SaleDate) AS Month, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
WHERE YEAR(SaleDate) = 2023
GROUP BY MONTH(SaleDate);

---- New Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

SELECT * FROM Employees;
-- 6. Write a SQL query to find the names of employees who have a salary higher than the average salary of all employees.
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >(SELECT  AVG(Salary) FROM Employees);

--7. Write a SQL query to list the employee names and their departments for employees who were hired after the oldest employee in the company.
SELECT FirstName, LastName, DepartmentID
FROM Employees
WHERE HireDate > (SELECT MIN(HireDate) FROM Employees);

-- 8. Write a SQL query to find the details of the employee(s) with the highest salary.
SELECT * 
FROM Employees
 WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 9. Write a SQL query to find the names of employees who work in the same department as 'John Smith'.
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID
                       FROM Employees 
					   WHERE FirstName = 'John' AND LastName = 'Smith');
					  

-- 10. Write a SQL query to find the names of employees who do not belong to the department with the highest average salary.
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID <>
     (SELECT TOP 1 DepartmentID
	   FROM Employees
	   GROUP BY DepartmentID
	   ORDER BY AVG(Salary) DESC);
                       