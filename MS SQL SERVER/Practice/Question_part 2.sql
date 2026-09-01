-- Part 2: Aggregate function + Grouping + Having
/*
AGGREGATE FUNCTION : We use aggregate functions when we want to perform a calculation on mulitple rows
         and return a single vlaue.
GROUP BY : We use group by when we want to to divide roews into groups and perform calculation on each group separately.

HAVING: WE use HAVING function to filter groups after group by and aggregation function have been applied.

*/

use sql_interview;

select *
from employees;

select count(*)
from employees;

-- Q1. Find the total number employees in the company.
select count(*) as  total_employees
from employees;

-- Q2. Find how many employees have a manager assigned.
 select count(manager_id) as  manager_assigned
from employees
where manager_id is not null;

-- Q3. COUNT(*), vs COUNT(column), COUNT(1)

-- Q4. Find the total salary expenses of the company.
select  sum(salary) as total_salary
from employees;

-- Q5. Find the avg salary of the employeees;
select  avg(salary) as average_salary
from employees;

--Q6. Find the highest and lowest salary in the company.
select max(salary) as highest_salary,
       min(salary) as lowest_salary
from employees;

-- Q7. Find the total number employees in in each department.
select   department,count(employee_id) as employees 
from employees
where department is not null
group by department
;

-- Q8. Find the avg salary of employees in each city.
select   city, avg(salary) as average_salary
from employees
group by city;

-- Q9. Find the total number of active employees in each department.
select  department,
     COUNT(*) as total_active_employees
from employees
where employment_status = 'Active'
group by department;

--Q10. Find the total salary expens of employees working in Mumbai for each department.

select  department, city,
        sum(salary) as total_expenses
from employees
where city = 'Mumbai'
group by department, city
;

-- Q11. Find departments having more than 5 employees.
select  department, count(*) as Employees
from employees
group by department
having count(*) >5;

-- Q12. Find cities whose average salary is greater then 70,000.
select  city,
        avg(salary) as avg_salary
from employees
group by city
having avg(salary) > 70000;

-- salary less then 
select  city,
        avg(salary) as avg_salary
from employees
group by city
having avg(salary) < 70000;

-- Q13. Find department whose average salary lies between 60000 and 80000.
select  department, avg(salary) as average_salary
from employees
where salary between 60000 and 80000
group by department;

select  department, avg(salary) as average_salary
from employees
group by department
having avg(salary) between 60000 and 80000;

-- Q14. Find department having at least 4 employees who are currently on Active.
select department, COUNT(*) as employees
from employees
where employment_status = 'Active'
group by department
having COUNT(*) >= 4;

-- Q15. Find duplicate records by email.
select  email, count(*) as employees
from employees
group by email
having count(*) >1;