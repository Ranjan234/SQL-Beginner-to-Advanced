-- String Functions

SELECT length('SOUMYA');
SELECT upper('Soumya');
SELECT lower('SOUMYa');


SELECT first_name, length(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

-- Using Trim function
SELECT  TRIM('    SOUMYA  ');

SELECT  LTRIM('    SOUMYA  ');
SELECT  RTRIM('    SOUMYA  ');

SELECT first_name,
LEFT(first_name, 3)
FROM employee_demographics;

SELECT first_name,
RIGHT(first_name, 3),
SUBSTRING(first_name, 3,2),
birth_date,
SUBSTRING(birth_date, 1,4) AS birth_year,
SUBSTRING(birth_date, 6,2) AS birth_month,
SUBSTRING(birth_date, 9,2) AS birth_day
FROM employee_demographics;

-- Replace
SELECT first_name, REPLACE(first_name, 'Mark', 'Soumya')
FROM employee_demographics;

-- LOCATE
SELECT LOCATE('e','Alexander');

SELECT first_name, LOCATE('AN',first_name)
FROM employee_demographics;

-- CONCAT
SELECT first_name, last_name,  CONCAT(first_name,' ', last_name) as Full_name
FROM employee_demographics;