/*Using SalesDB,Retrieve a list of all orders, along with the related customer, product,
and employee details for each order, display
Order ID, Customer's name, Product name, Sales, Price, Sales person's name*/
Use SalesDB;

SELECT *
FROM Sales.Customers;

SELECT *
FROM Sales.Employees;

SELECT *
FROM Sales.Orders;

SELECT *
FROM Sales.OrdersArchive;

SELECT *
FROM Sales.Products;

SELECT 
   o.OrderID,
   o.Sales,
   c.FirstName AS CustomerFirstName,
   c.LastName AS customerLastName,
   p.product AS ProductName,
   p.Price,
   e.FirstName AS EmployeeFirstName,
   e.LastName  AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID  = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID;


