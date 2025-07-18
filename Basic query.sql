use MyDatabase;

-- Retrieve all customers data.
SELECT * 
FROM customers;

-- Retrieve each customers name, country and score.
SELECT first_name,
     country,
	 score
FROM customers;

-- Retrieve customers with a score not equal to 0.
SELECT *
FROM customers
WHERE score != 0;

SELECT first_name,
score, country
FROM customers
WHERE score <>0;

-- REtrieve all customers and sort the results by the highest scores first.
SELECT *
FROM customers
ORDER BY score DESC;

/*Retrieve all customers and ort the result
by the country and then by the highest score.*/

SELECT * 
FROM customers
ORDER BY 
     country ASC,
	 score DESC;

-- Find the total score of each country.
SELECT 
   country,
   SUM(score) AS Total_score
FROM customers
GROUP BY country;

-- Find the total score and total no of cutomers of each country.
SELECT 
    country,
	SUM(score) AS total_score,
	COUNT(id) AS total_cusotmers
FROM customers
GROUP BY country;
/* Find the average score for each country
 considering only customers with a score not equal to 0
 and return only those countries with an average score greater than 430*/
SELECT
   country,
   AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
 
 -- Retrun unique list of all countries
 SELECT DISTINCT
        country
FROM customers

-- Retreieve only 3 customers
SELECT TOP 3
  *
  FROM customers

-- Rtreieve the top 3 customers with the highest score.
SELECT TOP 3
*
FROM customers
ORDER BY score DESC;

-- Rtreieve the lowest 2 customers based the score.
SELECT TOP 2 *
FROM customers
ORDER BY score ASC;




-- Retrieve all orders
SELECT * FROM orders

-- Get the two most recent orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC;


-- DATA MANIPULATION LANGUAGE 

INSERT INTO customers(id, first_name, country, score)
VALUES
    (6, 'Papni', 'USA', NULL),
	(7, 'Debu', NULL, 100)


INSERT INTO customers(id, first_name, country, score)
VALUES
    (8,'USA','MAX', NULL)

INSERT INTO customers
VALUES
    (9,'Sam','Germany', NULL)

INSERT INTO customers(id, first_name)
VALUES
    (10,'Shara')

	SELECT * FROM customers

-- Insert data from 'customers' into 'persons'
INSERT INTO persons(id, person_name, birth_date, phone, email)
SELECT 
id, 
first_name,
NULL,
'Unknown'
FROM customers

SELECT * FROM persons;

-- Change the score of customer with ID 6 to 0.

UPDATE customers
  SET score = 0
  WHERE id = 6;

SELECT * FROM customers
WHERE ID =6;

/* Change the score of customer with ID 6 to 0
and update the country to UK*/

UPDATE customers
    SET score = 0,
	    country = 'UK'
WHERE id =10

SELECT * FROM customers;

/* Update all customers with a NULL score by setting
 their score to 0*/
 UPDATE customers
    SET score = 0
WHERE score IS NULL

SELECT * 
FROM customers;

-- Delete all customers with an ID greater than 5.
DELETE FROM customers
   WHERE id > 5

SELECT * 
FROM customers
WHERE id > 5

-- Delete all data from table persons

TRUNCATE TABLE persons

SELECT * FROM persons

-- USE COMPARISION OPERATOR
-- Retreive all customers from germany.
SELECT * 
FROM customers
WHERE country = 'Germany';

-- Retreive all customers who are not from germany.

SELECT * 
FROM customers
WHERE country <> 'Germany';

SELECT *
FROM customers
WHERE country != 'Germany';

-- Retrieve all customers with the score greater than 500.
SELECT * 
FROM customers
WHERE score > 500;

 -- Retrieve all customers with score 500 and more
 SELECT * 
 FROM customers
 WHERE score >= 500;

 -- -- Retrieve all customers with the score less than 500.
  SELECT * 
 FROM customers
 WHERE score < 500;

  SELECT * 
 FROM customers
 WHERE score <= 500;

 -- USE LOGICAL OPERATORS
 -- Retrive all customers who are from the USA AND have score greater than 500.
 SELECT *
 FROM customers
 WHERE country = 'USA' AND score > 500;

 /*Retrive all customers who are either from the USA
 OR haves a score greater than 500. */

 SELECT * 
 FROM customers
 WHERE country = 'USA' OR score > 500;

 -- Retreive all customers with score NOT less than 500.
 SELECT * 
 FROM customers
 WHERE NOT score < 500;

 /* Retrieve all cusotmers whose score falls in the 
 range between 100 and 500.*/
 SELECT * 
 FROM customers
 WHERE score BETWEEN 100 AND 500;

 SELECT * 
 FROM customers
 WHERE
    score >= 100 AND score <= 500;

--USE IN / NOT IN
-- Retrieve all customers from either  Germany or USA.
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');

SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA');

-- Find all customers whose first name starts with 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

SELECT *
FROM customers
WHERE first_name LIKE '__r%';

-- Find all customers whose first_name ends with 'n'.
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- -- Find all customers whose first_name contains with r.
SELECT * 
FROM customers
WHERE first_name LIKE '%r%';

-- -- Find all customers whose first_name has 'r' in the third position.
SELECT * 
FROM customers
WHERE first_name LIKE '__r%';
