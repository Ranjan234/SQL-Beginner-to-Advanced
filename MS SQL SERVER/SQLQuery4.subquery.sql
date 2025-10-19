
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- Insert data into Customers table
INSERT INTO Customers (customer_id, customer_name, email)
VALUES 
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES 
(101, 1, '2024-07-15', 250.00),
(102, 1, '2024-08-05', 300.00),
(103, 2, '2024-08-10', 150.00),
(104, 3, '2024-06-25', 100.00);



select * from Customers;

select * from Orders;

select * from Customers
where customer_id in(
   select distinct customer_id from orders 
   where order_date between '2024-08-01' and '2024-08-31');

select * from Customers
where customer_id in(
   select distinct customer_id from Orders 
   where order_date not between '2024-08-01' and '2024-08-31');
   
use [employee_details];

select * from [dbo].[Employees];
--Fetch the data from employees table where salary > average salary

select * from [dbo].[Employees] where Salary > (
select avg(salary) from [dbo].[Employees]
)


select avg(salary) from [dbo].[Employees]

---- CONSTRAINTS
--- Conditions that can be applied on columns of a table conditions are to be followed while 
-- inserting records into the table
create database constraints;

use constraints;

--NOT NULL constraints

-- Case 1-we will have to create a enw table
create table test_not_null(EID int not null,
 age tinyint,
 firstname varchar(256));

 select * from test_not_null;
 select * from INFORMATION_SCHEMA.COLUMNS
 where TABLE_NAME like 'test_not_null';

 insert into test_not_null values(1,23,'Mayank');
 insert into test_not_null values(null,23,'Mayank');
  insert into test_not_null values(2,null,'Raj');

 
-- Case 2. the table already exists
-- we want to make firstname column nullable

alter table test_not_null
alter column firstname varchar(256) not null

insert into test_not_null values(21,24,null)

alter table test_not_null
alter column age tinyint not null

select * from test_not_null