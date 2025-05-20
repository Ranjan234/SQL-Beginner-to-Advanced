SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM parks_and_recreation.parks_departments;



SELECT first_name,
 last_name, birth_date
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
 last_name, birth_date,
 age,
 (age + 10) * 10 + 10 
FROM parks_and_recreation.employee_demographics;

# PEMDAS -- order operation 
-- Parenthesis, Exponent, Multiplication, Division, Addition, Subtract.

SELECT  distinct  first_name, gender
FROM parks_and_recreation.employee_demographics;

SELECT first_name,last_name
from employee_salary;