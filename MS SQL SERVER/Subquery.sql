-- Sub Queries
-- Topic Single row query.
-- Multi row subquery.
-- Correlated subquery.
-- IN  / NOT IN
-- EXISTS / NOT EXISTS 

use sql_interview;

-- Tables
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

 -- Q1. Find empoyees whose salary is greater than the average salary of the company.
 select *
 from employees
 where salary > (
      select AVG(salary) as average_salary
      from employees
      );

-- Q2. Find employees earning the highest salary in the company.
 select *
 from employees
 where salary = (
      select MAX(salary) as highest_salary
      from employees
      );

-- Q3. Find employees who works in the same department as 'arav Sharma';
 select *
 from employees
where employee_name = 'Aarav Sharma';

select *
from employees
where department IN (
         select department
         from employees
         where employee_name = 'Aarav Sharma'
      );

-- Q4. Find the employees whos salary is greater than all employees in the support departments.
select *
 from employees
 where salary > all (
      select salary
      from employees
      where department = 'Support'
      );

-- Q5. Find employees working in department where at least one emlpoyees is currently on leave.

select *
from employees
where department in (
      select distinct department
      from employees
      where employment_status = 'On Leave'
      );

-- Q6. Find employees who have receive bonus.
select e.employee_id, b.bonus_amount
from employees e
inner join bonuses b
on e.employee_id = b.employee_id;

-- using subquery
select * 
from employees
where employee_id in (
        select distinct employee_id
        from bonuses
    );
-- 
select * 
from employees e
WHERE exists (
        select 1
        from bonuses b
        where b.employee_id = e.employee_id  
);

-- Q6. Find employees who hav enever receive bonus.
select e.employee_name, b.bonus_id
from employees e
left join bonuses  b
on e.employee_id = b.employee_id
where b.bonus_id is null;

select * 
from employees e
WHERE not exists (
        select 1
        from bonuses b
        where b.employee_id = e.employee_id  
);

-- Q8. Find employees whose salary is greater than the average salary of thier own department.
select * 
from employees e
where salary > (
    select avg(salary) as average_salary
    from employees es
    where e.department = es.department
  );

  -- Q9. Find employees who are assigned to at least one project.
  select *
  from employees e
  where exists (
              select 1
              from employee_projects ep
           where  e.employee_id = ep.employee_id
   );

   -- Q9. Find employees who earn more than their manager.
   select *
   from employees e
   where salary > (
              select m.salary
              from employees m
              where m.employee_id = e.manager_id
      );