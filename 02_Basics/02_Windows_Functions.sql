-- Windows Functions

SELECT gender, AVG(salary) AS Avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT dem.first_name, dem.last_name, gender, AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name,  gender;

-- OVER ()
SELECT dem.first_name, dem.last_name,  gender, AVG(salary) OVER(PARTITION BY gender) 
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id;

-- 
SELECT dem.first_name, dem.last_name,  gender, salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) 
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;
    
-- ROW_NUMBER()
SELECT dem.first_name, dem.last_name,  gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;
    
 --   RANK()
SELECT dem.first_name, dem.last_name,  gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;
    
-- DENS RANK()
SELECT dem.first_name, dem.last_name,  gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS DENSE_Rank_num
FROM employee_demographics dem
JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id;
