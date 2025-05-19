-- Logical Operator ( AND, OR, NOT)

SELECT * 
FROM  employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male';

SELECT * 
FROM  employee_demographics
WHERE birth_date > '1985-01-01'
OR  NOT  gender = 'Male';

SELECT * 
FROM  employee_demographics
WHERE (first_name = 'lesile' AND age = 44 ) OR age  > 55;