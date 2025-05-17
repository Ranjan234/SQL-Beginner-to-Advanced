drop table if exists products;

create table products( product_id  INTEGER PRIMARY KEY,
                       product_brand  VARCHAR(50),
					   product_name  VARCHAR(50),
                       product_sku   VARCHAR(20),
					   product_retail_price  DECIMAL(10,2),
					   product_cost  DECIMAL(10,2),
					   product_weight DECIMAL(10,2),
                       recyclable INT,
					   low_fat INT					   
);

 select * from products;
 
--- load the csv file.
COPY 
products( product_id, product_brand, product_name, product_sku,product_retail_price,
		product_cost,product_weight,recyclable,low_fat
)
FROM '‪D:\Practice query\Sales Dataset\Products.csv.csv' 
DELIMITER ',' 
CSV HEADER;

