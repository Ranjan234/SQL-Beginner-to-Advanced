-- Limiting & Aliasing 

SELECT * 
FROM employee_demographics
LIMIT 5;

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 1, 5;

-- Aliasing
SELECT gender, AVG(age) as avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;