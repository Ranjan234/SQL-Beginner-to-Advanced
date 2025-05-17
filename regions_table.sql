drop table if exists regions;

create table regions(region_id INTEGER PRIMARY KEY,
                     sales_district VARCHAR(50),
					 sales_region  VARCHAR(50) );

select * from regions;					 