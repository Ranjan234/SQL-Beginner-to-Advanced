-- WHERE clause

SELECT * 
FROM employee_salary
WHERE first_name= 'Leslie';

-- Check employee salary whree less than equal to $50000.
SELECT * 
FROM employee_salary
WHERE salary <= 50000;

-- Check from employee_demographics where gender are male.
SELECT * 
FROM employee_demographics
WHERE gender != 'Female';

-- Check people who are born in before '1985-01-01'.
SELECT * 
FROM  employee_demographics
WHERE birth_date > '1985-01-01';
