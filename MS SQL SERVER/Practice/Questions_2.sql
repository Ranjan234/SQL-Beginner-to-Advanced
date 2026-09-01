use sql_interview;

CREATE TABLE employees (
    employee_id       INT PRIMARY KEY,
    employee_name     VARCHAR(100),
    gender            VARCHAR(10),
    department        VARCHAR(50),
    salary            INT,
    manager_id        INT,
    hire_date         DATE,
    city              VARCHAR(50),
    state             VARCHAR(50),
    email             VARCHAR(100),
    employment_status VARCHAR(20),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, employee_name, gender, department, salary, manager_id, hire_date, city, state, email, employment_status) VALUES
(1, 'Raj Sharma',   'Male',   'IT',        120000, NULL, '2012-03-01', 'Mumbai',    'Maharashtra', 'raj.sharma@company.com',   'Active'),
(2, 'Ankit Verma',  'Male',   'HR',         90000, NULL, '2015-06-15', 'Delhi',     'Delhi',       'ankit.verma@company.com',  'Active'),
(3, 'Priya Singh',  'Female', 'Finance',   100000, NULL, '2010-09-20', 'Pune',      'Maharashtra', 'priya.singh@company.com',  'Active'),
(4, 'Amit Patel',   'Male',   'Sales',      85000, NULL, '2017-01-10', 'Bangalore', 'Karnataka',   'amit.patel@company.com',   'Active'),
(5, 'Neha Joshi',   'Female', 'Marketing',  88000, NULL, '2014-04-05', 'Hyderabad', 'Telangana',   'neha.joshi@company.com',   'Active'),
(6, 'Rohit Mehta',  'Male',   'Support',    75000, NULL, '2018-07-22', 'Chennai',   'Tamil Nadu',  'rohit.mehta@company.com',  'Active'),
(7, 'Sneha Kapoor', 'Female', 'IT',        115000, NULL, '2011-11-30', 'Mumbai',    'Maharashtra', 'sneha.kapoor@company.com', 'Active'),
(8, 'Kunal Shah',   'Male',   'Finance',   105000, NULL, '2013-02-14', 'Ahmedabad', 'Gujarat',     'kunal.shah@company.com',   'Active'),
(9,  'Aarav Sharma',  'Male',   'IT',        75000,  1, '2021-01-15', 'Mumbai',    'Maharashtra', 'aarav@gmail.com',    'Active'),
(10, 'Priya Mehta',   'Female', 'HR',        55000,  2, '2020-03-10', 'Delhi',     'Delhi',       'priya@gmail.com',    'Active'),
(11, 'Rohit Jain',    'Male',   'Finance',   68000,  3, '2019-07-23', 'Pune',      'Maharashtra', 'rohit@gmail.com',    'Active'),
(12, 'Sneha Patil',   'Female', 'IT',        80000,  1, '2022-02-12', 'Mumbai',    'Maharashtra', 'sneha@gmail.com',    'Active'),
(13, 'Vikas Singh',   'Male',   'Sales',     45000,  4, '2021-11-05', 'Bangalore', 'Karnataka',   'vikas@gmail.com',    'Active'),
(14, 'Anjali Verma',  'Female', 'Marketing', 60000,  5, '2020-09-17', 'Hyderabad', 'Telangana',   'anjali@gmail.com',   'Active'),
(15, 'Karan Shah',    'Male',   'IT',        95000,  1, '2018-04-19', 'Mumbai',    'Maharashtra', 'karan@gmail.com',    'Active'),
(16, 'Meera Joshi',   'Female', 'HR',        53000,  2, '2021-06-14', 'Pune',      'Maharashtra', 'meera@gmail.com',    'Active'),
(17, 'Pooja Nair',    'Female', 'Finance',   72000,  3, '2019-12-01', 'Chennai',   'Tamil Nadu',  'pooja@gmail.com',    'Active'),
(18, 'Low Salary',    'Male',   'Support',   25000,  6, '2023-01-01', 'Pune',      'Maharashtra', 'low@gmail.com',      'Active'),
(19, 'Arjun Gupta',   'Male',   'IT',        78000,  1, '2020-08-11', 'Mumbai',    'Maharashtra', 'arjun@gmail.com',    'Active'),
(20, 'Rahul Kapoor',  'Male',   'Sales',     47000,  4, '2023-01-08', 'Delhi',     'Delhi',       'rahul@gmail.com',    'Active'),
(21, 'Simran Kaur',   'Female', 'Marketing', 62000,  5, '2022-10-09', 'Chandigarh','Punjab',      'simran@gmail.com',   'Active'),
(22, 'Aman Mishra',   'Male',   'HR',        54000,  2, '2021-04-30', 'Lucknow',   'UP',          'aman@gmail.com',     'Active'),
(23, 'Dev Malhotra',  'Male',   'Finance',   67000,  3, '2017-03-15', 'Delhi',     'Delhi',       'dev@gmail.com',      'Active'),
(24, 'Nisha Rao',     'Female', 'IT',        83000,  1, '2021-05-25', 'Bangalore', 'Karnataka',   'nisha@gmail.com',    'Active'),
(25, 'Ravi Kumar',    'Male',   'Support',   30000,  6, '2022-05-15', 'Chennai',   'Tamil Nadu',  'ravi@gmail.com',     'Active'),
(26, 'Yash Thakur',   'Male',   'Sales',     50000,  4, '2022-01-20', 'Mumbai',    'Maharashtra', 'yash@gmail.com',     'Active'),
(27, 'Ritika Sen',    'Female', 'Marketing', 59000,  5, '2019-11-13', 'Kolkata',   'West Bengal', 'ritika@gmail.com',   'Active'),
(28, 'Tanvi Desai',   'Female', 'HR',        52000,  2, '2019-09-27', 'Ahmedabad', 'Gujarat',     'tanvi@gmail.com',    'On Leave'),
(29, 'Mohit Arora',   'Male',   'IT',        91000,  7, '2018-07-07', 'Delhi',     'Delhi',       'mohit@gmail.com',    'Active'),
(30, 'Kriti Sharma',  'Female', 'Finance',   71000,  3, '2020-12-21', 'Pune',      'Maharashtra', 'kriti@gmail.com',    'Active'),
(31, 'Neha Iyer',     'Female', 'Sales',     49000,  4, '2023-03-18', 'Chennai',   'Tamil Nadu',  'nehaiyer@gmail.com', 'Active'),
(32, 'Varun Sethi',   'Male',   'Marketing', 61000,  5, '2020-01-05', 'Delhi',     'Delhi',       'varun@gmail.com',    'Active'),
(33, 'Harsh Pandey',  'Male',   'IT',        76000,  7, '2022-06-11', 'Mumbai',    'Maharashtra', 'harsh@gmail.com',    'On Leave'),
(34, 'Divya Pillai',  'Female', 'Support',   32000,  6, '2021-09-10', 'Hyderabad', 'Telangana',   'divya@gmail.com',    'On Leave'),
(35, 'Isha Kulkarni', 'Female', 'Finance',   69000,  3, '2021-08-14', 'Pune',      'Maharashtra', 'isha@gmail.com',     'Active'),
(36, 'Sonal Jain',    'Female', 'HR',        51000,  2, '2023-04-04', 'Jaipur',    'Rajasthan',   'sonal@gmail.com',    'Active'),
(37, 'Aisha Khan',    'Female', 'Sales',     46000,  4, '2022-02-28', 'Hyderabad', 'Telangana',   'aisha@gmail.com',    'Inactive'),
(38, 'Siddharth Roy', 'Male',   'IT',        87000,  1, '2018-05-17', 'Kolkata',   'West Bengal', 'sid@gmail.com',      'Active'),
(39, 'Preeti Das',    'Female', 'Marketing', 64000,  5, '2020-10-10', 'Kolkata',   'West Bengal', 'preeti@gmail.com',   'Terminated'),
(40, 'Rajat Saxena',  'Male',   'Finance',   73000,  3, '2019-06-06', 'Delhi',     'Delhi',       'rajat@gmail.com',    'Terminated'),
(41, 'Akash Yadav',   'Male',   'IT',        88000,  7, '2017-08-22', 'Lucknow',   'UP',          'akash@gmail.com',    'Active'),
(42, 'No Manager',    'Male',   'Finance',   65000, NULL, '2020-02-20', 'Nagpur',  'Maharashtra', 'nomgr@gmail.com',    'Active'),
(43, 'Same Salary A', 'Female', 'IT',        70000,  1, '2021-03-03', 'Mumbai',    'Maharashtra', 'same1@gmail.com',    'Active'),
(44, 'Same Salary B', 'Male',   'IT',        70000,  1, '2021-03-04', 'Mumbai',    'Maharashtra', 'same2@gmail.com',    'Active'),
(45, 'High Salary',   'Female', 'IT',       150000,  1, '2016-05-15', 'Mumbai',    'Maharashtra', 'high@gmail.com',     'Active'),
(46, 'Test User',     'Female', 'IT',          NULL,  1, '2022-09-01', 'Mumbai',   'Maharashtra', 'test@gmail.com',     'Inactive'),
(47, 'NULL Employee', 'Male',    NULL,       40000, NULL, '2023-02-10', 'Indore',  NULL,          NULL,                 'Inactive'),
(48, 'Aarav Sharma',  'Male',   'IT',        75000,  1, '2021-01-15', 'Mumbai',    'Maharashtra', 'aarav@gmail.com',    'Active'),
(49, 'Rohit Jain',    'Male',   'Finance',   68000,  3, '2019-07-23', 'Pune',      'Maharashtra', 'rohit@gmail.com',    'Active'),
(50, 'Priya Mehta',   'Female', 'HR',        55000,  2, '2020-03-10', 'Delhi',     'Delhi',       'priya@gmail.com',    'Active'),
(51, 'Vikas Singh',   'Male',   'Sales',     45000,  4, '2021-11-05', 'Bangalore', 'Karnataka',   'vikas@gmail.com',    'Active'),
(52, 'Anjali Verma',  'Female', 'Marketing', 60000,  5, '2020-09-17', 'Hyderabad', 'Telangana',   'anjali@gmail.com',   'Active');

