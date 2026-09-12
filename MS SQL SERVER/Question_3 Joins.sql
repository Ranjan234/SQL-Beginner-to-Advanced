--- use interview
use sql_interview;

CREATE TABLE bonuses (
    bonus_id     INT PRIMARY KEY,
    employee_id  INT,
    bonus_amount INT,
    bonus_date   DATE,
    bonus_type   VARCHAR(30)
);

INSERT INTO bonuses (bonus_id, employee_id, bonus_amount, bonus_date, bonus_type) VALUES
(1,  9,  10000, '2024-01-10', 'Performance'),
(2,  22,  5000, '2024-01-15', 'Performance'),
(3,  27,  7000, '2024-02-01', 'Performance'),
(4,  10, 12000, '2024-02-05', 'Performance'),
(5,  34,  3000, '2024-02-10', 'Diwali'),
(6,  11, 15000, '2024-03-01', 'Performance'),
(7,  28,  8000, '2024-03-05', 'Performance'),
(8,  23,  4000, '2024-03-15', 'Diwali'),
(9,  12,  9000, '2024-04-01', 'Performance'),
(10, 13, 11000, '2024-04-10', 'Performance'),
(11, 14, 14000, '2024-04-20', 'Performance'),
(12, 30,  7500, '2024-05-01', 'Joining'),
(13, 15,  9500, '2024-05-10', 'Performance'),
(14, 16, 16000, '2024-05-20', 'Performance'),
(15, 17, 17000, '2024-06-01', 'Performance'),
(16, 20, 20000, '2024-06-15', 'Performance'),
(17, 39,  6000, '2024-07-01', 'Referral'),
(18, 36,  5500, '2024-07-10', 'Diwali'),
(19, 9,  10000, '2024-01-10', 'Performance'),
(20, 11, 15000, '2024-03-01', 'Performance'),
(21, 17, 17000, '2024-06-01', 'Performance'),
(22, 20, 20000, '2024-06-15', 'Performance');

CREATE TABLE attendance (
    attendance_id   INT PRIMARY KEY,
    employee_id     INT,
    attendance_date DATE,
    status          VARCHAR(20)
);

INSERT INTO attendance (attendance_id, employee_id, attendance_date, status) VALUES
(1,  9,  '2025-01-01', 'Present'),
(2,  10, '2025-01-01', 'Absent'),
(3,  11, '2025-01-01', 'Present'),
(4,  12, '2025-01-01', 'WFH'),
(5,  13, '2025-01-01', 'Present'),
(6,  14, '2025-01-01', 'Present'),
(7,  15, '2025-01-01', 'Absent'),
(8,  16, '2025-01-01', 'Present'),
(9,  17, '2025-01-01', 'WFH'),
(10, 18, '2025-01-01', 'Present'),
(11, 19, '2025-01-02', 'Present'),
(12, 20, '2025-01-02', 'Absent'),
(13, 21, '2025-01-02', 'Present'),
(14, 22, '2025-01-02', 'Present'),
(15, 23, '2025-01-02', 'WFH'),
(16, 24, '2025-01-02', 'Present'),
(17, 25, '2025-01-02', 'Present'),
(18, 26, '2025-01-02', 'Absent'),
(19, 27, '2025-01-02', 'Half Day'),
(20, 28, '2025-01-02', 'Present'),
(21, 9,  '2025-01-03', 'WFH'),
(22, 10, '2025-01-03', 'Present'),
(23, 11, '2025-01-03', 'Absent'),
(24, 12, '2025-01-03', 'Present'),
(25, 13, '2025-01-03', 'Present'),
(26, 22, '2025-01-03', 'Present'),
(27, 27, '2025-01-03', 'Present'),
(28, 34, '2025-01-03', 'Absent'),
(29, 39, '2025-01-03', 'WFH'),
(30, 44, '2025-01-03', 'Half Day'),
(31, 9,  '2025-01-01', 'Present'),
(32, 15, '2025-01-01', 'Absent'),
(33, 22, '2025-01-02', 'Present'),
(34, 27, '2025-01-02', 'Half Day'),
(35, 11, '2025-01-03', 'Absent');

CREATE TABLE projects (
    project_id     INT PRIMARY KEY,
    project_name   VARCHAR(100),
    project_budget INT,
    client_id      INT,
    start_date     DATE,
    status         VARCHAR(20)
);

INSERT INTO projects (project_id, project_name, project_budget, client_id, start_date, status) VALUES
(1, 'CRM System',           500000, 1, '2025-01-01', 'Ongoing'),
(2, 'Banking App',          800000, 2, '2024-06-01', 'Ongoing'),
(3, 'Ecommerce Platform',   650000, 3, '2024-09-01', 'Completed'),
(4, 'Analytics Dashboard',  300000, 4, '2025-02-01', 'On Hold'),
(5, 'HR Management System', 250000, 5, '2025-03-01', 'Ongoing');

