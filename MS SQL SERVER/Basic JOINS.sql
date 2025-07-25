-- BASIC JOINSS

USE MyDatabase;

/* Retrive all data deom customers and orders 
 in two different results*/
select *
from customers;

SELECT * 
FROM orders;

/* Get all customers along with thier orders but only  for 
customers who have placed an order */

SELECT *
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id;

SELECT *
FROM customers 
INNER JOIN orders 
ON id = customer_id;

SELECT 
     id, 
	 first_name,
	 order_date,
	 sales
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id;

SELECT 
     id, 
	 first_name,
	 order_date,
	 order_id,
	 sales
FROM customers 
INNER JOIN orders 
ON id = customer_id;

SELECT 
     c.id, 
	 c.first_name,
	 o.order_id,
	 o.sales
FROM orders AS o
INNER JOIN customers AS c 
ON c.id = o.customer_id;

-- LEFT JOIN
/* Get all the customers along with thier orders
 including those without orders*/
 SELECT 
     c.id, 
	 c.first_name,
	 o.order_id,
	 o.sales
FROM orders AS o
LEFT JOIN customers AS c 
ON c.id = o.customer_id;

 SELECT 
     c.id, 
	 c.first_name,
	 o.order_id,
	 o.sales
FROM  customers AS c 
LEFT JOIN  orders AS o 
ON c.id = o.customer_id;

-- RIGHT JOIN
/* Get all customers  along with thier orders 
including orders without matching customers*/

SELECT 
     c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;

SELECT 
     c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id;

-- FULL JOIN 
-- Get all the customers and all orders, even if there's no match.
SELECT 
     c.id,
	 c.first_name,
	 o.order_id,
	 o.sales
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id;
