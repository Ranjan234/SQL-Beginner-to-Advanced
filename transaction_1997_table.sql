drop table if exists transaction_1997;

create table transaction_1997( transaction_date Date,
                               stock_date  date,
                               product_id int,
                               customer_id int,
                               store_id int,
							   quantity int );

select * from transaction_1997;