CREATE TABLE employee_projects (
    ep_id         INT PRIMARY KEY,
    employee_id   INT,
    project_id    INT,
    assigned_date DATE,
    role          VARCHAR(50)
);

INSERT INTO employee_projects (ep_id, employee_id, project_id, assigned_date, role) VALUES
(1,  9,  1, '2025-01-01', 'Lead'),
(2,  9,  2, '2025-01-10', 'Developer'),
(3,  22, 5, '2025-01-11', 'Analyst'),
(4,  27, 2, '2025-01-15', 'Developer'),
(5,  10, 1, '2025-01-20', 'Tester'),
(6,  34, 3, '2025-01-22', 'Lead'),
(7,  39, 4, '2025-01-25', 'Analyst'),
(8,  11, 1, '2025-01-28', 'Developer'),
(9,  28, 2, '2025-02-01', 'Tester'),
(10, 35, 3, '2025-02-05', 'Developer'),
(11, 23, 5, '2025-02-10', 'Analyst'),
(12, 12, 1, '2025-02-12', 'Developer'),
(13, 40, 4, '2025-02-15', 'Tester'),
(14, 27, 2, '2025-02-18', 'Developer'),
(15, 13, 1, '2025-02-20', 'Lead'),
(16, 16, 2, '2025-02-25', 'Developer'),
(17, 17, 1, '2025-03-01', 'Tester'),
(18, 9,  1, '2025-01-01', 'Lead'),
(19, 34, 3, '2025-01-22', 'Lead');

CREATE TABLE salary_history (
    history_id     INT PRIMARY KEY,
    employee_id    INT,
    old_salary     INT,
    new_salary     INT,
    increment_date DATE,
    increment_pct  DECIMAL(5,2)
);

INSERT INTO salary_history (history_id, employee_id, old_salary, new_salary, increment_date, increment_pct) VALUES
(1,  9,  65000, 75000, '2024-01-01', 15.38),
(2,  10, 48000, 55000, '2024-02-01', 14.58),
(3,  11, 60000, 68000, '2024-01-01', 13.33),
(4,  12, 72000, 80000, '2024-02-01', 11.11),
(5,  13, 40000, 45000, '2024-03-01', 12.50),
(6,  14, 53000, 60000, '2024-03-01', 13.21),
(7,  15, 85000, 95000, '2024-04-01', 11.76),
(8,  16, 47000, 53000, '2024-04-01', 12.77),
(9,  17, 65000, 72000, '2024-05-01', 10.77),
(10, 20, 42000, 47000, '2024-03-01', 11.90),
(11, 22, 48000, 54000, '2024-01-01', 12.50),
(12, 23, 60000, 67000, '2024-02-01', 11.67),
(13, 27, 52000, 59000, '2024-04-01', 13.46),
(14, 28, 46000, 52000, '2024-03-01', 13.04),
(15, 34, 28000, 32000, '2024-05-01', 14.29),
(16, 39, 58000, 64000, '2024-02-01', 10.34);

CREATE TABLE leaves_data (
    leave_id    INT PRIMARY KEY,
    employee_id INT,
    leave_type  VARCHAR(50),
    days        INT,
    leave_date  DATE
);

INSERT INTO leaves_data (leave_id, employee_id, leave_type, days, leave_date) VALUES
(1,  9,  'Sick Leave',   2, '2025-01-10'),
(2,  22, 'Casual Leave', 1, '2025-01-12'),
(3,  27, 'Paid Leave',   5, '2025-01-15'),
(4,  10, 'Sick Leave',   3, '2025-01-20'),
(5,  34, 'Casual Leave', 2, '2025-01-22'),
(6,  39, 'Paid Leave',   4, '2025-01-25'),
(7,  11, 'Sick Leave',   1, '2025-02-01'),
(8,  28, 'Paid Leave',   6, '2025-02-05'),
(9,  35, 'Casual Leave', 2, '2025-02-10'),
(10, 23, 'Sick Leave',   3, '2025-02-12'),
(11, 12, 'Paid Leave',   2, '2025-02-15'),
(12, 13, 'Casual Leave', 1, '2025-02-18'),
(13, 14, 'Sick Leave',   4, '2025-03-01'),
(14, 16, 'Paid Leave',   3, '2025-03-05'),
(15, 17, 'Casual Leave', 2, '2025-03-10');

CREATE TABLE clients (
    client_id     INT PRIMARY KEY,
    client_name   VARCHAR(100),
    country       VARCHAR(50),
    industry      VARCHAR(50),
    contact_email VARCHAR(100)
);

