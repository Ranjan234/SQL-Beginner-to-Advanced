-- Subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN 
            (SELECT employee_id
             FROM employee_salary
             WHERE dept_id = 1)
;             
            

SELECT  first_name, salary, AVG(salary)  AS AVG_salary
FROM employee_salary
GROUP BY first_name, salary;

SELECT  first_name, salary,
(SELECt  AVG(salary)  AS AVG_salary
FROM employee_salary)
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT gender, AVG(MAX_age)
FROM
(SELECT gender,
AVG(age) AS Avg_age,
MAX(age) AS Max_age,
MIN(age) AS Min_age,
COUNT(age) 
FROM employee_demographics
GROUP BY gender) AS Age_table
GROUP BY gender;



