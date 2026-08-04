
--- 20 Questions practice
-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT NULL
);

-- Insert Data
INSERT INTO employees (employee_id, employee_name, department, salary, manager_id)
VALUES
(101, 'Aarav', 'Engineering', 95000, 105),
(102, 'Meera', 'Engineering', 72000, 105),
(103, 'Kabir', 'Sales', 65000, 106),
(104, 'Isha', 'Sales', 92000, 106),
(105, 'Rohan', 'Engineering', 90000, NULL),
(106, 'Neha', 'Sales', 88000, NULL);

select *
from employees;

-- Create customers table
create table customers(customer_id int primary key,
                        customer_name varchar(50),
					     city varchar(50));

insert into customers(customer_id, customer_name, city)
values(1,'Aditi Sharma', 'Delhi'),
       (2,'Rahul Verma', 'Mumbai'),
	   (3,'Simran Kaur', 'Chandigarh'),
	   (4,'Arjun Nair', 'Bengalor');

select *
from customers;

-- Create orders table
create table orders(order_id int primary key,
                    customer_id int,
                    amount int,
					 status varchar(50));


insert into orders(order_id, customer_id, amount, status)
values(501,1,2400, 'Delivered'),
       (502, 1,3200, 'Delivered'),
	   (503, 2,1800, 'Delivered'),
	   (504, 2,4100, 'Pending'),
	   (505, 3,950, 'Cancelled');

select *
from orders;

-- Q1. Dislpay all engineering employees order by salary from highest to lowest.
select employee_name, salary
from employees
where department = 'Engineering'
order by salary desc;

-- Q2.Write a query to find th number of employees in each department.
select department, count(*) as no_of_employees
from employees
group by department;

-- Q3. Write a query to find the second-highest distinct salary.
select max(salary) as second_highest_salary
from employees
where salary <
     (select max(salary) from employees);

-- Q4. Write a query to find employees earning more than the company average salary.
select employee_name, salary
from employees
where salary >
     (select avg(salary) from employees);

-- Q5. Find the highest salary in each department;
select department, max(salary) as highest_salary
from employees
group by department;

select *
from employees;	 
-- Q6. write query to find employees where salary is higher than their manager salary.
select e.employee_name, e.salary,
       m.employee_name as manager_name,
	   m.salary as manager_salary
from employees e
join employees m
on e.employee_id = m.manager_id
where e.salary > m.salary;	

-- Q7.Write query to display each order with the customer name.

select o.order_id, c.customer_name,
       o.amount, o.status
from customers c
 inner join orders o
on c.customer_id = o.customer_id;
-- group by o.order_id,c.customer_name;

--  Q8.Write a query to find customers who have never placed an order.
select o.customer_id, c.customer_name
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is null;

-- Q9. Write a query to find customers who placed more than one order.
select c.customer_name, count(*) as orders
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_name
having count(*) > 1;

-- Q10.Write a query to find the highest-spending customer based only on delivered orders.
select  c.customer_name, o.status,
        max(o.amount) as highest_spending
from customers c
inner join orders o
on c.customer_id = o.customer_id
where status = 'Delivered'
group by c.customer_name, o.status
order by highest_spending desc;

-- Q11. 
/* a table has 100 million records. You want to remove all rows as quickly
    possible while keeping the table. which SQL command will you use?*\

	-- Use TRUNCATE when all rows must be removed quickly.
	-- It keeps the table structure but removes the data.
	-- It is generally faster than DELETE for full-table cleanup.
	
-- Q A percentage calculation divides achieved_sales by target_sales, but some targets are zero. How would you
prevent a divide-by-zero error while preserving those rows?

-- NULLIF(target_sales, 0) turns zero into NULL.

-- Dividing by NULL returns NULL instead of
crashing the query.

-- Rows are preserved, so missing or invalid
percentage can be handled later.






					 