INSERT INTO clients (client_id, client_name, country, industry, contact_email) VALUES
(1, 'Infosys', 'India', 'IT',        'contact@infosys.com'),
(2, 'HDFC',    'India', 'Banking',   'contact@hdfc.com'),
(3, 'Amazon',  'USA',   'Ecommerce', 'contact@amazon.com'),
(4, 'TCS',     'India', 'IT',        'contact@tcs.com'),
(5, 'Wipro',   'India', 'IT',        'contact@wipro.com');

CREATE TABLE orders_data (
    order_id     INT PRIMARY KEY,
    employee_id  INT,
    client_id    INT,
    order_amount INT,
    order_date   DATE,
    order_status VARCHAR(20)
);

INSERT INTO orders_data (order_id, employee_id, client_id, order_amount, order_date, order_status) VALUES
(1,  13, 1, 50000, '2025-01-05', 'Completed'),
(2,  20, 2, 65000, '2025-01-08', 'Completed'),
(3,  26, 3, 70000, '2025-01-12', 'Completed'),
(4,  31, 4, 45000, '2025-01-15', 'Pending'),
(5,  37, 5, 30000, '2025-01-20', 'Completed'),
(6,  13, 2, 55000, '2025-01-25', 'Cancelled'),
(7,  13, 3, 80000, '2025-02-03', 'Completed'),
(8,  20, 1, 72000, '2025-02-07', 'Completed'),
(9,  26, 5, 39000, '2025-02-12', 'Completed'),
(10, 31, 2, 47000, '2025-02-18', 'Pending'),
(11, 37, 4, 60000, '2025-02-24', 'Completed'),
(12, 13, 1, 75000, '2025-03-04', 'Completed'),
(13, 20, 3, 82000, '2025-03-09', 'Completed'),
(14, 26, 4, 41000, '2025-03-14', 'Completed'),
(15, 31, 5, 35000, '2025-03-19', 'Completed'),
(16, 37, 3, 68000, '2025-03-23', 'Pending'),
(17, 13, 4, 90000, '2025-03-28', 'Completed'),
(18, 20, 2, 55000, '2025-03-31', 'Completed');

select * from customers;
 -- ()

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

 -- Q1. Display employee name, bonus amount, and bonus date.
 select e.employee_name, b.bonus_amount,
        b.bonus_date
from employees e
 join bonuses b
on e.employee_id = b.bonus_id;

--Q2. Display employee name, project name, and role in the project;
 
select e.employee_name, ep.role, p.project_name
from employees e
inner join employee_projects ep on e.employee_id = ep.employee_id
inner join projects p on ep.project_id = p.project_id
;
-- Q3. Display employees who recieved a bonus greater than 10000.

select e.employee_name, e.email ,b.bonus_amount
from employees e
LEFT join bonuses b 
on e.employee_id = b.employee_id
where b.bonus_amount > 10000;

--Q4 . Display employees who currently on leave along with thier manager name.

select e.employee_name as Employee_name,
       m.employee_name As Manager_name,
       e.employment_status
from employees e
join employees m
on e.manager_id = m.employee_id
where  e.employment_status = 'On Leave'
;

-- Q5, Find employees who never received any bonus.

select e.employee_name as employee_name,
       b.bonus_amount as Bonus_Amount
from employees e
left join bonuses b
on e.employee_id = b.employee_id
where b.employee_id is null;

-- Q6. Display all managers along with the employees they manage, including manager who manage no employees.

select * from employees;

select m.employee_name as manager_name, 
       e.employee_name as Employee_name
from employees m
left join employees e
on m.employee_id = e.manager_id 
where e.manager_id in (select distinct employee_id 
from employees
where manager_id is null);

select distinct employee_id 
from employees
where manager_id is null;

-- Q7. Find employees working on more than one project.
select e.employee_name as Employee_name,
       COUNT(ep.project_id) as Projects
from employees e
inner join employee_projects ep
on e.employee_id = ep.employee_id
group by e.employee_name, ep.project_id 
having COUNT(ep.project_id) >1;

-- Q8. find employees who are not assigned to any projects;
select e.employee_name, ep.employee_id
from employees e
left join employee_projects ep
on e.employee_id = ep.employee_id
where ep.employee_id is null;

-- Q9. Find projects that currently have no employees assigned.
select e.employee_name, ep.employee_id
from employees e
left join employee_projects ep
on e.employee_id = ep.employee_id
where ep.employee_id is null;

--- Q10. Display client names along with the total number of orders placed.

select c.client_name, COUNT(o.order_id) As Total_orders
from clients c
left join orders_data o
on c.client_id= o.client_id
group by c.client_name;