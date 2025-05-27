-- Unions
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, "Old" AS Lable
FROM employee_demographics
WHERE age > 50
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS Lable
FROM employee_salary
WHERE salary > 70000;

SELECT first_name, last_name, "Old Man" AS Lable
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION 
SELECT first_name, last_name, "Old Lady" AS Lable
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Lable
FROM employee_salary
WHERE salary > 70000;
