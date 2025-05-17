drop table if exists Customers;

CREATE TABLE customers (
    customer_id                INTEGER PRIMARY KEY,
    customer_acct_num          VARCHAR(20),       -- Long numbers as strings
    first_name                 VARCHAR(50),
    last_name                  VARCHAR(50),
    customer_address           VARCHAR(100),
    customer_city              VARCHAR(50),
    customer_state_province    VARCHAR(50),
    customer_postal_code       VARCHAR(20),       -- ZIP may have letters (e.g., Canada)
    customer_country           VARCHAR(50),
    birthdate                  DATE,
    marital_status             CHAR(1),           -- 'M' or 'S'
    yearly_income              VARCHAR(20),       -- Income ranges as strings
    gender                     CHAR(1),           -- 'M' or 'F'
    total_children             INTEGER,
    num_children_at_home       INTEGER,
    education                  VARCHAR(50),
    acct_open_date             DATE,
    member_card                VARCHAR(20),
    occupation                 VARCHAR(50),
    homeowner                  CHAR(1),           -- 'Y' or 'N'
    upgrade                    VARCHAR(10)        -- 'yes' or 'no'
);

					 
select * from Customers;

--- load the csv file.
COPY 
customers(customer_id,  customer_acct_num, first_name,last_name,customer_address,
             customer_city, customer_state_province,customer_postal_code, customer_country,
			 birthdate, marital_status, yearly_income, gender, num_children_at_home, education,
			  acct_open_date, member_card, occupation, homeowner, upgrade )
FROM 'D:\Practice query\Sales Dataset\Customers.csv' 
DELIMITER ',' 
CSV HEADER;

-- retrieve data from the table

select * from customers;
select * from products;
select * from regions;
select * from stores;
select * from transaction_1997;




-- 








