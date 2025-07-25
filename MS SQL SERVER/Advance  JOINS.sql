use MyDatabase;

SELECT * 
FROM customers;

SELECT * FROM  orders;  

-- Advance JOINS
-- LEFT ANTI JOIN
-- Get all cutomers whi haven't placed any order.
SELECT * 
FROM customers AS c
LEFT JOIN orders AS o 
ON c.id = O. customer_id
WHERE o.customer_id IS NULL;

--- RIGHT ANTI JOINS
-- Get all orders without matching customers
SELECT * 
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- -- Get all orders without matching customers (using LEFT JOIN)
SELECT * 
FROM  orders AS o  
LEFT JOIN  customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- FULL ANTI JOINS
-- Find customers without orders  and orders without customers.

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL;
/*Get all customers along with thier orders.
but only for customers who have placed an order (WIth out using INNER JOIN*/

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;  

--  CROSS JOINS
-- Generate all posible combinations of customers and orders
SELECT * 
FROM customers 
CROSS JOIN orders;