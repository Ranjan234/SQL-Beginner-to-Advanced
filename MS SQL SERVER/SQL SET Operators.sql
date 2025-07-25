use SalesDB;
--Rule 1 | SQL Clauses
SELECT 
FirstName,
LastName
FROM Sales.Customers

UNION

SELECT 
FirstName,
LastName
FROM Sales.Employees;

-- Rule 2 | Number of Columns
SELECT 
LastName
FROM Sales.Customers

UNION

SELECT
LastName
FROM Sales.Employees;

-- Rule 3 | Data Types
SELECT 
CustomerID,
LastName
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName
FROM Sales.Employees;

-- Rule 4 | Order of columns
SELECT 
CustomerID,
LastName
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName
FROM Sales.Employees;

-- Rule 5  | Column alias
SELECT 
CustomerID AS ID,
LastName AS Last_Name
FROM Sales.Customers

UNION

SELECT 
EmployeeID,
LastName
FROM Sales.Employees;

-- Rule 6 | Correct Columns
SELECT 
FirstName,
LastName
FROM Sales.Customers

UNION

SELECT 
LastName,
FirstName
FROM Sales.Employees;

-- Combine the data from employees and customers into one table
SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
FirstName,
LastName
FROM Sales.Employees;

/*Combine the data from employees and customers into one table 
including duplicates*/
SELECT 
FirstName,
LastName
FROM Sales.Employees
UNION ALL
SELECT 
FirstName,
LastName
FROM Sales.Customers;

-- Except
/* Find the employees who are not customers at the same time*/
SELECT 
FirstName,
LastName
FROM Sales.Employees
EXCEPT
SELECT 
FirstName,
LastName
FROM Sales.Customers;
  
  SELECT 
FirstName,
LastName
FROM Sales.Customers
EXCEPT
SELECT 
FirstName,
LastName
FROM Sales.Employees;
-- INTERSECT
/*find the employees, who are also customers*/

  SELECT 
FirstName,
LastName
FROM Sales.Customers
INTERSECT
SELECT 
FirstName,
LastName
FROM Sales.Employees;

SELECT 
FirstName,
LastName
FROM Sales.Employees
INTERSECT
SELECT 
FirstName,
LastName
FROM Sales.Customers; 

-- TASK 
/*Orders data are stored in separte tables (Orders and OrdersArchive)
Combine all orders data into one report without duplicates*/
--1.
SELECT
       [ProductID] 
       ,[OrderID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive;

--2.
SELECT 'Orders' AS SourceTbale 
       ,[ProductID] 
       ,[OrderID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
'OrdersArchive' AS SourceTbale   
       ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive;