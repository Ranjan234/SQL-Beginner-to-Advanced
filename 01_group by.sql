-- Group BY

SELECT * 
FROM  employee_demographics;


SELECT gender, AVG(age), max(age)
FROM  employee_demographics
GROUP BY gender;

SELECT gender, AVG(age), min(age)
FROM  employee_demographics
GROUP BY gender;


SELECT gender, AVG(age), max(age), count(age)
FROM  employee_demographics
GROUP BY gender;


SELECT occupation, salary
FROM  employee_salary
GROUP BY occupation, salary;

-- ORDER BY 
SELECT *
FROM  employee_demographics
ORDER BY first_name ASC;

SELECT *
FROM  employee_demographics
ORDER BY gender, age desc;
 