--- Show table\
select * from employees;

-- Find all ,unique departments available in the comapny.
select distinct(department) as department_name
from employees
where department is not null
;

-- Find all employees who belong from the IT department;
select *
from employees
where department like '%IT';
;

-- find employees earning more than 80000;
select *
from employees
where salary >80000;

-- Find IT employees earning more than 80000;

select employee_name,department, salary
from employees
where department like '%IT'
group by employee_name, department, salary
having salary >80000;
-- 
select *
from employees
where department like '%IT' and  salary >80000;

-- Find employees who work in either IT or Finance department;
select *
from employees
where department like '%IT' or department like '%Finance';

-- Find employees who are not currently active.
select *
from employees
 where employment_status <> 'Active';

-- Find employees who are working in IT, HR,  or FInance department.
select *
from employees
where department in ('IT', 'HR') or department = 'Finance'; 

select *
from employees
where department in ('IT', 'HR', 'Finance'); 

-- Find employees whos salary between in 50000 and 80000;

select *
from employees
where salary between 50000 and  80000;

-- Find employees whos name starts with A.
select *
from employees
where employee_name like 'A%';

-- Find employees whos email belongs to Gmail.
select *
from employees
where email like '%@gmail.com';

--- Find active employees whos name starts with 'S';
select *
from employees
where employee_name like 'S%' and employment_status ='Active';

--- Find employees who don't have a manger asigned.
select *
from employees
where manager_id is null;

--- Find employees where email is not available
select *
from employees
where email is not null;

-- Find employees sorted by salary from lowest to highest.
select employee_name, salary
from employees
where salary is not null
order by salary asc;

-- Find top 3 highest-paid employees from IT and finance departments whose salary is between 70000 and 100000;
select  top 3 *
from employees
where department in ('IT', 'Finance') and salary between 70000 and 100000
order by salary desc
;

-- Upadte 
select *
from employees;

select count(*)
from employees;

update employees
set employee_name = 'Soumya Sahu', department = 'IT'
where employee_id = 2;

delete from employees
where manager_id = 2;