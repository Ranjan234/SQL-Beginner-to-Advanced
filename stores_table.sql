drop table if exists stores;

create table stores ( store_id  INT PRIMARY KEY,
                      region_id  INT,
                      store_type TEXT,
                      store_name  TEXT,
                      store_street_address TEXT,
                      store_city  TEXT,
                      store_state TEXT,
                      store_country TEXT,
                      store_phone TEXT,
                      first_opened_date DATE,
                      last_remodel_date DATE, 
                      total_sqft  INT,
                       grocery_sqft INT );

SELECT * FROM STORES;					   