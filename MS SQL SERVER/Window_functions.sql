use sql_interview;

select *
from employees;

select * from bonuses;

select * from attendance;

select * from projects;

select * from employee_projects;

select * from salary_history;

select * from leaves_data;

select * from clients;

select * from orders_data;

-- WINDOW FUNCTIONS
-- A window function performs calculations across a set of rows without collapsing thr result intoa single row.

-- OVER(): Defines the set of rows on which a window function performs calculations.
-- PARTITION BY () : Divides rows into groups so the window function performs calculations.
--  ROW_NUMBER():  Assigns a unique sequential number to each row.
--  DENSE_RANK(): Assigns ranks to rows without skip row when duplicate values.
-- RANK(): Assign rank to rows, skip rows when duplicate values exists.
-- NTILE():
-- LAG(): Retruns the value of previous row.
-- LEAD(): Returns the value from the next row.

-- Q1. Assign a unique row number to each employees based on salary.
SELECT *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as Rnk
FROM employees;

-- Q2.  Rank employee based on salary.

SELECT *,
   RANK() OVER(ORDER BY salary DESC) As rnk
FROM employees;

-- Q3.Rank employee based on salary using dense_rank.
SELECT *,
   DENSE_RANK() OVER(ORDER BY salary DESC) As Densernk
FROM employees;

-- Q4. ROW_NUMBER, RANK, DENSE_RANK
SELECT *,
   ROW_NUMBER() OVER(ORDER BY salary DESC) as Rank1,
   RANK() OVER(ORDER BY salary DESC) As Rank2,
   DENSE_RANK() OVER(ORDER BY salary DESC) As Densernk
FROM employees;

-- Q5. Find the employees having 2nd highest salary.
WITH second_salary AS (
    SELECT *,
       RANK() OVER(ORDER BY salary DESC) As Rank2
    FROM employees
    )
 SELECT * 
 FROM second_salary
 WHERE Rank2 =2;

 -- USing Subquery 3rd highest salary
 SELECT * FROM (
         SELECT *,
       RANK() OVER(ORDER BY salary DESC) As Rank2
    FROM employees
 ) t
 WHERE Rank2 = 3;

 -- Second method
-- SELECT * 
-- FROM employees
-- ORDER BY salary DESC
--LIMIT 1  OFFSET 1;

-- Q6. Display employee rank within each department based on salary.
SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) as Rnk
FROM employees
WHERE department IS NOT NULL;

-- Q7. Find the highest-paid employee from each department.
 SELECT * 
 FROM (
SELECT *,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) as Rnk
FROM employees
WHERE department IS NOT NULL) t
  WHERE Rnk = 1;

  -- USING CTE
  WITH ranked AS (
        SELECT *,
         DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) as Rnk
        FROM employees
      WHERE department IS NOT NULL)

  SELECT *
  FROM ranked
  WHERE Rnk = 1;

  -- Q8. Find employees earning more than the previous employees.
  SELECT *
  FROM (
  SELECT *,
     LAG(salary) OVER(ORDER BY employee_id) As previous_salary
  FROM employees) t
  WHERE salary > previous_salary;
  ----- 
    SELECT *,
     LAG(salary, 2, 0) OVER(ORDER BY employee_id) As previous_salary
  FROM employees;

  -- Q9. Find employees earning more than the next employees.
   SELECT *
  FROM (
  SELECT *,
     LEAD(salary) OVER(ORDER BY employee_id) As next_salary
  FROM employees) t
  WHERE salary > next_salary;

  -- Q10. Dispplay the salary difference between the current employee and the previous employee.

  SELECT *,
       salary - LAG(salary) OVER(ORDER BY employee_id) As salary_difference
  FROM employees;

  -- GROUP BY vs PARTITION BY
  -- GROUP BY -> Collaps Rows
  -- PARTITION BY --> Keep rows and performs calculations

  SELECT department
  FROM employees
  GROUP BY department;

  SELECT *,
      RANK() OVER(PARTITION BY department ORDER BY salary DESC) As ranking
  FROM employees;

  -- Q11. Find departments where multiple employees have same salary.
   
   WITH ranked AS (
        SELECT *,
             RANK() OVER(PARTITION BY department ORDER BY salary DESC) As ranking
        FROM employees)

   SELECT department, ranking, COUNT(*) as total_employee
   FROM ranked
   GROUP BY department, ranking
   HAVING  COUNT(*) >1;

-- Q12. Display  each employees along with the total salary expense of their department.

  SELECT *,
      SUM(salary) OVER(PARTITION BY department) as total_salary_expense
  FROM employees;

  -- Q13. Display a running total of salaries within each department.
   SELECT *,
       SUM(salary) OVER(PARTITION BY department ORDER BY employee_id) AS running_total
   FROM employees;

   --Q14. Find the employees whose salary is greater than the average of thier department.
       
      WITH avgg AS (
       SELECT *,
           AVG(salary) OVER(PARTITION BY department) AS avg_salary
       FROM employees
       )
       SELECT *
       FROM avgg
       WHERE salary > avg_salary;

 --- USING subquery
    SELECT *
    FROM (
     SELECT *,
           AVG(salary) OVER(PARTITION BY department) AS avg_salary
       FROM employees
       ) t
     WHERE salary > avg_salary;