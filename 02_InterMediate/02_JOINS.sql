-- JOINS 

SELECT * 
FROM employee_demographics;

SELECT *
FROM employee_salary;
-- INNER JOINS
SELECT * 
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
    ON  dem.employee_id = sal. employee_id;
    
SELECT dem.employee_id, age, occupation,salary
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
    ON  dem.employee_id = sal. employee_id;
   -- LEFT JOIN 
SELECT * 
FROM employee_demographics as dem
LEFT JOIN employee_salary as sal
    ON  dem.employee_id = sal. employee_id;
    
-- RIGHT JOIN
SELECT * 
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sal
    ON  dem.employee_id = sal. employee_id;
    
-- SELF JOIN
SELECT * 
FROM employee_salary emp1
JOIN  employee_salary emp2
    ON  emp1.employee_id = emp2.employee_id;
    
SELECT * 
FROM employee_salary emp1
JOIN  employee_salary emp2
    ON  emp1.employee_id  + 1 = emp2.employee_id;
    
SELECT  emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
FROM employee_salary emp1
JOIN  employee_salary emp2
    ON  emp1.employee_id = emp2.employee_id;

-- Joining Multiple Tables Together 
SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
    ON  dem.employee_id = sal. employee_id
INNER JOIN parks_departments dp
    ON sal.dept_id = dp.department_id;    
    
 SELECT *  
 FROM parks_departments;